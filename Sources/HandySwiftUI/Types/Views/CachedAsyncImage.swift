import SwiftUI

/// A SwiftUI view that asynchronously loads and displays an image from a URL with caching support.
/// The view shows a loading indicator while the image is being fetched, a neutral placeholder if loading failed, and automatically
/// caches successful downloads for faster subsequent loads. A failed load is retried when the view appears again or the URL changes.
///
/// This view is particularly useful for scenarios where the same images might be loaded repeatedly,
/// such as in lists, grids, or carousel interfaces.
///
/// Note that `.resizable()` and `.aspectRatio(contentMode: .fill)` are already applied to the `Image` view.
///
/// Example usage in a product list:
/// ```swift
/// struct ProductView: View {
///     let product: Product
///
///     var body: some View {
///         VStack {
///             CachedAsyncImage(url: product.imageURL)
///                 .frame(width: 200, height: 200)
///                 .clipShape(RoundedRectangle(cornerRadius: 10))
///             Text(product.name)
///         }
///     }
/// }
///
/// struct ProductList: View {
///     let products: [Product]
///
///     var body: some View {
///         ScrollView {
///             LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
///                 ForEach(products) { product in
///                     ProductView(product: product)
///                 }
///             }
///         }
///     }
/// }
/// ```
public struct CachedAsyncImage: View {
   #if canImport(UIKit)
      typealias NativeImage = UIImage
   #elseif canImport(AppKit)
      typealias NativeImage = NSImage
   #endif

   /// Internal cache manager that provides thread-safe storage and retrieval of downloaded images.
   /// Uses `NSCache` for automatic memory management of cached images.
   final class ImageCache: @unchecked Sendable {
      static let shared = ImageCache()
      private let cache = NSCache<NSURL, NativeImage>()

      private init() {}

      func image(for url: NSURL) -> NativeImage? {
         self.cache.object(forKey: url)
      }

      func insertImage(_ image: NativeImage, for url: NSURL) {
         self.cache.setObject(image, forKey: url)
      }
   }

   /// Loads the image for the view and publishes the loading phase. A failed download ends in `.failed`, which the view shows as a
   /// placeholder and never retries on its own, so a URL that keeps failing does not cause a request loop.
   @MainActor
   final class Loader: ObservableObject {
      enum Phase: Equatable {
         case idle
         case loading
         case loaded(NativeImage)
         case failed
      }

      @Published private(set) var phase: Phase = .idle

      private let fetchData: @Sendable (URL) async throws -> Data

      init(fetchData: @escaping @Sendable (URL) async throws -> Data = { try await URLSession.shared.data(from: $0).0 }) {
         self.fetchData = fetchData
      }

      func load(_ url: URL) async {
         if let cachedImage = ImageCache.shared.image(for: url as NSURL) {
            self.setPhase(.loaded(cachedImage))
            return
         }

         self.setPhase(.loading)

         guard
            let data = try? await self.fetchData(url),
            let downloadedImage = NativeImage(data: data)
         else {
            // Without this, a failed download would either keep the progress view spinning or look like a load never started
            self.setPhase(.failed)
            return
         }

         ImageCache.shared.insertImage(downloadedImage, for: url as NSURL)
         self.setPhase(.loaded(downloadedImage))
      }

      private func setPhase(_ phase: Phase) {
         withAnimation {
            self.phase = phase
         }
      }
   }

   let url: URL

   @StateObject private var loader = Loader()

   /// Creates a new cached async image view that loads and displays an image from the specified URL.
   ///
   /// The view will first check its cache for a previously downloaded image. If not found,
   /// it will download the image asynchronously while showing a loading indicator.
   ///
   /// Example usage in a profile view:
   /// ```swift
   /// struct ProfileView: View {
   ///     let user: User
   ///
   ///     var body: some View {
   ///         VStack {
   ///             CachedAsyncImage(url: user.avatarURL)
   ///                 .frame(width: 100, height: 100)
   ///                 .clipShape(Circle())
   ///                 .overlay(Circle().stroke(Color.blue, lineWidth: 2))
   ///             Text(user.name)
   ///                 .font(.headline)
   ///             Text(user.bio)
   ///                 .font(.subheadline)
   ///         }
   ///         .padding()
   ///     }
   /// }
   /// ```
   ///
   /// - Parameter url: The URL of the image to load and display
   public init(url: URL) {
      self.url = url
   }

   #warning("🧑‍💻 add an init overload that accepts a custom placeholder view to be shown while loading instead of the progress view")

   public var body: some View {
      Group {
         switch self.loader.phase {
         case .idle:
            Color.clear

         case .loading:
            ProgressView()

         case .loaded(let image):
            #if canImport(UIKit)
               Image(uiImage: image)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
            #else
               Image(nsImage: image)
                  .resizable()
                  .aspectRatio(contentMode: .fill)
            #endif

         case .failed:
            Image(systemName: "photo")
               .foregroundStyle(.tertiary)
               .accessibilityHidden(true)
         }
      }
      // Runs when the view appears and again whenever the URL changes, and cancels the download when the view disappears
      .task(id: self.url) {
         await self.loader.load(self.url)
      }
   }
}

#if DEBUG
   #Preview {
      CachedAsyncImage(url: URL(string: "https://picsum.photos/200")!)
   }
#endif
