import SwiftUI

public struct VerticalLabelStyle: LabelStyle {
   var spacing: CGFloat
   var iconColor: Color?
   var iconFont: Font?
   var iconAngle: Angle?
   var iconAmount: Int

   public init(spacing: CGFloat, iconColor: Color?, iconFont: Font?, iconAngle: Angle?, iconAmount: Int) {
      self.spacing = spacing
      self.iconColor = iconColor
      self.iconFont = iconFont
      self.iconAngle = iconAngle
      self.iconAmount = iconAmount
   }

   public func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: .center, spacing: self.spacing) {
         HStack(spacing: self.spacing / 2) {
            ForEach(0..<self.iconAmount, id: \.self) { _ in
               configuration.icon
                  .applyIf(self.iconColor != nil) { $0.foregroundStyle(self.iconColor!) }
                  .applyIf(self.iconFont != nil) { $0.font(self.iconFont!) }
                  .applyIf(self.iconAngle != nil) { $0.rotationEffect(self.iconAngle!) }
            }
         }

         configuration.title
      }
   }
}

extension LabelStyle where Self == VerticalLabelStyle {
   public static func vertical(
      spacing: CGFloat = 4,
      iconColor: Color? = .accentColor,
      iconFont: Font? = nil,
      iconAngle: Angle? = nil,
      iconAmount: Int = 1
   ) -> VerticalLabelStyle {
      VerticalLabelStyle(spacing: spacing, iconColor: iconColor, iconFont: iconFont, iconAngle: iconAngle, iconAmount: iconAmount)
   }
}

#Preview("Default") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.vertical())
}

#Preview("Custom") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.vertical(spacing: 0, iconColor: .orange, iconFont: .title, iconAmount: 2))
      .font(.footnote)
}
