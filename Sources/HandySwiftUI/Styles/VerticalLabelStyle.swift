import SwiftUI

public struct VerticalLabelStyle: LabelStyle {
   var spacing: CGFloat
   var iconColor: Color?
   var iconFont: Font?

   public init(spacing: CGFloat, iconColor: Color?, iconFont: Font?) {
      self.spacing = spacing
      self.iconColor = iconColor
      self.iconFont = iconFont
   }

   public func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: .center, spacing: self.spacing) {
         configuration.icon
            .applyIf(self.iconColor != nil) { $0.foregroundStyle(self.iconColor!) }
            .applyIf(self.iconFont != nil) { $0.font(self.iconFont!) }

         configuration.title
      }
   }
}

extension LabelStyle where Self == VerticalLabelStyle {
   public static func vertical(
      spacing: CGFloat = 4,
      iconColor: Color? = .accentColor,
      iconFont: Font? = nil
   ) -> VerticalLabelStyle {
      VerticalLabelStyle(spacing: spacing, iconColor: iconColor, iconFont: iconFont)
   }
}

#Preview("Default") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.vertical())
}

#Preview("Custom") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.vertical(spacing: 0, iconColor: .orange, iconFont: .title))
      .font(.footnote)
}
