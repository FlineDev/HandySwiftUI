#if !os(macOS)
import Foundation
import SwiftUI

/// A selector that supports choosing multiple options across a given set of options. Use `Picker` for choosing exactly one option.
public struct MultiSelector<LabelView: View, Selectable: Identifiable & Hashable>: View {
  /// The view to use as the label for the multi-selector.
  public let label: LabelView
  
  /// The possible options to choose from.
  public let options: [Selectable]
  
  /// A closure that converts the given options to their String representation.
  public let optionToString: (Selectable) -> String
  
  /// A set of the currently selected options.
  public var selected: Binding<Set<Selectable>>
  
  private var formattedSelectedListString: String {
    ListFormatter.localizedString(byJoining: selected.wrappedValue.map { optionToString($0) })
  }
  
  public var body: some View {
    NavigationLink(destination: multiSelectionView()) {
      HStack {
        label
        Spacer()
        Text(formattedSelectedListString)
          .foregroundColor(.secondaryLabel)
          .multilineTextAlignment(.trailing)
      }
    }
  }
  
  public init(
    label: LabelView,
    options: [Selectable],
    selected: Binding<Set<Selectable>>,
    optionToString: @escaping (Selectable) -> String
  ) {
    self.label = label
    self.options = options
    self.selected = selected
    self.optionToString = optionToString
  }
  
  private func multiSelectionView() -> some View {
    MultiSelectionView(
      options: options,
      optionToString: optionToString,
      selected: selected
    )
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
    NavigationView {
      Form {
        MultiSelector<Text, IdentifiableString>(
          label: Text("MOCK: Multiselect"),
          options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
          selected: $selected,
          optionToString: { $0.string }
        )
      }
      .navigationTitle("MOCK: Title")
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .previewScreens()
  }
}
#endif
#endif
