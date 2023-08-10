import SwiftUI

public struct VerticalLabeledContentStyle: LabeledContentStyle {
   var spacing: CGFloat
   var muteLabel: Bool

   public init(spacing: CGFloat, muteLabel: Bool) {
      self.spacing = spacing
      self.muteLabel = muteLabel
   }

   public func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: .leading, spacing: self.spacing) {
         configuration.label
            .applyIf(self.muteLabel) { label in
               label
                  .font(.footnote)
                  .foregroundColor(.secondary)
                  .minimumScaleFactor(0.75)
            }

         configuration.content
      }
   }
}

extension LabeledContentStyle where Self == VerticalLabeledContentStyle {
   public static func vertical(spacing: CGFloat = 4, muteLabel: Bool = true) -> VerticalLabeledContentStyle {
      VerticalLabeledContentStyle(spacing: spacing, muteLabel: muteLabel)
   }
}

#Preview {
   LabeledContent("Some Key", value: "Some Value")
      .labeledContentStyle(.vertical())
}
