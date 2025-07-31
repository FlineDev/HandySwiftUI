import SwiftUI

/// A custom `TextField` view that limits the number of characters and displays a counter indicating the remaining characters.
public struct LimitedTextField: View {
   let title: LocalizedStringKey
   @Binding var text: String

   let characterLimit: Int

   /// Initializes a `LimitedTextFieldWithCounter` view.
   ///
   /// - Parameters:
   ///   - text: A binding to the `String` value representing the text input.
   ///   - characterLimit: The maximum number of characters allowed.
   public init(_ title: LocalizedStringKey, text: Binding<String>, characterLimit: Int) {
      self.title = title
      self._text = text
      self.characterLimit = characterLimit
   }

   public var body: some View {
      VStack(alignment: .trailing, spacing: 4) {
         TextField(self.title, text: self.$text)
            .onChange(of: self.text) { _ in
               if self.text.count > characterLimit {
                  self.text = String(self.text.prefix(characterLimit))
               }
            }
            #if !os(tvOS)
               .textFieldStyle(.roundedBorder)
            #endif

         Text(String(localized: "\(characterLimit - self.text.count) chars left", bundle: .module))
            .font(.caption)
            .foregroundColor(.gray)
      }
   }
}

#if DEBUG && swift(>=6.0)
   @available(iOS 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
   #Preview {
      @Previewable @State var previewText = ""

      Form {
         LimitedTextField("Enter text", text: $previewText, characterLimit: 10)
      }
      .formStyle(.grouped)
   }
#endif
