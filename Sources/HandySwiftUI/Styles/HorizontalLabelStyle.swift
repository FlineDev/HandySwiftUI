import SwiftUI

/// A label style that arranges the icon and title horizontally with customizable spacing, position, and formatting.
public struct HorizontalLabelStyle: LabelStyle {
   var spacing: CGFloat
   var iconIsTrailing: Bool
   var iconColor: Color?
   var iconFont: Font?
   var iconAngle: Angle?
   var iconAmount: Int


   /// Initializes a new `HorizontalLabelStyle` with the specified properties.
   ///
   /// - Parameters:
   ///   - spacing: The spacing between the icon and title.
   ///   - iconIsTrailing: Whether the icon should be positioned before or after the title (default: false - before).
   ///   - iconColor: The optional color of the icon.
   ///   - iconFont: The optional font of the icon.
   ///   - iconAngle: The optional rotation angle of the icon.
   ///   - iconAmount: The number of icons to display (default: 1).
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
   /// Creates a `HorizontalLabelStyle` with customizable properties.
   ///
   /// - Parameters:
   ///   - spacing: The spacing between the icon and title (default: 4).
   ///   - iconIsTrailing: Whether the icon should be positioned before or after the title (default: false - before).
   ///   - iconColor: The optional color of the icon (default: accentColor).
   ///   - iconFont: The optional font of the icon.
   ///   - iconAngle: The optional rotation angle of the icon.
   ///   - iconAmount: The number of icons to display (default: 1).
   ///
   /// - Returns: A new `HorizontalLabelStyle` instance.
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

#if DEBUG
#Preview("Default") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.horizontal())
      .macOSOnlyPadding()
}

#Preview("Trailing") {
   Label("Hogwarts", systemImage: "graduationcap")
      .labelStyle(.horizontal(iconIsTrailing: true))
      .macOSOnlyPadding()
}

#Preview("Custom") {
   Label("Hogwarts", systemImage: "plus.circle")
      .labelStyle(.horizontal(spacing: 20, iconColor: .orange, iconFont: .title, iconAmount: 2))
      .font(.footnote)
      .macOSOnlyPadding()
}
#endif
