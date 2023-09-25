import Foundation
import SwiftUI

/// A selector that supports choosing multiple options across a given set of options. Use `Picker` for choosing exactly one option.
public struct MultiSelector<Selectable: Identifiable & Hashable>: View {
   /// The title key for the view.
   public let titleKey: LocalizedStringKey

   /// The possible options to choose from.
   public let options: [Selectable]
   
   /// A closure that converts the given options to their String representation.
   public let optionToString: (Selectable) -> String
   
   /// A set of the currently selected options.
   public var selected: Binding<Set<Selectable>>
   
   private var formattedSelectedListString: String {
      ListFormatter.localizedString(byJoining: selected.wrappedValue.map { optionToString($0) })
   }

   #if os(macOS)
   @State
   var showSelectorSheet: Bool = false
   #endif

   public var body: some View {
      #if !os(macOS)
      NavigationLink {
         MultiSelectionView(options: options, optionToString: optionToString, selected: selected)
            .navigationTitle(self.titleKey)
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
      } label: {
         LabeledContent(self.titleKey) {
            Text(self.formattedSelectedListString)
         }
      }
      #else
      HStack(spacing: 10) {
         Text(self.titleKey)

         Spacer()

         Text(self.formattedSelectedListString)
            .foregroundStyle(Color.secondaryLabel)

         Button("Edit") {
            self.showSelectorSheet = true
         }
      }
      .sheet(isPresented: self.$showSelectorSheet) {
         MultiSelectionView(options: options, optionToString: optionToString, selected: selected)
            .navigationTitle(self.titleKey)
      }
      #endif
   }
   
   /// Usage example:
   /// ```
   /// MultiSelector(
   ///   label: "Preferred Places",
   ///   options: self.availablePlaces,
   ///   selected: self.$preferredPlaces,
   ///   optionToString: \.description
   /// )
   /// ```
   public init(
      titleKey: LocalizedStringKey,
      options: [Selectable],
      selected: Binding<Set<Selectable>>,
      optionToString: @escaping (Selectable) -> String
   ) {
      self.titleKey = titleKey
      self.options = options
      self.selected = selected
      self.optionToString = optionToString
   }
}

#if DEBUG
struct MultiSelector_Previews: PreviewProvider {
   struct IdentifiableString: Identifiable, Hashable {
      let string: String
      var id: String { string }
   }
   
   @State static var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })
   
   static var previews: some View {
      NavigationStack {
         Form {
            MultiSelector<IdentifiableString>(
               titleKey: "MOCK: Multiselect",
               options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
               selected: $selected,
               optionToString: { $0.string }
            )
         }
         .navigationTitle("MOCK: Title")
      }
      .macOSOnly {
         $0.padding().frame(minWidth: 300, minHeight: 400)
      }
   }
}
#endif
