import SwiftUI

public struct HorizontalLabelStyle: LabelStyle {
   var spacing: CGFloat
   var iconIsTrailing: Bool
   var iconColor: Color?
   var iconFont: Font?
   var iconAngle: Angle?
   var iconAmount: Int

   public init(spacing: CGFloat, iconIsTrailing: Bool, iconColor: Color?, iconFont: Font?, iconAngle: Angle?, iconAmount: Int) {
      self.spacing = spacing
      self.iconIsTrailing = iconIsTrailing
      self.iconColor = iconColor
      self.iconFont = iconFont
      self.iconAngle = iconAngle
      self.iconAmount = iconAmount
   }

   public func makeBody(configuration: Configuration) -> some View {
      HStack(alignment: .center, spacing: self.spacing) {
         if !self.iconIsTrailing {
            self.iconView(configuration: configuration)
         }

         configuration.title

         if self.iconIsTrailing {
            self.iconView(configuration: configuration)
         }
      }
   }

   private func iconView(configuration: Configuration) -> some View {
      HStack(spacing: 0) {
         ForEach(0..<self.iconAmount, id: \.self) { _ in
            configuration.icon
               .applyIf(self.iconColor != nil) { $0.foregroundStyle(self.iconColor!) }
               .applyIf(self.iconFont != nil) { $0.font(self.iconFont!) }
               .applyIf(self.iconAngle != nil) { $0.rotationEffect(self.iconAngle!) }
         }
      }
   }
}

extension LabelStyle where Self == HorizontalLabelStyle {
   public static func horizontal(
      spacing: CGFloat = 4,
      iconIsTrailing: Bool = false,
      iconColor: Color? = .accentColor,
      iconFont: Font? = nil,
      iconAngle: Angle? = nil,
      iconAmount: Int = 1
   ) -> HorizontalLabelStyle {
      HorizontalLabelStyle(
         spacing: spacing,
         iconIsTrailing: iconIsTrailing,
         iconColor: iconColor,
         iconFont: iconFont,
         iconAngle: iconAngle,
         iconAmount: iconAmount
      )
   }
}

#Preview("Default") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.horizontal())
}

#Preview("Trailing") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.horizontal(iconIsTrailing: true))
}

#Preview("Custom") {
   Label("Hogwarts", systemImage: "plus.circle")
      .labelStyle(.horizontal(spacing: 20, iconColor: .orange, iconFont: .title, iconAmount: 2))
      .font(.footnote)
}
