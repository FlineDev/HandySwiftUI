import SwiftUI

/// A label style that arranges the icon and title vertically with customizable spacing and formatting.
public struct VerticalLabelStyle: LabelStyle {
   let spacing: CGFloat
   let iconColor: Color?
   let iconFont: Font?
   let iconAngle: Angle?
   let iconAmount: Int

   /// Initializes a new `VerticalLabelStyle` with the specified properties.
   ///
   /// - Parameters:
   ///   - spacing: The spacing between the icon and title.
   ///   - iconColor: The optional color of the icon (default: accentColor).
   ///   - iconFont: The optional font of the icon.
   ///   - iconAngle: The optional rotation angle of the icon.
   ///   - iconAmount: The number of icons to display (default: 1).
   public init(spacing: CGFloat, iconColor: Color? = .accentColor, iconFont: Font? = nil, iconAngle: Angle? = nil, iconAmount: Int = 1) {
      self.spacing = spacing
      self.iconColor = iconColor
      self.iconFont = iconFont
      self.iconAngle = iconAngle
      self.iconAmount = iconAmount
   }

   public func makeBody(configuration: Configuration) -> some View {
      VStack(alignment: .center, spacing: self.spacing) {
         HStack(spacing: 0) {
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
   /// Creates a `VerticalLabelStyle` with customizable properties.
   ///
   /// - Parameters:
   ///   - spacing: The spacing between the icon and title (default: 4).
   ///   - iconColor: The optional color of the icon (default: accentColor).
   ///   - iconFont: The optional font of the icon.
   ///   - iconAngle: The optional rotation angle of the icon.
   ///   - iconAmount: The number of icons to display (default: 1).
   ///
   /// - Returns: A new `VerticalLabelStyle` instance.
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

#if DEBUG
#Preview("Default") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.vertical())
      .macOSOnlyPadding()
}

#Preview("Custom") {
   Label("Hogwarts", systemImage: "plus.circle")
      .labelStyle(.vertical(spacing: 20, iconColor: .orange, iconFont: .title, iconAmount: 2))
      .font(.footnote)
      .macOSOnlyPadding()
}
#endif
