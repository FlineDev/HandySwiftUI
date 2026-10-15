#if canImport(WebKit)
   import Foundation
   import Testing
   import WebKit

   @testable import HandySwiftUI

   @MainActor
   struct WebViewTests {
      /// Records load requests instead of performing them.
      final class RecordingWebView: WKWebView {
         var loadedURLs: [URL?] = []

         override func load(_ request: URLRequest) -> WKNavigation? {
            self.loadedURLs.append(request.url)
            return nil
         }
      }

      let pageURL = URL(string: "https://fline.dev")!
      let otherPageURL = URL(string: "https://fline.dev/blog")!

      func representable(url: URL) -> HandySwiftUI.WebView.WebViewRepresentable {
         HandySwiftUI.WebView.WebViewRepresentable(url: url, scrollOffsetOnPageLoad: nil, onOpenExternalURL: { _ in })
      }

      @Test
      func repeatedUpdatesLoadTheURLOnlyOnce() {
         let webView = RecordingWebView()
         let representable = self.representable(url: self.pageURL)
         let coordinator = representable.makeCoordinator()

         // SwiftUI calls the update method on every state change of the surrounding view
         for _ in 0..<3 {
            representable.update(webView, coordinator: coordinator)
         }

         #expect(webView.loadedURLs == [self.pageURL])
         #expect(webView.navigationDelegate === coordinator)
      }

      @Test
      func updateWithChangedURLLoadsTheNewURL() {
         let webView = RecordingWebView()
         let coordinator = self.representable(url: self.pageURL).makeCoordinator()

         self.representable(url: self.pageURL).update(webView, coordinator: coordinator)
         self.representable(url: self.otherPageURL).update(webView, coordinator: coordinator)
         self.representable(url: self.otherPageURL).update(webView, coordinator: coordinator)

         #expect(webView.loadedURLs == [self.pageURL, self.otherPageURL])
         #expect(coordinator.parent.url == self.otherPageURL)
      }
   }
#endif
