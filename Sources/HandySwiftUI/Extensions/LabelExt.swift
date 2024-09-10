import SwiftUI

extension Label<Text, Image> {
   /// Creates a `Label` view using the `description` and `symbolName` of the provided `CustomLabelConvertible` instance.
   ///
   /// This initializer provides a convenient way to create a `Label` directly from a `CustomLabelConvertible` object.
   ///
   /// - Parameter convertible: An instance conforming to `CustomLabelConvertible`.
   ///
   /// - Example:
   ///   ```swift
   ///   struct MyModel: CustomLabelConvertible {
   ///       var description: String { "Settings" }
   ///       var symbolName: String { "gear" }
   ///   }
   ///
   ///   let info = MyModel()
   ///   let label = Label(convertible: info)
   ///   // Creates a Label with "Settings" text and a gear icon
   ///   ```
   public init(convertible: CustomLabelConvertible) {
      self.init(convertible.description, systemImage: convertible.symbolName)
   }
}
