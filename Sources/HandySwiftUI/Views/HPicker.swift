import SwiftUI
import HandySwift

/// A custom picker that displays options as a horizontal row of buttons with icons and labels.
/// It supports locked options, custom labels, and accessibility features.
///
/// `HPicker` is designed to provide a visually appealing and interactive way to select from a list of options,
/// each represented by an icon and a label.
///
/// # Features
/// - Horizontal layout with customizable icons and labels
/// - Support for locked (disabled) options
/// - Custom label for the picker
/// - Accessibility support with a standard picker representation
/// - Flexible initialization options for different use cases
///
/// # Example usage:
/// ```swift
/// struct ContentView: View {
///     enum Mood: String, Identifiable, CustomLabelConvertible, CaseIterable {
///         case superHappy, happy, neutral, sad
///
///         var description: String { rawValue.capitalized }
///         var symbolName: String {
///             switch self {
///             case .superHappy: "hand.thumbsup*2"  // show icon twice
///             case .happy: "hand.thumbsup"
///             case .neutral: "face.thumbsup:90"  // rotate icon by 90 degrees
///             case .sad: "hand.thumbsdown"
///             }
///         }
///         var id: Self { self }
///     }
///
///     @State private var selectedMood: Mood?
///
///     var body: some View {
///         Form {
///             HPicker("How are you feeling?", selection: $selectedMood)
///         }
///     }
/// }
/// ```
public struct HPicker<T: Hashable & Identifiable & CustomLabelConvertible, L: View>: View {
   /// The array of selectable options.
   let options: [T]

   /// A set of options that should be displayed as locked (non-selectable).
   let locked: Set<T>

   /// A closure that returns the label view for the picker.
   let label: () -> L

   /// A binding to the currently selected option.
   let selection: Binding<T?>

   @Environment(\.colorScheme) var colorScheme

   /// Creates a new `HPicker` with the specified options, locked items, selection binding, and label.
   ///
   /// - Parameters:
   ///   - options: An array of selectable options.
   ///   - locked: A set of options that should be displayed as locked (non-selectable).
   ///   - selection: A binding to the currently selected option.
   ///   - label: A closure that returns the label view for the picker.
   public init(options: [T], locked: Set<T>, selection: Binding<T?>, label: @escaping () -> L) {
      self.options = options
      self.locked = locked
      self.selection = selection
      self.label = label
   }

   public var body: some View {
      VStack(spacing: 10) {
         self.label().padding(.top, 10)
         
         HStack {
            ForEach(self.options) { option in
               Button {
                  self.selection.wrappedValue = option
               } label: {
                  Label(option.description, systemImage: self.locked.contains(option) ? "lock" : option.symbolSystemName)
                     .labelStyle(
                        .vertical(
                           spacing: 10,
                           iconColor: self.selection.wrappedValue == option ? .accentColor : .secondary,
                           iconFont: .system(size: self.options.count > 3 ? 20 : 25, weight: .regular),
                           iconAngle: self.iconAngle(option: option),
                           iconAmount: self.iconAmount(option: option)
                        )
                     )
                     .font(.body)
                     .minimumScaleFactor(0.66)
                     .multilineTextAlignment(.center)
                     .padding(.vertical)
                     .padding(.horizontal, 5)
                     .frame(maxWidth: .infinity, maxHeight: .infinity)
                     .background(OS.current == .iOS ? .thinMaterial : .regularMaterial)
                     .applyIf(self.selection.wrappedValue == option) {
                        $0
                           .background(Color.accentColor.opacity(0.33))
                           .overlay {
                              RoundedRectangle(cornerRadius: 12.5)
                                 .strokeBorder(Color.accentColor, lineWidth: 2)
                           }
                           .fontWeight(.semibold)
                     }
                     .clipShape(.rect(cornerRadius: 12.5))
                     .shadow(color: .black.opacity(self.colorScheme == .dark ? 0.33 : 0.1), radius: 6)
                     #if os(iOS) || os(visionOS)
                     .contentShape(.hoverEffect, .rect(cornerRadius: 12.5)).hoverEffect()
                     #endif
               }
               .padding(.vertical)
               .buttonStyle(.plain)
            }
         }
      }
      .accessibilityRepresentation {
         Picker(selection: self.selection) {
            Text(verbatim: "–").tag(T?.none)
            
            ForEach(self.options) { option in
               option.label.tag(option as T?)
            }
         } label: {
            self.label()
         }
      }
      .frame(maxHeight: 190)
   }
   
   func iconAngle(option: T) -> Angle? {
      guard
         !self.locked.contains(option),
         let degreesString = option.symbolName.components(separatedBy: "*")[0].components(separatedBy: ":")[safe: 1],
         let degrees = Double(degreesString)
      else { return nil }
      return Angle(degrees: degrees)
   }
   
   func iconAmount(option: T) -> Int {
      guard
         !self.locked.contains(option),
         let amountString = option.symbolName.components(separatedBy: "*")[safe: 1],
         let amount = Int(amountString)
      else { return 1 }
      return amount
   }
}

/// Convenience initializer for `HPicker` that uses a `Text` view as the label.
extension HPicker where L == Text {
   /// Creates a new `HPicker` with a `Text` label using a localized string key.
   ///
   /// - Parameters:
   ///   - titleKey: The localized string key for the picker's title.
   ///   - options: An array of selectable options.
   ///   - locked: A set of options that should be displayed as locked (non-selectable).
   ///   - selection: A binding to the currently selected option.
   public init(_ titleKey: LocalizedStringKey, options: [T], locked: Set<T>, selection: Binding<T?>) {
      self.label = { Text(titleKey).font(.headline) }
      self.locked = locked
      self.options = options
      self.selection = selection
   }
}

/// Convenience initializer for `HPicker` when `T` conforms to `CaseIterable`.
extension HPicker where T: CaseIterable {
   /// Creates a new `HPicker` using all cases of an enumeration that conforms to `CaseIterable`.
   ///
   /// - Parameters:
   ///   - locked: A set of options that should be displayed as locked (non-selectable).
   ///   - selection: A binding to the currently selected option.
   ///   - label: A closure that returns the label view for the picker.
   public init(locked: Set<T>, selection: Binding<T?>, label: @escaping () -> L) {
      self.options = T.allCases as! [T]
      self.locked = locked
      self.selection = selection
      self.label = label
   }
}

/// Convenience initializer for `HPicker` when `T` conforms to `CaseIterable` and using a `Text` label.
extension HPicker where T: CaseIterable, L == Text {
   /// Creates a new `HPicker` using all cases of an enumeration that conforms to `CaseIterable`, with a `Text` label.
   ///
   /// - Parameters:
   ///   - titleKey: The localized string key for the picker's title.
   ///   - locked: A set of options that should be displayed as locked (non-selectable).
   ///   - selection: A binding to the currently selected option.
   public init(_ titleKey: LocalizedStringKey, locked: Set<T>, selection: Binding<T?>) {
      self.label = { Text(titleKey).font(.headline) }
      self.locked = locked
      self.options = T.allCases as! [T]
      self.selection = selection
   }
}

#if DEBUG
#Preview {
   struct Preview: View {
      enum HogwartsHouse: String, Identifiable, CustomLabelConvertible, CaseIterable {
         case gryffindor, ravenclaw, hufflepuff, slytherin
         
         var description: String { [self.rawValue.firstUppercased, "(Some additional information!)"].joined(separator: "\n") }
         var symbolName: String {
            switch self {
            case .gryffindor: "cat"
            case .ravenclaw: "bird:-30"
            case .hufflepuff: "dog*2"
            case .slytherin: "lizard:90*2"
            }
         }
         var id: String { self.rawValue }
      }
      
      @State var selectedHouse: HogwartsHouse? = .gryffindor

      var body: some View {
         Form {
            HPicker("Hogwarts House", locked: [.gryffindor, .slytherin], selection: self.$selectedHouse)
         }
         .macOSOnly { $0.padding().frame(minWidth: 700) }
      }
   }
   
   return Preview()
}
#endif
