#if canImport(WebKit)
   import Foundation
   import Testing

   @testable import HandySwiftUI

   struct WebViewTests {
      let pageURL = URL(string: "https://fline.dev")!
      let otherPageURL = URL(string: "https://fline.dev/blog")!

      @Test
      func loadsWhenNothingWasLoadedYet() {
         #expect(WebView.WebViewRepresentable.needsLoad(self.pageURL, loadedURL: nil))
      }

      @Test
      func doesNotReloadTheSameURL() {
         #expect(!WebView.WebViewRepresentable.needsLoad(self.pageURL, loadedURL: self.pageURL))
      }

      @Test
      func loadsWhenTheURLChanged() {
         #expect(WebView.WebViewRepresentable.needsLoad(self.otherPageURL, loadedURL: self.pageURL))
      }
   }
#endif
