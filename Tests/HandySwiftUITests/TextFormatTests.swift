import SwiftUI
import Testing

@testable import HandySwiftUI

/// `Text(format:partialStyling:)` must render exactly like the texts concatenated by hand.
@MainActor
struct TextFormatTests {
   func expectSameRendering(_ text: Text, _ reference: Text, _ comment: Comment) {
      #expect(renderedPixels(of: text.frame(width: 600)) == renderedPixels(of: reference.frame(width: 600)), comment)
   }

   @Test
   func textWithoutTags() {
      self.expectSameRendering(Text(format: "Test without any matches."), Text(verbatim: "Test without any matches."), "plain")
   }

   @Test
   func pairedTags() {
      self.expectSameRendering(
         Text(format: "Normal <b>bold</b> and <i>italic</i> end", partialStyling: .htmlLike),
         Text(verbatim: "Normal ") + Text(verbatim: "bold").bold() + Text(verbatim: " and ") + Text(verbatim: "italic").italic()
            + Text(verbatim: " end"),
         "paired tags"
      )
   }

   @Test
   func symbolTags() {
      self.expectSameRendering(
         Text(format: "A <checkmark.seal/> B <chart.bar.fill/>", partialStyling: ["checkmark.seal": { $0.foregroundColor(.green) }]),
         Text(verbatim: "A ") + Text(Image(systemName: "checkmark.seal")).foregroundColor(.green) + Text(verbatim: " B ")
            + Text(Image(systemName: "chart.bar.fill")) + Text(verbatim: ""),
         "symbol tags"
      )
   }

   @Test
   func unknownAndMismatchedTagsStayLiteral() {
      self.expectSameRendering(
         Text(format: "<x>unknown</x> <b>mismatch</i> <b>ok</b>", partialStyling: .htmlLike),
         Text(verbatim: "<x>unknown</x>") + Text(verbatim: " ") + Text(verbatim: "<b>mismatch</i>") + Text(verbatim: " ")
            + Text(verbatim: "ok").bold() + Text(verbatim: ""),
         "unknown and mismatched tags"
      )
   }

   @Test
   func textWithPercentSigns() {
      self.expectSameRendering(
         Text(format: "100% <b>sure</b> %@ %lld", partialStyling: .htmlLike),
         Text(verbatim: "100% ") + Text(verbatim: "sure").bold() + Text(verbatim: " %@ %lld"),
         "percent signs"
      )
   }
}
