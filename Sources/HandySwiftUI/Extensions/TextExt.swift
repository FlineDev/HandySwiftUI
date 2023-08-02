import HandySwift
import SwiftUI

extension Text {
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
      
      let regex = try! Regex(#"<([^<>]+)>([^<>]+)</([^<>]+)>|<([^<>]+)/>"#)
      for match in regex.matches(in: formatString) {
         let prefix = formatString[(previousRange?.upperBound ?? formatString.startIndex)..<match.range.lowerBound]
         if !prefix.isEmpty {
            subtexts.append(Text(prefix))
         }
         
         let captures = match.captures.compactMap { $0 }
         switch captures.count {
         case 3: // the first part matched, e.g. `<b>bold</b>` => ["b", "bold", "b"]
            guard
               captures[0] == captures[2],
               let style = partialStyling[captures[0]]
            else {
               subtexts.append(Text(match.string))
               previousRange = match.range
               continue
            }
            
            subtexts.append(style(Text(captures[1])))
            previousRange = match.range
            
         case 1: // the second part matched, e.g. `<lock.filled/>` => ["lock.filled"]
            if let style = partialStyling[captures[0]] {
               subtexts.append(style(Text(Image(systemName: captures[0]))))
            } else {
               subtexts.append(Text(Image(systemName: captures[0])))
            }
            previousRange = match.range
            
         default:
            fatalError("A match should have exactly 1 or 3 captures, found: \(captures).")
         }
      }
      
      let suffix = String(formatString[(previousRange?.upperBound ?? formatString.startIndex)..<formatString.endIndex])
      subtexts.append(Text(suffix))
      
      self = subtexts.reduce(Text("")) { $0 + $1 }
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
struct Text_Previews: PreviewProvider {
   static var previews: some View {
      VStack(spacing: 30) {
         Text(format: "Test without any matches.")
         Text(format: "<b>A</b> <i>B</i> LOST <checkmark.seal/><bi>C</bi> D", partialStyling: .htmlLike)
         Text(
            format:
               "Normal <b>bold</b> <sb>semibold</sb> <checkmark.seal/> <i>italic</i>, <b>bold</b><sub>sub</sub> <ins>insert</ins> <del>delete</del> <i>another italic</i> <sbi>semibold & italic</sbi><sup>sup</sup> <chart.bar.fill/> custom <cb>colored & bold</cb>.",
            partialStyling: Dictionary.htmlLike.merged(
               with: [
                  "cb": { $0.bold().foregroundColor(.systemOrange) },
                  "checkmark.seal": { $0.foregroundColor(.green) },
                  "chart.bar.fill": { $0 },
               ]
            )
         )
      }
      .previewComponents()
   }
}
#endif
