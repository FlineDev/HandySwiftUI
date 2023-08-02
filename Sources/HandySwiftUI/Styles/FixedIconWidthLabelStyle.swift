import SwiftUI

public struct FixedIconWidthLabelStyle: LabelStyle {
   let iconColor: Color?
   let titleColor: Color?
   let iconWidth: CGFloat
   
   public init(iconWidth: CGFloat, iconColor: Color?, titleColor: Color?) {
      self.iconWidth = iconWidth
      self.iconColor = iconColor
      self.titleColor = titleColor
   }
   
   public func makeBody(configuration: Configuration) -> some View {
      HStack(spacing: 10) {
         HStack {
            configuration.icon
            Spacer()
         }
         .applyIf(self.iconColor != nil) { $0.foregroundStyle(self.iconColor!) }
         .frame(width: self.iconWidth)
         
         configuration.title
            .applyIf(self.titleColor != nil) { $0.foregroundStyle(self.titleColor!) }
         
         Spacer()
      }
   }
}

extension LabelStyle where Self == FixedIconWidthLabelStyle {
   public static func fixedIconWidth(_ iconWidth: CGFloat = 22, iconColor: Color? = nil, titleColor: Color? = nil) -> FixedIconWidthLabelStyle {
      FixedIconWidthLabelStyle(iconWidth: iconWidth, iconColor: iconColor, titleColor: titleColor)
   }
}

#Preview {
   Label("Hello World!", systemImage: "person")
      .labelStyle(.fixedIconWidth(iconColor: .green, titleColor: .secondary))
}
