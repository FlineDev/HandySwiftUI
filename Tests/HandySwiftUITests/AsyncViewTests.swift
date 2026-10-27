import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct AsyncViewTests {
   func loadValue() async throws -> String { "value" }

   @Test
   func defaultInitsUseTheDefaultLoadingAndFailureViews() {
      let view = AsyncView(performTask: self.loadValue) { Text($0) }
      #expect(type(of: view) == AsyncView<String, Text, AsyncViewDefaultLoadingView, AsyncViewDefaultFailureView>.self)
   }

   @Test
   func loadingContentReplacesOnlyTheLoadingView() {
      let view = AsyncView(performTask: self.loadValue) { Text($0) }
         .loadingContent { Text("Please wait") }

      #expect(type(of: view) == AsyncView<String, Text, Text, AsyncViewDefaultFailureView>.self)
      #expect(view.loadingContent() == Text("Please wait"))
   }

   @Test
   func failureContentReceivesTheErrorMessageAndRetryAction() {
      var retryCount = 0
      let view = AsyncView(performTask: self.loadValue) { Text($0) }
         .failureContent { errorMessage, retry in
            Button(errorMessage, action: retry)
         }

      #expect(type(of: view) == AsyncView<String, Text, AsyncViewDefaultLoadingView, Button<Text>>.self)

      var receivedRetry: (() -> Void)?
      let customizedView = AsyncView(performTask: self.loadValue) { Text($0) }
         .failureContent { errorMessage, retry in
            receivedRetry = retry
            return Text(errorMessage)
         }

      // Calls the stored view builder directly, the way `body` does when the task failed
      let failureView = customizedView.failureContent("Offline", { retryCount += 1 })

      #expect(failureView == Text(verbatim: "Offline"))
      receivedRetry?()
      #expect(retryCount == 1)
   }

   @Test
   func modifiersKeepTheSuccessContent() {
      let view = AsyncView(performTask: self.loadValue) { Text($0) }
         .loadingContent { Text("Please wait") }
         .failureContent { errorMessage, _ in Text(errorMessage) }

      #expect(view.successContentCallback.perform(result: "done") == Text(verbatim: "done"))
   }
}
