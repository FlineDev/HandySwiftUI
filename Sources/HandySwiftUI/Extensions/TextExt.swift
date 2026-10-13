import HandySwift
import SwiftUI

extension Text {
   /// Creates a ``Text`` view using the `description` parameter of the provided ``CustomStringConvertible`` instance.
   public init(convertible: CustomStringConvertible) {
      self.init(convertible.description)
   }

   /// Initializes a Text from custom HTML-like markings by applying the given formatters on each marked substring. Supports SF Symbol replacement via `<lock.filled/>`.
   ///
   /// For example:
   ///   ```
   ///   Text(
   ///     format: "Text with <red>custom colored</red> substring <checkmark.seal/>, or <highlight>highlighted</highlight> in other ways.",
   ///     partialStyling: [
   ///       "red": { $0.foregroundColor(.red) },
   ///       "highlight": { $0.bold().italic() },
   ///       "checkmark.seal": { $0.foregroundColor(.gray) }
   ///     ]
   ///   )
   ///   ```
   ///
   /// - NOTE: Does not support nesting of formatted substrings for performance reasons.
   /// - TIP: There's a `.htmlTags` pre-defined `partialStyling` you can use with support for some basic modifiers.
   ///
   /// - Parameters:
   ///   - format: The string to be rendered as a Text.
   ///   - partialStyling: A dictionary with keys serving as names for HTML-like tags and values creating custom formatted `Text` objects for substrings.
   public init(
      format formatString: String,
      partialStyling: [String: (Text) -> Text] = [:]
   ) {
      var subtexts: [Text] = []
      var previousRange: Range<String.Index>?

      // Either a paired tag like `<b>bold</b>` (captures: opening tag, content, closing tag) or a symbol tag like `<lock.filled/>`
      let regex = #/<([^<>]+)>([^<>]+)</([^<>]+)>|<([^<>]+)/>/#
      for match in formatString.matches(of: regex) {
         let prefix = formatString[(previousRange?.upperBound ?? formatString.startIndex)..<match.range.lowerBound]
         if !prefix.isEmpty {
            subtexts.append(Text(verbatim: String(prefix)))
         }

         if let openingTag = match.output.1, let content = match.output.2, let closingTag = match.output.3 {
            guard
               openingTag == closingTag,
               let style = partialStyling[String(openingTag)]
            else {
               subtexts.append(Text(verbatim: String(match.output.0)))
               previousRange = match.range
               continue
            }

            subtexts.append(style(Text(verbatim: String(content))))
         } else if let symbolName = match.output.4 {
            let symbolText = Text(Image(systemName: String(symbolName)))
            subtexts.append(partialStyling[String(symbolName)]?(symbolText) ?? symbolText)
         }

         previousRange = match.range
      }

      let suffix = String(formatString[(previousRange?.upperBound ?? formatString.startIndex)..<formatString.endIndex])
      subtexts.append(Text(verbatim: suffix))

      // Joins the parts by interpolating them into one text, as concatenating texts with `+` is deprecated starting with iOS 26
      var interpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: subtexts.count)
      for subtext in subtexts {
         interpolation.appendInterpolation(subtext)
      }
      self.init(LocalizedStringKey(stringInterpolation: interpolation), bundle: .module)
   }
}

extension Dictionary where Key == String, Value == (Text) -> Text {
   /// Pre-defined `Text` formatters using HTML tags for usage with `Text(format:partialStyling:)`.
   /// Inspiration: https://www.w3schools.com/html/html_formatting.asp
   ///
   /// Supported tags:
   /// - "b": Applies `.bold()` modifier.
   /// - "sb": Applies `.fontWeight(.semibold)` modifier.
   /// - "i": Applies `.italic()` modifier.
   /// - "bi": Applies both the `.bold()` and the `.italic()` modifiers.
   /// - "sbi": Applies both the `.fontWeight(.semibold)` and the `.italic()` modifiers.
   /// - "del": Applies `.strikethrough()` modifier.
   /// - "ins": Applies `.underline()` modifier.
   /// - "sub": Applies `.baselineOffset(5)` modifier.
   /// - "sup": Applies `.baselineOffset(-5)` modifier.
   public static var htmlLike: Self {
      [
         "b": { $0.bold() },
         "sb": { $0.fontWeight(.semibold) },
         "i": { $0.italic() },
         "bi": { $0.bold().italic() },
         "sbi": { $0.fontWeight(.semibold).italic() },
         "del": { $0.strikethrough() },
         "ins": { $0.underline() },
         "sub": { $0.baselineOffset(-4) },
         "sup": { $0.baselineOffset(6) },
      ]
   }
}

#if DEBUG
   #Preview {
      VStack(spacing: 30) {
         Text(format: "Test without any matches.")
         Text(format: "<b>A</b> <i>B</i> LOST <checkmark.seal/><bi>C</bi> D", partialStyling: .htmlLike)
         Text(
            format:
               "Normal <b>bold</b> <sb>semibold</sb> <checkmark.seal/> <i>italic</i>, <b>bold</b><sub>sub</sub> <ins>insert</ins> <del>delete</del> <i>another italic</i> <sbi>semibold & italic</sbi><sup>sup</sup> <chart.bar.fill/> custom <cb>colored & bold</cb>.",
            partialStyling: Dictionary.htmlLike.merging(
               [
                  "cb": { $0.bold().foregroundColor(.systemOrange) },
                  "checkmark.seal": { $0.foregroundColor(.green) },
                  "chart.bar.fill": { $0 },
               ]
            ) { $1 }
         )
      }
      .macOSOnlyPadding()
   }
#endif
