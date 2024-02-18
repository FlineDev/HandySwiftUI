import SwiftUI

public struct VPicker<T: Hashable & Identifiable & CustomLabelConvertible, L: View>: View {
   let options: [T]
   let label: () -> L
   let selection: Binding<T?>

   public init(options: [T], selection: Binding<T?>, label: @escaping () -> L) {
      self.options = options
      self.selection = selection
      self.label = label
   }

   @Environment(\.colorScheme)
   var colorScheme

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
                     .background(.thinMaterial)
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
                     #if !os(macOS)
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

   func iconAngle(option: T) -> Angle? {
      guard
         let degreesString = option.symbolName.components(separatedBy: "*")[0].components(separatedBy: ":")[try: 1],
         let degrees = Double(degreesString)
      else { return nil }
      return Angle(degrees: degrees)
   }

   func iconAmount(option: T) -> Int {
      guard
         let amountString = option.symbolName.components(separatedBy: "*")[try: 1],
         let amount = Int(amountString)
      else { return 1 }
      return amount
   }
}

extension VPicker where L == Text {
   public init(_ titleKey: LocalizedStringKey, options: [T], selection: Binding<T?>) {
      self.label = { Text(titleKey).font(.headline) }
      self.options = options
      self.selection = selection
   }
}

extension VPicker where T: CaseIterable {
   public init(selection: Binding<T?>, label: @escaping () -> L) {
      self.options = T.allCases as! [T]
      self.selection = selection
      self.label = label
   }
}

extension VPicker where T: CaseIterable, L == Text {
   public init(_ titleKey: LocalizedStringKey, selection: Binding<T?>) {
      self.label = { Text(titleKey).font(.headline) }
      self.options = T.allCases as! [T]
      self.selection = selection
   }
}

#Preview {
   struct Preview: View {
      enum HogwartsHouse: String, Identifiable, CustomLabelConvertible, CaseIterable {
         case gryffindor, ravenclaw, hufflepuff, slytherin

         var description: String { self.rawValue.firstCapitalized }
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

      @State
      var selectedHouse: HogwartsHouse? = .gryffindor

      var body: some View {
         Form {
            VPicker("Hogwarts House", selection: self.$selectedHouse)
         }
      }
   }

   return Preview()
}
