import Foundation

extension CGFloat {
   public static var platformDefaultSpacing: Self {
      #if os(tvOS)
      return 30
      #elseif os(macOS) || os(watchOS)
      return 8
      #else
      return 16
      #endif
   }

   public static var platformDefaultTextHeight: Self {
      #if os(tvOS)
      return 45.5
      #elseif os(macOS)
      return 18
      #else
      return 20.5
      #endif
   }
}
