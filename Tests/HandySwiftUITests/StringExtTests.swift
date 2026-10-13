import SwiftUI
import Testing

@testable import HandySwiftUI

struct StringExtTests {
   func highlightedParts(of text: String, searchText: String) -> [String] {
      let highlighted = text.highlightMatchingTokenizedPrefixes(in: searchText)
      return highlighted.runs.filter { $0.backgroundColor != nil }.map { String(highlighted[$0.range].characters) }
   }

   @Test
   func highlightsPlainMatches() {
      #expect(self.highlightedParts(of: "Hello, World!", searchText: "He Wo") == ["He", "Wo"])
   }

   @Test(
      arguments: [
         ("Café Olé", "ole", ["Olé"]),
         ("Ｈｅｌｌｏ World", "wor", ["Wor"]),
         ("Ärger über alles", "alles", ["alles"]),
         ("Ärger über alles", "uber", ["üb" + "er"]),
      ]
   )
   func highlightsTheMatchingCharactersWhenFoldingChangesTheLength(text: String, searchText: String, expected: [String]) {
      #expect(self.highlightedParts(of: text, searchText: searchText) == expected)
   }
}
