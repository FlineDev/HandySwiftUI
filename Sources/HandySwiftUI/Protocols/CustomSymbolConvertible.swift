import SwiftUI

public protocol CustomSymbolConvertible {
   /// The SF Symbol name of the icon to show.
   ///
   /// You can add customization metadata after a `:` or `*` sign. For example, a name of `"scribble:30*2` could mean "rotate by 30 degrees and show twice".
   var symbolName: String { get }
}

extension CustomSymbolConvertible {
   /// Creates a SwiftUI ``Image`` view with the `systemName` parameter of the instance. Any metadata after `:` or `*` in the `systemName` will be ignored.
   public var image: Image {
      Image(systemName: self.symbolSystemName)
   }

   /// Returns the plain systemName of the symbol with all metadata removed.
   public var symbolSystemName: String {
      self.symbolName.components(separatedBy: ":")[0].components(separatedBy: "*")[0]
   }
}
