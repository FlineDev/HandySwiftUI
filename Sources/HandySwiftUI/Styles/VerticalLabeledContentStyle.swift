import SwiftUI

/// A labeled content style that arranges the label and content vertically.
public struct VerticalLabeledContentStyle: LabeledContentStyle {
   let alignment: HorizontalAlignment
   let spacing: CGFloat
   let muteLabel: Bool

   /// Initializes a new `VerticalLabeledContentStyle` with the specified properties.
   ///
   /// - Parameters:
   ///   - alignment: The horizontal alignment of the label and content (default: `.leading`).
   ///   - spacing: The spacing between the label and content (default: 4).
   ///   - muteLabel: Whether to mute the label's appearance (default: true).
   public init(alignment: HorizontalAlignment, spacing: CGFloat, muteLabel: Bool) {
      self.alignment = alignment
      self.spacing = spacing
      self.muteLabel = muteLabel
   }

   public func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: self.alignment, spacing: self.spacing) {
         configuration.label
            .applyIf(self.muteLabel) { label in
               label
                  .font(.footnote)
                  .foregroundStyle(Color.secondaryLabel)
                  .minimumScaleFactor(0.75)
            }

         configuration.content
      }
   }
}

extension LabeledContentStyle where Self == VerticalLabeledContentStyle {
   /// Creates a `VerticalLabeledContentStyle` with customizable properties.
   ///
   /// - Parameters:
   ///   - alignment: The horizontal alignment of the label and content (default: `.leading`).
   ///   - spacing: The spacing between the label and content (default: 4).
   ///   - muteLabel: Whether to mute the label's appearance (default: true).
   ///
   /// - Returns: A new `VerticalLabeledContentStyle` instance.
   public static func vertical(
      alignment: HorizontalAlignment = .leading,
      spacing: CGFloat = 4,
      muteLabel: Bool = true
   ) -> VerticalLabeledContentStyle {
      VerticalLabeledContentStyle(alignment: alignment, spacing: spacing, muteLabel: muteLabel)
   }
}

#if DEBUG
#Preview {
   LabeledContent("Some Key", value: "Some Value")
      .labeledContentStyle(.vertical())
      .macOSOnlyPadding()
}
#endif
