import SwiftUI

extension Label<Text, Image> {
   /// Creates a ``Label`` view using the `description` and `symbolName` parameters of the provided ``CustomLabelConvertible`` instance.
   public init(convertible: CustomLabelConvertible) {
      self.init(convertible.description, systemImage: convertible.symbolName)
   }
}
