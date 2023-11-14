import SwiftUI

public struct HorizontalLabelStyle: LabelStyle {
   var spacing: CGFloat
   var iconColor: Color?
   var iconFont: Font?
   var iconAngle: Angle?

   public init(spacing: CGFloat, iconColor: Color?, iconFont: Font?, iconAngle: Angle?) {
      self.spacing = spacing
      self.iconColor = iconColor
      self.iconFont = iconFont
      self.iconAngle = iconAngle
   }

   public func makeBody(configuration: Configuration) -> some View {
      HStack(alignment: .center, spacing: self.spacing) {
         configuration.icon
            .applyIf(self.iconColor != nil) { $0.foregroundStyle(self.iconColor!) }
            .applyIf(self.iconFont != nil) { $0.font(self.iconFont!) }
            .applyIf(self.iconAngle != nil) { $0.rotationEffect(self.iconAngle!) }

         configuration.title
      }
   }
}

extension LabelStyle where Self == HorizontalLabelStyle {
   public static func horizontal(
      spacing: CGFloat = 4,
      iconColor: Color? = .accentColor,
      iconFont: Font? = nil,
      iconAngle: Angle? = nil
   ) -> HorizontalLabelStyle {
      HorizontalLabelStyle(spacing: spacing, iconColor: iconColor, iconFont: iconFont, iconAngle: iconAngle)
   }
}

#Preview("Default") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.horizontal())
}

#Preview("Custom") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.horizontal(spacing: 0, iconColor: .orange, iconFont: .title))
      .font(.footnote)
}
