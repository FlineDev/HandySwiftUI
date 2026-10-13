import SwiftUI
import Testing

@testable import HandySwiftUI

@MainActor
struct LocalizationTests {
   nonisolated static let catalogLanguages: [String] = Bundle.module.localizations.filter { $0 != "en" }.sorted()

   nonisolated static func translation(of key: String, in language: String) -> String? {
      guard
         let path = Bundle.module.path(forResource: language, ofType: "lproj"),
         let bundle = Bundle(path: path)
      else { return nil }

      let value = bundle.localizedString(forKey: key, value: "⚠️ missing", table: nil)
      return value == "⚠️ missing" ? nil : value
   }

   @Test
   func catalogCoversAllLanguages() {
      #expect(Self.catalogLanguages.count == 37)
   }

   @Test(arguments: ["None", "Done"])
   func keyIsTranslatedIntoEveryLanguage(key: String) {
      for language in Self.catalogLanguages {
         #expect(Self.translation(of: key, in: language) != nil, "\(key) has no \(language) translation")
      }
   }

   /// Renders a text with the given language as environment locale.
   func render(_ text: Text, language: String) -> Data? {
      renderedPixels(of: text.environment(\.locale, Locale(identifier: language)))
   }

   /// Checks that the text no longer renders the English source in the given language. A pixel-exact comparison with the expected
   /// translation is not possible for every language: localized texts pick language-specific glyphs (Chinese, Bulgarian) that a
   /// verbatim reference text does not get.
   func expectLocalized(_ text: Text, key: String, language: String) throws {
      let translation = try #require(Self.translation(of: key, in: language))
      guard translation != key else { return }

      let englishSource = self.render(Text(verbatim: key), language: language)
      #expect(self.render(text, language: language) != englishSource, "'\(key)' still renders in English for \(language)")
   }

   @Test(arguments: catalogLanguages)
   func noSelectionTextIsLocalized(language: String) throws {
      try self.expectLocalized(SearchableGridPicker<SFSymbol>.noSelectionText, key: "None", language: language)
   }

   @Test(arguments: catalogLanguages)
   func doneButtonTextIsLocalized(language: String) throws {
      try self.expectLocalized(MultiSelectionView<SFSymbol>.doneButtonText, key: "Done", language: language)
   }
}
