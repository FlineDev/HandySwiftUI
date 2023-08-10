import SwiftUI

public struct VerticalLabeledContentStyle: LabeledContentStyle {
   var alignment: HorizontalAlignment
   var spacing: CGFloat
   var muteLabel: Bool

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
                  .opacity(0.7)
                  .minimumScaleFactor(0.75)
            }

         configuration.content
      }
   }
}

extension LabeledContentStyle where Self == VerticalLabeledContentStyle {
   public static func vertical(
      alignment: HorizontalAlignment = .leading,
      spacing: CGFloat = 4,
      muteLabel: Bool = true
   ) -> VerticalLabeledContentStyle {
      VerticalLabeledContentStyle(alignment: alignment, spacing: spacing, muteLabel: muteLabel)
   }
}

#Preview {
   LabeledContent("Some Key", value: "Some Value")
      .labeledContentStyle(.vertical())
}
