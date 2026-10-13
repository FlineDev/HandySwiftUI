import Testing

@testable import HandySwiftUI

@MainActor
struct CachedAsyncImageTests {
   @Test
   func failedDownloadEndsLoading() {
      let state = CachedAsyncImage.loadingState(afterDownloading: nil)

      #expect(state.isLoading == false)
      #expect(state.image == nil)
   }

   @Test
   func successfulDownloadEndsLoadingWithImage() throws {
      #if canImport(UIKit)
         let image = try #require(CachedAsyncImage.NativeImage(systemName: "star"))
      #else
         let image = try #require(CachedAsyncImage.NativeImage(systemSymbolName: "star", accessibilityDescription: nil))
      #endif
      let state = CachedAsyncImage.loadingState(afterDownloading: image)

      #expect(state.isLoading == false)
      #expect(state.image === image)
   }
}
