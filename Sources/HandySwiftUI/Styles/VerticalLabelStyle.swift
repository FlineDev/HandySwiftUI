import SwiftUI

public struct VerticalLabelStyle: LabelStyle {
   var spacing: CGFloat
   var iconColor: Color?

   public init(spacing: CGFloat, iconColor: Color?) {
      self.spacing = spacing
      self.iconColor = iconColor
   }

   public func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: .center, spacing: self.spacing) {
         configuration.icon
            .applyIf(self.iconColor != nil) { $0.foregroundStyle(self.iconColor!) }

         configuration.title
      }
   }
}

extension LabelStyle where Self == VerticalLabelStyle {
   public static func vertical(spacing: CGFloat = 4, iconColor: Color? = .accentColor) -> VerticalLabelStyle {
      VerticalLabelStyle(spacing: spacing, iconColor: iconColor)
   }
}

#Preview("Default") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.vertical())
}

#Preview("Custom") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.vertical(spacing: 50, iconColor: .orange))
}
