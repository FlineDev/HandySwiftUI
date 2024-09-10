import SwiftUI

extension Button where Label == Text {
   /// Creates a `Button` with a `Text` label using the `description` property of the provided `CustomStringConvertible` instance.
   ///
   /// - Parameters:
   ///   - stringConvertible: An instance conforming to `CustomStringConvertible` that provides the text for the button's label.
   ///   - action: The closure to execute when the button is tapped.
   ///
   /// ## Usage Example:
   /// ```swift
   /// struct MyStringConvertible: CustomStringConvertible {
   ///     var description: String { "Click Me" }
   /// }
   ///
   /// Button(stringConvertible: MyStringConvertible(), action: {
   ///     print("Button tapped")
   /// })
   /// ```
   public init(stringConvertible: CustomStringConvertible, action: @escaping () -> Void) {
      self.init(action: action, label: { Text(stringConvertible.description) })
   }
}

extension Button where Label == Image {
   /// Creates a `Button` with an `Image` label using the `symbolName` property of the provided `CustomSymbolConvertible` instance.
   ///
   /// - Parameters:
   ///   - symbolConvertible: An instance conforming to `CustomSymbolConvertible` that provides the SF Symbol name for the button's image.
   ///   - action: The closure to execute when the button is tapped.
   ///
   /// ## Usage Example:
   /// ```swift
   /// struct MySymbolConvertible: CustomSymbolConvertible {
   ///     var symbolName: String { "star.fill" }
   /// }
   ///
   /// Button(symbolConvertible: MySymbolConvertible(), action: {
   ///     print("Button tapped")
   /// })
   /// ```
   public init(symbolConvertible: CustomSymbolConvertible, action: @escaping () -> Void) {
      self.init(action: action, label: { Image(systemName: symbolConvertible.symbolSystemName) })
   }
}

extension Button where Label == SwiftUI.Label<Text, Image> {
   /// Creates a `Button` with a `Label` combining `Text` and `Image` using the `CustomLabelConvertible` instance.
   ///
   /// - Parameters:
   ///   - labelConvertible: An instance conforming to `CustomLabelConvertible` that provides both the text and image for the button's label.
   ///   - action: The closure to execute when the button is tapped.
   ///
   /// ## Usage Example:
   /// ```swift
   /// struct MyLabelConvertible: CustomLabelConvertible {
   ///     var description: String { "Star" }
   ///     var symbolSystemName: String { "star.fill" }
   /// }
   ///
   /// Button(labelConvertible: MyLabelConvertible(), action: {
   ///     print("Button tapped")
   /// })
   /// ```
   public init(labelConvertible: CustomLabelConvertible, action: @escaping () -> Void) {
      self.init(action: action, label: { labelConvertible.label })
   }
}
