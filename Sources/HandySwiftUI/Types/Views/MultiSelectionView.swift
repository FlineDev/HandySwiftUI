import SwiftUI

/// A view that presents a list of selectable options, allowing multiple selections.
/// This view adapts its appearance based on the platform (iOS/tvOS vs macOS).
///
/// `MultiSelectionView` provides a consistent interface for multi-selection across different Apple platforms,
/// using a list with checkmarks on iOS/tvOS and switches on macOS.
///
/// # Features
/// - Supports any `Identifiable` and `Hashable` type as selectable options
/// - Custom string representation for each option
/// - Platform-specific UI (checkmarks for iOS/tvOS, switches for macOS)
/// - Automatic dismissal support on iOS/tvOS
/// - Customizable height on macOS
///
/// # Example usage:
/// ```swift
/// struct ContentView: View {
///     struct Fruit: Identifiable, Hashable {
///         let name: String
///         var id: String { name }
///     }
///
///     @State private var selectedFruits: Set<Fruit> = []
///     let allFruits = [
///         Fruit(name: "Apple"),
///         Fruit(name: "Banana"),
///         Fruit(name: "Cherry"),
///         Fruit(name: "Date")
///     ]
///
///     var body: some View {
///         NavigationStack {
///             MultiSelectionView(
///                 options: allFruits,
///                 optionToString: { $0.name },
///                 selected: $selectedFruits
///             )
///             .navigationTitle("Select Fruits")
///         }
///     }
/// }
/// ```
struct MultiSelectionView<Selectable: Identifiable & Hashable>: View {
   /// The array of selectable options.
   let options: [Selectable]

   /// A closure that converts a `Selectable` item to its string representation.
   let optionToString: (Selectable) -> String

   /// An environment value for dismissing the view (used on iOS/tvOS).
   @Environment(\.dismiss)
   var dismiss

   /// A binding to the set of currently selected items.
   @Binding
   var selected: Set<Selectable>

   var body: some View {
      List {
         Section {
            ForEach(self.options) { selectable in
               #if !os(macOS)
                  Button(action: { self.toggleSelection(selectable: selectable) }) {
                     HStack {
                        Text(self.optionToString(selectable)).foregroundColor(.label)
                        Spacer()
                        if self.selected.contains(where: { $0.id == selectable.id }) {
                           Image(systemName: "checkmark").foregroundColor(.accentColor)
                        }
                     }
                  }
                  .tag(selectable.id)
               #else
                  Toggle(self.optionToString(selectable), isOn: self.boolBinding(selectable: selectable))
                     .toggleStyle(.switch)
                     .frame(height: 22)
                     .tag(selectable.id)
               #endif
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
      #if os(macOS)
         .frame(height: min((NSScreen.main?.frame.height ?? 100_000) - 54, Double(self.options.count) * 22 + 104))
      #endif
   }

   /// Creates a boolean binding for a given selectable item.
   ///
   /// This is used for creating toggles on macOS.
   ///
   /// - Parameter selectable: The item to create a binding for.
   /// - Returns: A `Binding<Bool>` representing whether the item is selected.
   private func boolBinding(selectable: Selectable) -> Binding<Bool> {
      Binding(
         get: { self.selected.contains(selectable) },
         set: { isOn in
            if isOn {
               self.selected.insert(selectable)
            } else {
               self.selected.remove(selectable)
            }
         }
      )
   }

   /// Toggles the selection state of a given item.
   ///
   /// This is used for handling selection on iOS/tvOS.
   ///
   /// - Parameter selectable: The item to toggle.
   private func toggleSelection(selectable: Selectable) {
      if let existingIndex = selected.firstIndex(where: { $0.id == selectable.id }) {
         self.selected.remove(at: existingIndex)
      } else {
         self.selected.insert(selectable)
      }
   }
}

#if DEBUG
   #Preview {
      struct Preview: View {
         /// A simple `Identifiable` and `Hashable` struct for preview purposes.
         struct IdentifiableString: Identifiable, Hashable {
            let string: String
            var id: String { string }
         }

         @State var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })

         var body: some View {
            NavigationStack {
               MultiSelectionView(
                  options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                  optionToString: { $0.string },
                  selected: $selected
               )
            }
         }
      }

      return Preview()
   }
#endif
