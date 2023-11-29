import SwiftUI

extension Button where Label == Text {
   /// Creates a button using the `description` parameter of the provided instance to create a ``Text`` as its label.
   public init(stringConvertible: CustomStringConvertible, action: @escaping () -> Void) {
      self.init(action: action, label: { stringConvertible.text })
   }
}

extension Button where Label == Image {
   /// Creates a button using the `description` and `symbolName` parameters of the provided instance to create a ``Label`` as its label.
   public init(symbolConvertible: CustomSymbolConvertible, action: @escaping () -> Void) {
      self.init(action: action, label: { symbolConvertible.image })
   }
}

extension Button where Label == SwiftUI.Label<Text, Image> {
   /// Creates a button using the `symbolName` parameter of the provided instance to create an ``Image`` as its label.
   public init(labelConvertible: CustomLabelConvertible, action: @escaping () -> Void) {
      self.init(action: action, label: { labelConvertible.label })
   }
}
