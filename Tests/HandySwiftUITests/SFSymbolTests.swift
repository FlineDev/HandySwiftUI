import Testing

@testable import HandySwiftUI

struct SFSymbolTests {
   /// Keeps the example in the documentation of `searchTerms` true.
   @Test
   func searchTermsMatchTheDocumentationExample() {
      #expect(SFSymbol.airplane.searchTerms == ["flight", "travel", "plane", "transportation", "journey"])
   }
}
