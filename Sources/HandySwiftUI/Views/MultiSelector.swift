import Foundation
import SwiftUI

/// A selector that supports choosing multiple options across a given set of options. Use `Picker` for choosing exactly one option.
public struct MultiSelector<Selectable: Identifiable & Hashable>: View {
   /// The title key for the view.
   public let titleKey: LocalizedStringKey

   /// The possible options to choose from.
   public let options: [Selectable]

   /// The color of the label.
   public var labelColor: Color

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
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
      } label: {
         LabeledContent {
            Text(self.formattedSelectedListString)
         } label: {
            Text(self.titleKey)
               .foregroundStyle(self.labelColor)
         }
      }
      #else
      HStack(spacing: 10) {
         Text(self.titleKey)
            .foregroundStyle(self.labelColor)

         Spacer()

         Text(self.selected.wrappedValue.isEmpty ? "--" : self.formattedSelectedListString)
            .foregroundStyle(Color.secondaryLabel)

         // TODO: localize 'Edit'
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
      labelColor: Color = .primary,
      optionToString: @escaping (Selectable) -> String
   ) {
      self.titleKey = titleKey
      self.options = options
      self.selected = selected
      self.labelColor = labelColor
      self.optionToString = optionToString
   }
}

#if DEBUG
#Preview {
   struct Preview: View {
      struct IdentifiableString: Identifiable, Hashable {
         let string: String
         var id: String { string }
      }

      @State
      var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })

      var body: some View {
         NavigationStack {
            Form {
               MultiSelector<IdentifiableString>(
                  titleKey: "MOCK: Multiselect",
                  options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                  selected: self.$selected,
                  labelColor: .green,
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

   return Preview()
}
#endif
