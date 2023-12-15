import SwiftUI

public protocol CustomLabelConvertible: CustomStringConvertible, CustomSymbolConvertible {}

extension CustomLabelConvertible {
   /// Creates a SwiftUI ``Label`` view with the `description` and `systemName` parameters of the instance. Any metadata after `:` or `*` in the `systemName` will be ignored.
   public var label: Label<Text, Image> {
      Label(self.description, systemImage: self.symbolSystemName)
   }
}
