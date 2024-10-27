import SwiftUI

/// A protocol for types that provide an SF Symbol name for use in SwiftUI views.
///
/// The symbol name can include metadata after `:` or `*`. This metadata will be ignored when creating the `Image` view.
///
/// ## Example:
/// ```swift
/// struct Icon: CustomSymbolConvertible {
///     var symbolName: String { "scribble:30*2" }
/// }
///
/// let iconImage = Icon().image
/// // This creates an `Image` view with the SF Symbol named "scribble".
/// ```
public protocol CustomSymbolConvertible {
   /// The SF Symbol name of the icon to show, including optional customization metadata.
   ///
   /// Metadata after `:` or `*` will be ignored when the image is created.
   var symbolName: String { get }
}

extension CustomSymbolConvertible {
   /// Creates a SwiftUI `Image` view using the `symbolName` property of the instance.
   /// Metadata after `:` or `*` in the `symbolName` is ignored.
   ///
   /// ## Usage Example:
   /// ```swift
   /// struct Icon: CustomSymbolConvertible {
   ///     var symbolName: String { "star.fill" }
   /// }
   ///
   /// let iconImage = Icon().image
   /// // This creates an `Image` view with the SF Symbol "star.fill".
   /// ```
   public var image: Image {
      Image(systemName: self.symbolSystemName)
   }

   /// Returns the base SF Symbol name, with any metadata (e.g., `:` or `*` and following content) removed.
   ///
   /// ## Usage Example:
   /// ```swift
   /// struct Icon: CustomSymbolConvertible {
   ///     var symbolName: String { "star.fill:30*2" }
   /// }
   ///
   /// let baseName = Icon().symbolSystemName
   /// print(baseName) // Outputs: "star.fill"
   /// ```
   public var symbolSystemName: String {
      self.symbolName.components(separatedBy: ":")[0].components(separatedBy: "*")[0]
   }
}
