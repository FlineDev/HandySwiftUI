import SwiftUI

/// A SwiftUI view that asynchronously loads and displays an image from a URL with caching support.
/// The view shows a loading indicator while the image is being fetched and automatically caches
/// successful downloads for faster subsequent loads.
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
   class ImageCache: @unchecked Sendable {
      static let shared = ImageCache()
      private var cache = NSCache<NSURL, NativeImage>()

      private init() {}

      func image(for url: NSURL) -> NativeImage? {
         self.cache.object(forKey: url)
      }

      func insertImage(_ image: NativeImage?, for url: NSURL) {
         guard let image = image else { return }
         self.cache.setObject(image, forKey: url)
      }
   }

   let url: URL

   @State var image: NativeImage?
   @State var isLoading = false

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

   public var body: some View {
      Group {
         if let image = image {
            #if canImport(UIKit)
            Image(uiImage: image)
               .resizable()
               .aspectRatio(contentMode: .fill)
            #else
            Image(nsImage: image)
               .resizable()
               .aspectRatio(contentMode: .fill)
            #endif
         } else {
            if self.isLoading {
               ProgressView()
            } else {
               Color.clear
                  .onAppear(perform: self.loadImage)
            }
         }
      }
      .onChange(of: self.url) { _ in
         self.loadImage()
      }
   }

   private func loadImage() {
      if let cachedImage = ImageCache.shared.image(for: url as NSURL) {
         withAnimation {
            self.image = cachedImage
         }
         return
      }

      withAnimation {
         self.isLoading = true
      }

      URLSession.shared.dataTask(with: url) { data, response, error in
         guard let data = data, let downloadedImage = NativeImage(data: data) else { return }

         DispatchQueue.main.async {
            withAnimation {
               self.isLoading = false
               self.image = downloadedImage
            }
            ImageCache.shared.insertImage(downloadedImage, for: url as NSURL)
         }
      }.resume()
   }
}

#if DEBUG
#Preview {
   CachedAsyncImage(url: URL(string: "https://picsum.photos/200")!)
}
#endif
