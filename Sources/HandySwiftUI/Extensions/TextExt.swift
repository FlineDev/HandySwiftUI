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
  ///       "red": { Text($0).foregroundColor(.orange) },
  ///       "highlight": { Text($0).bold().italic() }
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
  ///   - systemImageNames: A dictionary with SF Symbol image names as keys and `Text` to `Text` modifier closures as values.
  public init(
    _ text: String,
    customFormatting: [String: (String) -> Text],
    systemImageNames: [String: (Text) -> Text] = [:]
  ) {
    self = Text.withFormat(text: text, customFormatting: customFormatting, systemImageNames: systemImageNames)
  }

  private static func withFormat(
    text: String,
    customFormatting: [String: (String) -> Text],
    systemImageNames: [String: (Text) -> Text]
  ) -> Text {
    var partials: [TextFormattingPartial] = [.unformatted(text)]

    for (key, formatting) in customFormatting {
      partials = self.partials(applying: formatting, for: key, on: partials)
    }

    for (systemName, modifiers) in systemImageNames {
      partials = self.partials(systemName: systemName, modifiers: modifiers, previousPartials: partials)
    }

    return partials.reduce(Text("")) { $0 + $1.textRepresentation }
  }

  private static func partials(
    applying formatting: (String) -> Text,
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
    applying formatting: (String) -> Text,
    for key: String,
    in string: String
  ) -> [TextFormattingPartial] {
    let textToFormatRegex = try! Regex(#"<\#(key)>([^<>]+)</\#(key)>"#)

    var partials: [TextFormattingPartial] = []
    var previousRange: Range<String.Index>?

    for match in textToFormatRegex.matches(in: string) {
      let prefix = String(string[(previousRange?.lowerBound ?? string.startIndex)..<match.range.lowerBound])
      let capture = match.captures[0]!

      partials.append(.unformatted(prefix))
      partials.append(.formatted(formatting(capture)))
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
      let prefix = String(string[(previousRange?.lowerBound ?? string.startIndex)..<match.range.lowerBound])
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

extension Dictionary where Key == String, Value == (String) -> Text {
  /// Pre-defined `Text` formatters using HTML tags for usage with `Text(_:customFormatting:)`.
  /// Inspiration: https://www.w3schools.com/html/html_formatting.asp
  ///
  /// Supported tags:
  /// - "b" / "strong": Applies `.bold()` modifier.
  /// - "i" / "em": Applies `.bold()` modifier.
  /// - "bi"  "ib" / "strongem" / "emstrong": Applies both the `.bold()` and the `.italic()` modifiers.
  /// - "del", "strong": Applies `.strikethrough()` modifier.
  /// - "ins", "strong": Applies `.underline()` modifier.
  /// - "sub", "strong": Applies `.baselineOffset(5)` modifier.
  /// - "sup", "strong": Applies `.baselineOffset(-5)` modifier.
  public static var htmlLike: Self {
    [
      "b": { Text($0).bold() },
      "strong": { Text($0).bold() },
      "i": { Text($0).italic() },
      "em": { Text($0).italic() },
      "bi": { Text($0).bold().italic() },
      "ib": { Text($0).italic().bold() },
      "strongem": { Text($0).bold().italic() },
      "emstrong": { Text($0).italic().bold() },
      "del": { Text($0).strikethrough() },
      "ins": { Text($0).underline() },
      "sub": { Text($0).baselineOffset(-4) },
      "sup": { Text($0).baselineOffset(6) },
    ]
  }
}

#if DEBUG
  struct Text_Previews: PreviewProvider {
    static var previews: some View {
      Text(
        "Normal <b>bold</b> <checkmark.seal/> <i>italic</i>, <b>bold</b><sub>sub</sub> <ins>underline</ins> <del>strikethrough</del> <em>emphasis</em> <strong>strong</strong><sup>sup</sup> <chart.bar.fill/> custom <cb>colored & bold</cb>.",
        customFormatting: Dictionary.htmlLike.merged(with: ["cb": { Text($0).bold().foregroundColor(.systemOrange) }]),
        systemImageNames: ["checkmark.seal": { $0.foregroundColor(.green) }, "chart.bar.fill": { $0 }]
      )
      .previewComponents()
    }
  }
#endif
