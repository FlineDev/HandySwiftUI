import SwiftUI

/// A protocol that combines `CustomStringConvertible` and `CustomSymbolConvertible` to represent an object that can be converted into a SwiftUI `Label`.
///
/// Types conforming to this protocol must provide both a textual description (`description`) and a symbol system name (`symbolSystemName`) to create SwiftUI `Label` views.
public protocol CustomLabelConvertible: CustomStringConvertible, CustomSymbolConvertible {}

extension CustomLabelConvertible {
   /// Creates a SwiftUI `Label` view using the instance's `description` and `symbolSystemName`.
   ///
   /// Any metadata after `:` or `*` in the `symbolSystemName` will be ignored to adhere to SwiftUI's system image syntax.
   ///
   /// - Returns: A `Label` view with the instance's description as text and symbol as image.
   ///
   /// - Example:
   ///   ```swift
   ///   struct MyLabel: CustomLabelConvertible {
   ///       var description: String { "Example" }
   ///       var symbolSystemName: String { "star.fill" }
   ///   }
   ///
   ///   let labelView = MyLabel().label
   ///   // This creates a SwiftUI Label with text "Example" and the system image of a filled star.
   ///   ```
   public var label: Label<Text, Image> {
      Label(self.description, systemImage: self.symbolSystemName)
   }
}
