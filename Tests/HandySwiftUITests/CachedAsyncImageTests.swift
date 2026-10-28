import Foundation
import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct CachedAsyncImageTests {
   typealias DefaultImage = CachedAsyncImage<ProgressView<EmptyView, EmptyView>>

   enum DownloadError: Error {
      case offline
   }

   /// A 1×1 pixel PNG.
   nonisolated static let pngData = Data(
      base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg=="
   )!

   /// A URL that no other test uses, so the shared image cache does not interfere.
   func uniqueURL() -> URL {
      URL(string: "https://example.com/\(UUID().uuidString).png")!
   }

   @Test
   func failedDownloadEndsInFailedPhase() async {
      let loader = DefaultImage.Loader(fetchData: { _ in throw DownloadError.offline })
      await loader.load(self.uniqueURL())
      #expect(loader.phase == .failed)
   }

   @Test
   func dataThatIsNotAnImageEndsInFailedPhase() async {
      let loader = DefaultImage.Loader(fetchData: { _ in Data("<html>Not Found</html>".utf8) })
      await loader.load(self.uniqueURL())
      #expect(loader.phase == .failed)
   }

   @Test
   func successfulDownloadEndsInLoadedPhaseAndIsCached() async {
      let counter = Counter()
      let loader = DefaultImage.Loader(fetchData: { _ in
         await counter.increment()
         return Self.pngData
      })
      let url = self.uniqueURL()

      await loader.load(url)
      guard case .loaded = loader.phase else {
         Issue.record("Expected the loaded phase, got \(loader.phase)")
         return
      }

      await DefaultImage.Loader(fetchData: { _ in
         await counter.increment()
         return Self.pngData
      }).load(url)
      #expect(await counter.value == 1)
   }

   @Test
   func differentPlaceholdersShareCachedImage() async {
      let counter = Counter()
      let fetchData: @Sendable (URL) async throws -> Data = { _ in
         await counter.increment()
         return Self.pngData
      }
      let defaultLoader = DefaultImage.Loader(fetchData: fetchData)
      let customLoader = CachedAsyncImage<Text>.Loader(fetchData: fetchData)
      let url = self.uniqueURL()

      await defaultLoader.load(url)
      guard case .loaded(let firstImage) = defaultLoader.phase else {
         Issue.record("Expected the default placeholder loader to load the image")
         return
      }

      await customLoader.load(url)
      guard case .loaded(let secondImage) = customLoader.phase else {
         Issue.record("Expected the custom placeholder loader to load the cached image")
         return
      }

      #expect(await counter.value == 1)
      #expect(firstImage === secondImage)
   }

   @Test
   func defaultInitUsesProgressViewAsPlaceholder() {
      let image = CachedAsyncImage(url: self.uniqueURL())
      #expect(type(of: image) == CachedAsyncImage<ProgressView<EmptyView, EmptyView>>.self)
   }

   @Test
   func customPlaceholderIsUsed() {
      let image = CachedAsyncImage(url: self.uniqueURL()) { Text("Loading") }
      #expect(image.placeholder() == Text("Loading"))
   }

   actor Counter {
      var value = 0
      func increment() { self.value += 1 }
   }
}
