import SwiftUI

/// A label style that fixes the width of the icon and allows for custom icon and title colors.
public struct FixedIconWidthLabelStyle: LabelStyle {
   let iconColor: Color?
   let titleColor: Color?
   let iconWidth: CGFloat

   /// Initializes a new `FixedIconWidthLabelStyle` with the specified icon width, icon color, and title color.
   ///
   /// - Parameters:
   ///   - iconWidth: The fixed width of the icon.
   ///   - iconColor: The optional color of the icon.
   ///   - titleColor: The optional color of the title.
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
   /// Creates a `FixedIconWidthLabelStyle` with the specified icon width, icon color, and title color.
   ///
   /// - Parameters:
   ///   - iconWidth: The fixed width of the icon. Defaults to 22.
   ///   - iconColor: The optional color of the icon.
   ///   - titleColor: The optional color of the title.
   ///
   /// - Returns: A new `FixedIconWidthLabelStyle` instance.
   public static func fixedIconWidth(_ iconWidth: CGFloat = 22, iconColor: Color? = nil, titleColor: Color? = nil) -> FixedIconWidthLabelStyle {
      FixedIconWidthLabelStyle(iconWidth: iconWidth, iconColor: iconColor, titleColor: titleColor)
   }
}

#if DEBUG
   #Preview {
      Label("Hello World!", systemImage: "person")
         .labelStyle(.fixedIconWidth(iconColor: .green, titleColor: .secondary))
         .macOSOnlyPadding()
   }
#endif
