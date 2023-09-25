import SwiftUI

struct MultiSelectionView<Selectable: Identifiable & Hashable>: View {
   let options: [Selectable]
   let optionToString: (Selectable) -> String

   @Environment(\.dismiss)
   var dismiss

   @Binding
   var selected: Set<Selectable>
   
   var body: some View {
      List {
         Section {
            ForEach(self.options) { selectable in
               Button(action: { toggleSelection(selectable: selectable) }) {
                  HStack {
                     Text(optionToString(selectable)).foregroundColor(.label)
                     Spacer()
                     if selected.contains(where: { $0.id == selectable.id }) {
                        Image(systemName: "checkmark").foregroundColor(.accentColor)
                     }
                  }
               }
               .buttonStyle(.plain)
               .tag(selectable.id)
            }
         }

         #if os(macOS)
         Section {
            Button("Done") {
               self.dismiss()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
         }
         #endif
      }
   }
   
   private func toggleSelection(selectable: Selectable) {
      if let existingIndex = selected.firstIndex(where: { $0.id == selectable.id }) {
         selected.remove(at: existingIndex)
      }
      else {
         selected.insert(selectable)
      }
   }
}

#if DEBUG
struct MultiSelectionView_Previews: PreviewProvider {
   struct IdentifiableString: Identifiable, Hashable {
      let string: String
      var id: String { string }
   }
   
   @State static var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })
   
   static var previews: some View {
      NavigationStack {
         MultiSelectionView(
            options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
            optionToString: { $0.string },
            selected: $selected
         )
      }
   }
}
#endif
