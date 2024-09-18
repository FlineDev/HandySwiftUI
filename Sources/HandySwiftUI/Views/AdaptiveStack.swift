import SwiftUI

/// Renders as an `HStack` if on non-compact horizontal size classes, falls back to `VStack` on compact size class.
/// This adaptive layout is useful for creating responsive designs that adjust based on the available screen space.
///
/// - Note: On macOS, this always renders as an `HStack` since size classes are not applicable.
///
/// # Example usage:
/// ```swift
/// AdaptiveStack(horizontalAlignment: .leading, spacing: 10) {
///     Image(systemName: "star.fill")
///     Text("Favorite")
///     Spacer()
///     Toggle("Enable", isOn: $isEnabled)
/// }
/// ```
/// This example creates a row with an icon, label, and toggle that adapts to different screen sizes.
public struct AdaptiveStack<Content: View>: View {
   #if !os(macOS)
   @Environment(\.horizontalSizeClass) var sizeClass
   #endif

   let horizontalAlignment: HorizontalAlignment
   let verticalAlignment: VerticalAlignment
   let spacing: CGFloat?
   let content: () -> Content

   /// Creates a new `AdaptiveStack` with the same options as `HStack` and `VStack`.
   ///
   /// - Parameters:
   ///   - horizontalAlignment: The guide for aligning the subviews when arranged horizontally.
   ///     Used when the stack is in vertical orientation. Defaults to `.center`.
   ///   - verticalAlignment: The guide for aligning the subviews when arranged vertically.
   ///     Used when the stack is in horizontal orientation. Defaults to `.center`.
   ///   - spacing: The distance between adjacent subviews. If `nil`, the stack uses the default spacing.
   ///   - content: A view builder that creates the content of this stack.
   public init(
      horizontalAlignment: HorizontalAlignment = .center,
      verticalAlignment: VerticalAlignment = .center,
      spacing: CGFloat? = nil,
      @ViewBuilder
      content: @escaping () -> Content
   ) {
      self.horizontalAlignment = horizontalAlignment
      self.verticalAlignment = verticalAlignment
      self.spacing = spacing
      self.content = content
   }

   public var body: some View {
      Group {
         #if !os(macOS)
         if sizeClass == .compact {
            VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
         }
         else {
            HStack(alignment: verticalAlignment, spacing: spacing, content: content)
         }
         #else
         HStack(alignment: verticalAlignment, spacing: spacing, content: content)
         #endif
      }
   }
}
