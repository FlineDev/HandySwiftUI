import SwiftUI

public struct VerticalLabeledContentStyle: LabeledContentStyle {
   public func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: .leading, spacing: 4) {
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
