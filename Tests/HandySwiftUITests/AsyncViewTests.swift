import HandySwiftUI
import SwiftUI
import Testing

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
   }

   @Test
   func failureContentAcceptsTheErrorMessageAndRetryAction() {
      let view = AsyncView(performTask: self.loadValue) { Text($0) }
         .failureContent { errorMessage, retry in
            Button(errorMessage, action: retry)
         }

      #expect(type(of: view) == AsyncView<String, Text, AsyncViewDefaultLoadingView, Button<Text>>.self)
   }

   @Test
   func modifiersSupportBothOrders() {
      let loadingFirst = AsyncView(performTask: self.loadValue) { Text($0) }
         .loadingContent { Text("Please wait") }
         .failureContent { errorMessage, _ in Text(errorMessage) }
      let failureFirst = AsyncView(performTask: self.loadValue) { Text($0) }
         .failureContent { errorMessage, _ in Text(errorMessage) }
         .loadingContent { Text("Please wait") }

      #expect(type(of: loadingFirst) == AsyncView<String, Text, Text, Text>.self)
      #expect(type(of: failureFirst) == AsyncView<String, Text, Text, Text>.self)
   }
}
