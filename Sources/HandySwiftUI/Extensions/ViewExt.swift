import Introspect
import SwiftUI

extension View {
    /// Makes views of type `TextField` and `TextEditor` become the first responder if the condition is met.
    public func becomeFirstResponder(condition: Bool) -> some View {
        introspectTextField { textField in
            if condition {
                textField.becomeFirstResponder()
            }
        }
    }
}
