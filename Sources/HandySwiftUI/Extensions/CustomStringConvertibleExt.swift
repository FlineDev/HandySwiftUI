import SwiftUI

extension CustomStringConvertible {
   /// Creates a SwiftUI ``Text`` view with the `description`parameter of the instance.
   public var text: Text {
      Text(self.description)
   }
}
