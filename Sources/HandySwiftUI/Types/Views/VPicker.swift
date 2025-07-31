import HandySwift
import SwiftUI

/// A custom vertical picker that displays options as a stack of buttons with icons and labels.
///
/// `VPicker` provides a visually appealing way to select a single option from a list,
/// presenting choices vertically with customizable icons and labels.
///
/// # Features
/// - Supports any `Hashable`, `Identifiable`, and `CustomLabelConvertible` type as options
/// - Custom label view for the picker
/// - Vertical layout with icon and text for each option
/// - Customizable icon angles and amounts
/// - Accessibility support with a standard picker representation
///
/// # Example usage:
/// ```swift
/// struct ContentView: View {
///     enum Mood: String, Identifiable, CustomLabelConvertible, CaseIterable {
///         case happy, neutral, sad
///
///         var description: String { rawValue.capitalized }
///         var symbolName: String {
///             switch self {
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
///             VPicker("How are you feeling?", selection: $selectedMood)
///         }
///     }
/// }
/// ```
public struct VPicker<T: Hashable & Identifiable & CustomLabelConvertible, L: View>: View {
   /// The array of selectable options.
   let options: [T]

   /// A closure that returns the label view for the picker.
   let label: () -> L

   /// A binding to the currently selected option.
   let selection: Binding<T?>

   /// Creates a new `VPicker` with the specified options, selection binding, and label.
   ///
   /// - Parameters:
   ///   - options: An array of selectable options.
   ///   - selection: A binding to the currently selected option.
   ///   - label: A closure that returns the label view for the picker.
   public init(options: [T], selection: Binding<T?>, label: @escaping () -> L) {
      self.options = options
      self.selection = selection
      self.label = label
   }

   @Environment(\.colorScheme) var colorScheme

   public var body: some View {
      VStack(spacing: 10) {
         self.label().padding(.top, 10)

         VStack {
            ForEach(self.options) { option in
               Button {
                  self.selection.wrappedValue = option
               } label: {
                  option.label
                     .labelStyle(
                        // TODO: add customizability of the label style for horizontal picker variation
                        .vertical(
                           iconColor: self.selection.wrappedValue == option ? .accentColor : .secondary,
                           iconFont: .system(size: 25, weight: .regular),
                           iconAngle: self.iconAngle(option: option),
                           iconAmount: self.iconAmount(option: option)
                        )
                     )
                     .font(.body)
                     .padding()
                     .frame(maxWidth: .infinity)
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
                     .overlay {
                        RoundedRectangle(cornerRadius: 12.5).strokeBorder(.gray, lineWidth: 0.5)
                     }
                     .clipShape(.rect(cornerRadius: 12.5))
                     #if os(iOS) || os(visionOS)
                        .contentShape(.hoverEffect, .rect(cornerRadius: 12.5)).hoverEffect()
                     #endif
               }
               .buttonStyle(.plain)
            }
         }
         .padding(.vertical, 10)
         .padding(.bottom, 10)
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
   }

   /// Calculates the angle for the icon of a given option.
   ///
   /// - Parameter option: The option to calculate the icon angle for.
   /// - Returns: An `Angle` if specified in the option's `symbolName`, otherwise `nil`.
   func iconAngle(option: T) -> Angle? {
      guard
         let degreesString = option.symbolName.components(separatedBy: "*")[0].components(separatedBy: ":")[safe: 1],
         let degrees = Double(degreesString)
      else { return nil }
      return Angle(degrees: degrees)
   }

   /// Calculates the amount of icons to display for a given option.
   ///
   /// - Parameter option: The option to calculate the icon amount for.
   /// - Returns: The number of icons to display, defaulting to 1 if not specified.
   func iconAmount(option: T) -> Int {
      guard
         let amountString = option.symbolName.components(separatedBy: "*")[safe: 1],
         let amount = Int(amountString)
      else { return 1 }
      return amount
   }
}

/// Convenience initializer for `VPicker` that uses a `Text` view as the label.
extension VPicker where L == Text {
   /// Creates a new `VPicker` with a `Text` label using a localized string key.
   ///
   /// - Parameters:
   ///   - titleKey: The localized string key for the picker's title.
   ///   - options: An array of selectable options.
   ///   - selection: A binding to the currently selected option.
   public init(_ titleKey: LocalizedStringKey, options: [T], selection: Binding<T?>) {
      self.label = { Text(titleKey).font(.headline) }
      self.options = options
      self.selection = selection
   }
}

/// Convenience initializer for `VPicker` that uses a `Text` view as the label.
extension VPicker where L == Text {
   /// Creates a new `VPicker` with a `Text` label using a localized string key.
   ///
   /// - Parameters:
   ///   - title: The localized string key for the picker's title.
   ///   - options: An array of selectable options.
   ///   - selection: A binding to the currently selected option.
   public init(_ title: String, options: [T], selection: Binding<T?>) {
      self.label = { Text(title).font(.headline) }
      self.options = options
      self.selection = selection
   }
}

/// Convenience initializer for `VPicker` when `T` conforms to `CaseIterable`.
extension VPicker where T: CaseIterable {
   /// Creates a new `VPicker` using all cases of an enumeration that conforms to `CaseIterable`.
   ///
   /// - Parameters:
   ///   - selection: A binding to the currently selected option.
   ///   - label: A closure that returns the label view for the picker.
   public init(selection: Binding<T?>, label: @escaping () -> L) {
      self.options = T.allCases as! [T]
      self.selection = selection
      self.label = label
   }
}

/// Convenience initializer for `VPicker` when `T` conforms to `CaseIterable` and using a `Text` label.
extension VPicker where T: CaseIterable, L == Text {
   /// Creates a new `VPicker` using all cases of an enumeration that conforms to `CaseIterable`, with a `Text` label.
   ///
   /// - Parameters:
   ///   - titleKey: The localized string key for the picker's title.
   ///   - selection: A binding to the currently selected option.
   public init(_ titleKey: LocalizedStringKey, selection: Binding<T?>) {
      self.label = { Text(titleKey).font(.headline) }
      self.options = T.allCases as! [T]
      self.selection = selection
   }
}

#if DEBUG
   #Preview {
      struct Preview: View {
         enum HogwartsHouse: String, Identifiable, CustomLabelConvertible, CaseIterable {
            case gryffindor, ravenclaw, hufflepuff, slytherin

            var description: String { self.rawValue.firstUppercased }
            var symbolName: String {
               switch self {
               case .gryffindor: "cat"
               case .ravenclaw: "bird"
               case .hufflepuff: "dog"
               case .slytherin: "lizard"
               }
            }
            var id: String { self.rawValue }
         }

         @State var selectedHouse: HogwartsHouse? = .gryffindor

         var body: some View {
            Form {
               VPicker("Hogwarts House", selection: self.$selectedHouse)
            }
            .macOSOnly { $0.padding().frame(minHeight: 450) }
         }
      }

      return Preview()
   }
#endif
