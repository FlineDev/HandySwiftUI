import Introspect
import SwiftUI

extension View {
    /// Makes views of type `TextField` become the first responder if the condition is met.
    public func becomeFirstResponder(if condition: Bool) -> some View {
        introspectTextField { textField in
            if condition {
                textField.becomeFirstResponder()
            }
        }
    }

    /// Resigns views of type `TextField` and `TextEditor` and sets the condition back to false.
    public func resignFirstResponder(when condition: Binding<Bool>) -> some View {
        introspectTextField { textField in
            if condition.wrappedValue {
                condition.wrappedValue = false
                textField.resignFirstResponder()
            }
        }.introspectScrollView { scollView in
            if condition.wrappedValue {
                condition.wrappedValue = false
                scollView.endEditing(true)
            }
        }
    }
}
