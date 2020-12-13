import HandySwift
import SwiftUI

extension Text {
  /// Initializes a Text from custom HTML-like markings by applying the given formatters on each marked substring.
  ///
  /// For example:
  ///   ```
  ///   Text(
  ///     "Text with <red>custom colored</red> substring <checkmark.seal/>, or <highlight>highlighted</highlight> in other ways.",
  ///     customFormatting: [
  ///       "red": { $0.foregroundColor(.orange) },
  ///       "highlight": { $0.bold().italic() }
  ///     ],
  ///     systemImageNames: ["checkmark.seal": { $0.foregroundColor(.gray) }]
  ///   )
  ///   ```
  ///
  /// - NOTE: Does not support nesting of formatted substrings for performance reasons.
  /// - TIP: There's a `.htmlTags` pre-defined `customFormatting` you can use with support for some basic modifiers.
  ///
  /// - Parameters:
  ///   - text: The string to be rendered as a Text.
  ///   - customFormatting: A dictionary with keys serving as names for HTML-like tags and values creating custom formatted `Text` objects for substrings.
  ///   - formattedSystemImages: A dictionary with SF Symbol image names as keys and `Text` to `Text` modifier closures as values.
  public init(
    _ text: String,
    customFormatting: [String: (Text) -> Text],
    formattedSystemImages: [String: (Text) -> Text] = [:]
  ) {
    self = Text.withFormat(text: text, customFormatting: customFormatting, formattedSystemImages: formattedSystemImages)
  }

  private static func withFormat(
    text: String,
    customFormatting: [String: (Text) -> Text],
    formattedSystemImages: [String: (Text) -> Text]
  ) -> Text {
    var partials: [TextFormattingPartial] = [.unformatted(text)]

    for (key, formatting) in customFormatting {
      partials = self.partials(applying: formatting, for: key, on: partials)
    }

    for (systemName, modifiers) in formattedSystemImages {
      partials = self.partials(systemName: systemName, modifiers: modifiers, previousPartials: partials)
    }

    return partials.reduce(Text("")) { $0 + $1.textRepresentation }
  }

  private static func partials(
    applying formatting: (Text) -> Text,
    for key: String,
    on previousPartials: [TextFormattingPartial]
  ) -> [TextFormattingPartial] {
    previousPartials.flatMap { (partial: TextFormattingPartial) -> [TextFormattingPartial] in
      switch partial {
      case let .formatted(text):
        return [.formatted(text)]

      case let .unformatted(string):
        return self.partials(applying: formatting, for: key, in: string)
      }
    }
  }

  private static func partials(
    applying formatting: (Text) -> Text,
    for key: String,
    in string: String
  ) -> [TextFormattingPartial] {
    let textToFormatRegex = try! Regex(#"<\#(key)>([^<>]+)</\#(key)>"#)

    var partials: [TextFormattingPartial] = []
    var previousRange: Range<String.Index>?

    for match in textToFormatRegex.matches(in: string) {
      let prefix = String(string[(previousRange?.upperBound ?? string.startIndex)..<match.range.lowerBound])
      let captureText = Text(match.captures[0]!)

      partials.append(.unformatted(prefix))
      partials.append(.formatted(formatting(captureText)))
      previousRange = match.range
    }

    let suffix = String(string[(previousRange?.upperBound ?? string.startIndex)..<string.endIndex])
    partials.append(.unformatted(suffix))

    return partials
  }

  private static func partials(
    systemName: String,
    modifiers: (Text) -> Text,
    previousPartials: [TextFormattingPartial]
  ) -> [TextFormattingPartial] {
    previousPartials.flatMap { (partial: TextFormattingPartial) -> [TextFormattingPartial] in
      switch partial {
      case let .formatted(text):
        return [.formatted(text)]

      case let .unformatted(string):
        return self.partials(systemName: systemName, modifiers: modifiers, string: string)
      }
    }
  }

  private static func partials(
    systemName: String,
    modifiers: (Text) -> Text,
    string: String
  ) -> [TextFormattingPartial] {
    let textToFormatRegex = try! Regex(#"<\#(systemName)/>"#)

    var partials: [TextFormattingPartial] = []
    var previousRange: Range<String.Index>?

    for match in textToFormatRegex.matches(in: string) {
      let prefix = String(string[(previousRange?.upperBound ?? string.startIndex)..<match.range.lowerBound])
      let imageText = Text(Image(systemName: systemName))

      partials.append(.unformatted(prefix))
      partials.append(.formatted(modifiers(imageText)))
      previousRange = match.range
    }

    let suffix = String(string[(previousRange?.upperBound ?? string.startIndex)..<string.endIndex])
    partials.append(.unformatted(suffix))

    return partials
  }
}

fileprivate enum TextFormattingPartial {
  case unformatted(String)
  case formatted(Text)

  var textRepresentation: Text {
    switch self {
    case let .unformatted(string):
      return Text(string)

    case let .formatted(text):
      return text
    }
  }
}

extension Dictionary where Key == String, Value == (Text) -> Text {
  /// Pre-defined `Text` formatters using HTML tags for usage with `Text(_:customFormatting:)`.
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
      Text(
        "Normal <b>bold</b> <sb>semibold</sb> <checkmark.seal/> <i>italic</i>, <b>bold</b><sub>sub</sub> <ins>insert</ins> <del>delete</del> <i>another italic</i> <sbi>semibold & italic</sbi><sup>sup</sup> <chart.bar.fill/> custom <cb>colored & bold</cb>.",
        customFormatting: Dictionary.htmlLike.merged(with: ["cb": { $0.bold().foregroundColor(.systemOrange) }]),
        formattedSystemImages: ["checkmark.seal": { $0.foregroundColor(.green) }, "chart.bar.fill": { $0 }]
      )
      .previewComponents()
    }
  }
#endif
