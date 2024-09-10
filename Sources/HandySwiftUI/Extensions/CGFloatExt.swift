import Foundation

extension CGFloat {
   /// Returns the default spacing value based on the current platform.
   ///
   /// - Returns: A `CGFloat` value representing the default spacing:
   ///   - `30` for `tvOS`
   ///   - `8` for `macOS` and `watchOS`
   ///   - `16` for other platforms (e.g., `iOS`)
   ///
   /// ## Usage Example:
   /// ```swift
   /// SomeView("...")
   ///   .padding(.platformDefaultSpacing)
   /// ```
   public static var platformDefaultSpacing: Self {
      #if os(tvOS)
      return 30
      #elseif os(macOS) || os(watchOS)
      return 8
      #else
      return 16
      #endif
   }

   /// Returns the default text height value based on the current platform.
   ///
   /// - Returns: A `CGFloat` value representing the default text height:
   ///   - `45.5` for `tvOS`
   ///   - `18` for `macOS`
   ///   - `20.5` for other platforms (e.g., `iOS`)
   ///
   /// ## Usage Example:
   /// ```swift
   /// Text("...")
   ///   .frame(height: .platformDefaultTextHeight)
   /// ```
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
