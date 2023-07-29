import SwiftUI

public struct VerticalLabeledContentStyle: LabeledContentStyle {
   var spacing: CGFloat

   public init(spacing: CGFloat = 4) {
      self.spacing = spacing
   }

   public func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: .leading, spacing: self.spacing) {
         configuration.label
            .font(.footnote)
            .foregroundColor(.secondary)
            .minimumScaleFactor(0.75)

         configuration.content
      }
   }
}

extension LabeledContentStyle where Self == VerticalLabeledContentStyle {
   public static var vertical: VerticalLabeledContentStyle { VerticalLabeledContentStyle() }
}

#Preview {
   LabeledContent("Some Key", value: "Some Value")
      .labeledContentStyle(.vertical)
}
