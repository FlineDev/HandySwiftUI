import SwiftUI

extension Image {
   /// Creates an ``Image`` view using the `symbolName` parameter of the provided ``CustomSymbolConvertible`` instance.
   public init(convertible: CustomSymbolConvertible, variableValue: Double? = nil) {
      self.init(systemName: convertible.symbolName, variableValue: variableValue)
   }
}
