#if canImport(WebKit)
import SwiftUI
import HandySwift
import WebKit
#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

/// A cross-platform WebView wrapper for SwiftUI that handles URL loading and external link navigation.
/// Supports iOS, macOS, and iPadOS with consistent behavior across platforms.
///
/// Example usage:
/// ```swift
/// struct ContentView: View {
///     var body: some View {
///         WebView(
///             url: URL(string: "https://example.com")!,
///             scrollOffsetOnPageLoad: CGPoint(x: 0, y: 200)
///         ) { externalURL in
///             print("Opening external URL: \(externalURL)")
///         }
///     }
/// }
/// ```
public struct WebView: View {
   #if canImport(UIKit)
   typealias NativeViewRepresentable = UIViewRepresentable
   #else
   typealias NativeViewRepresentable = NSViewRepresentable
   #endif

   struct WebViewRepresentable: NativeViewRepresentable {
      let url: URL
      let scrollOffsetOnPageLoad: CGPoint?
      let onOpenExternalURL: (URL) -> Void

      #if canImport(UIKit)
      func makeUIView(context: Context) -> WKWebView {
         WKWebView()
      }

      func updateUIView(_ webView: WKWebView, context: Context) {
         webView.load(URLRequest(url: url))

         // Add an observer to know when the web content has finished loading
         webView.navigationDelegate = context.coordinator
      }
      #else
      func makeNSView(context: Context) -> WKWebView {
         WKWebView()
      }

      func updateNSView(_ webView: WKWebView, context: Context) {
         webView.load(URLRequest(url: url))

         // Add an observer to know when the web content has finished loading
         webView.navigationDelegate = context.coordinator
      }
      #endif

      // Coordinator to handle WKNavigationDelegate methods
      func makeCoordinator() -> Coordinator {
         Coordinator(parent: self)
      }

      final class Coordinator: NSObject, WKNavigationDelegate {
         var parent: WebViewRepresentable

         init(parent: WebViewRepresentable) {
            self.parent = parent
         }

         func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            if let scrollOffsetOnPageLoad = parent.scrollOffsetOnPageLoad {
               Task {
                  try await Task.sleep(for: .milliseconds(250))
                  let scrollScript = "window.scrollBy({ top: \(scrollOffsetOnPageLoad.y), left: \(scrollOffsetOnPageLoad.x), behavior: 'smooth' });"
                  try await webView.evaluateJavaScript(scrollScript)
               }
            }
         }

         func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping @MainActor (WKNavigationActionPolicy) -> Void
         ) {
            if let url = navigationAction.request.url, navigationAction.navigationType == .linkActivated {
               // Open in Safari
               #if canImport(UIKit)
               UIApplication.shared.open(url)
               #else
               NSWorkspace.shared.open(url)
               #endif
               self.parent.onOpenExternalURL(url)
               decisionHandler(.cancel) // Prevent the webView from loading the URL
            } else {
               // Allow other navigations within the webView
               decisionHandler(.allow)
            }
         }
      }
   }

   private let url: URL
   private let scrollOffsetOnPageLoad: CGPoint?
   private let onOpenExternalURL: (URL) -> Void

   /// Creates a new WebView that loads and displays content from the specified URL.
   /// - Parameters:
   ///   - url: The URL to load in the WebView
   ///   - scrollOffsetOnPageLoad: Optional initial scroll position after the page loads
   ///   - onOpenExternalURL: Callback closure executed when an external link is tapped
   public init(
      url: URL,
      scrollOffsetOnPageLoad: CGPoint? = nil,
      onOpenExternalURL: @escaping (URL) -> Void = { _ in }
   ) {
      self.url = url
      self.scrollOffsetOnPageLoad = scrollOffsetOnPageLoad
      self.onOpenExternalURL = onOpenExternalURL
   }

   public var body: some View {
      WebViewRepresentable(
         url: self.url,
         scrollOffsetOnPageLoad: self.scrollOffsetOnPageLoad,
         onOpenExternalURL: self.onOpenExternalURL
      )
   }
}

#if DEBUG
#Preview {
   WebView(url: URL(string: "https://www.justwatch.com/de/Film/Avatar-2")!, scrollOffsetOnPageLoad: .init(x: 0, y: 200))
}
#endif
#endif
