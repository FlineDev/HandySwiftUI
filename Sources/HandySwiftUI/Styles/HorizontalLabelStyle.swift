import SwiftUI

public struct HorizontalLabelStyle: LabelStyle {
   var spacing: CGFloat
   var iconColor: Color?

   public init(spacing: CGFloat, iconColor: Color?) {
      self.spacing = spacing
      self.iconColor = iconColor
   }

   public func makeBody(configuration: Configuration) -> some View {
      HStack(alignment: .center, spacing: self.spacing) {
         configuration.icon
            .applyIf(self.iconColor != nil) { $0.foregroundStyle(self.iconColor!) }

         configuration.title
      }
   }
}

extension LabelStyle where Self == HorizontalLabelStyle {
   public static func horizontal(spacing: CGFloat = 4, iconColor: Color? = .accentColor) -> HorizontalLabelStyle {
      HorizontalLabelStyle(spacing: spacing, iconColor: iconColor)
   }
}

#Preview("Default") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.horizontal())
}

#Preview("Custom") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.horizontal(spacing: 50, iconColor: .orange))
}
