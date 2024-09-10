import SwiftUI

extension CustomStringConvertible {
   /// Creates a SwiftUI `Text` view using the `description` of the instance.
   ///
   /// This property provides a convenient way to create a `Text` view
   /// from any type that conforms to `CustomStringConvertible`.
   ///
   /// - Returns: A `Text` view containing the `description` of the instance.
   ///
   /// - Example:
   ///   ```swift
   ///   struct Person: CustomStringConvertible {
   ///       let name: String
   ///       var description: String { "Person named \(name)" }
   ///   }
   ///
   ///   let john = Person(name: "John")
   ///   var body: some View {
   ///       john.text  // Creates a Text view with "Person named John"
   ///   }
   ///   ```
   public var text: Text {
      Text(self.description)
   }
}
