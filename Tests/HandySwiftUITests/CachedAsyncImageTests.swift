import Foundation
import Testing

@testable import HandySwiftUI

@MainActor
struct CachedAsyncImageTests {
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
      let loader = CachedAsyncImage.Loader(fetchData: { _ in throw DownloadError.offline })
      await loader.load(self.uniqueURL())
      #expect(loader.phase == .failed)
   }

   @Test
   func dataThatIsNotAnImageEndsInFailedPhase() async {
      let loader = CachedAsyncImage.Loader(fetchData: { _ in Data("<html>Not Found</html>".utf8) })
      await loader.load(self.uniqueURL())
      #expect(loader.phase == .failed)
   }

   @Test
   func successfulDownloadEndsInLoadedPhaseAndIsCached() async {
      let counter = Counter()
      let loader = CachedAsyncImage.Loader(fetchData: { _ in
         await counter.increment()
         return Self.pngData
      })
      let url = self.uniqueURL()

      await loader.load(url)
      guard case .loaded = loader.phase else {
         Issue.record("Expected the loaded phase, got \(loader.phase)")
         return
      }

      await CachedAsyncImage.Loader(fetchData: { _ in
         await counter.increment()
         return Self.pngData
      }).load(url)
      #expect(await counter.value == 1)
   }

   actor Counter {
      var value = 0
      func increment() { self.value += 1 }
   }
}
