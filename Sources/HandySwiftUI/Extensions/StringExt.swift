import SwiftUI

extension String {
   /// Converts a hex color string to RGBA values.
   ///
   /// This method supports both 6-digit (RRGGBB) and 8-digit (RRGGBBAA) hex color strings,
   /// with or without a leading '#' character.
   ///
   /// - Returns: A tuple containing red, green, blue, and alpha values as CGFloat (0.0 to 1.0).
   ///
   /// - Example:
   ///   ```swift
   ///   let hexColor = "#FF8000"
   ///   let (r, g, b, a) = hexColor.toRGBA()
   ///   // r ≈ 1.0, g ≈ 0.5, b ≈ 0.0, a = 1.0
   ///   ```
   public func toRGBA() -> (r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
      var normalizedHex = self.trimmingCharacters(in: .whitespacesAndNewlines)
      normalizedHex = normalizedHex.replacingOccurrences(of: "#", with: "")

      var rgb: UInt64 = 0

      var r: CGFloat = 0.0
      var g: CGFloat = 0.0
      var b: CGFloat = 0.0
      var a: CGFloat = 1.0

      let length = normalizedHex.count

      Scanner(string: normalizedHex).scanHexInt64(&rgb)

      if length == 6 {
         r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
         g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
         b = CGFloat(rgb & 0x0000FF) / 255.0
      } else if length == 8 {
         r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
         g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
         b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
         a = CGFloat(rgb & 0x000000FF) / 255.0
      }

      return (r, g, b, a)
   }

   /// Highlights matching tokenized prefixes in the string based on a search text.
   ///
   /// This method creates an `AttributedString` with matching prefixes highlighted using the specified font.
   ///
   /// - Parameters:
   ///   - searchText: The text to search for within the string.
   ///   - locale: The locale to use for string comparisons. Defaults to `nil`.
   ///   - font: The font to apply to matching prefixes. Defaults to `.body.bold()`.
   ///
   /// - Returns: An `AttributedString` with matching prefixes highlighted.
   ///
   /// - Example:
   ///   ```swift
   ///   let text = "Hello, World!"
   ///   let highlighted = text.highlightMatchingTokenizedPrefixes(in: "He Wo")
   ///   // Returns an AttributedString with "He" and "Wo" in bold
   ///   ```
   @available(iOS 15, macOS 12, tvOS 15, visionOS 1, watchOS 8, *)
   public func highlightMatchingTokenizedPrefixes(in searchText: String, locale: Locale? = nil, with font: Font = .body.bold()) -> AttributedString {
      var attributedSelf = AttributedString(self)
      let normalizedSelf = self.folding(options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive], locale: locale)

      for token in searchText.tokenized() {
         if let range = AttributedString(normalizedSelf).range(of: token) {
            attributedSelf[range].font = font
         }
      }

      return attributedSelf
   }
}

extension String: NilPlaceholdable {
   /// The placeholder value to use when the string is nil.
   public static var nilPlaceholderValue: String { "" }
}
