import SwiftUI

/// Renders as an `HStack` if on non-compact horizontal size classes, falls back to `VStack` on compact size class.
public struct AdaptiveStack<Content: View>: View {
#if !os(macOS)
  @Environment(\.horizontalSizeClass)
  var sizeClass
#endif
  
  let horizontalAlignment: HorizontalAlignment
  let verticalAlignment: VerticalAlignment
  let spacing: CGFloat?
  let content: () -> Content
  
  /// Creates a new `AdaptiveStack` with same options as `HStack` and `VSTack`.
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
