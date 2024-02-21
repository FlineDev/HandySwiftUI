import SwiftUI
import HandySwift

public struct HPicker<T: Hashable & Identifiable & CustomLabelConvertible, L: View>: View {
   let options: [T]
   let locked: Set<T>
   let label: () -> L
   let selection: Binding<T?>

   @Environment(\.colorScheme)
   var colorScheme
   
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
#if !os(macOS)
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
         let degreesString = option.symbolName.components(separatedBy: "*")[0].components(separatedBy: ":")[try: 1],
         let degrees = Double(degreesString)
      else { return nil }
      return Angle(degrees: degrees)
   }
   
   func iconAmount(option: T) -> Int {
      guard
         !self.locked.contains(option),
         let amountString = option.symbolName.components(separatedBy: "*")[try: 1],
         let amount = Int(amountString)
      else { return 1 }
      return amount
   }
}

extension HPicker where L == Text {
   public init(_ titleKey: LocalizedStringKey, options: [T], locked: Set<T>, selection: Binding<T?>) {
      self.label = { Text(titleKey).font(.headline) }
      self.locked = locked
      self.options = options
      self.selection = selection
   }
}

extension HPicker where T: CaseIterable {
   public init(locked: Set<T>, selection: Binding<T?>, label: @escaping () -> L) {
      self.options = T.allCases as! [T]
      self.locked = locked
      self.selection = selection
      self.label = label
   }
}

extension HPicker where T: CaseIterable, L == Text {
   public init(_ titleKey: LocalizedStringKey, locked: Set<T>, selection: Binding<T?>) {
      self.label = { Text(titleKey).font(.headline) }
      self.locked = locked
      self.options = T.allCases as! [T]
      self.selection = selection
   }
}

#Preview {
   struct Preview: View {
      enum HogwartsHouse: String, Identifiable, CustomLabelConvertible, CaseIterable {
         case gryffindor, ravenclaw, hufflepuff, slytherin
         
         var description: String { [self.rawValue.firstCapitalized, "(Some additional information!)"].joined(separator: "\n") }
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
      
      @State
      var selectedHouse: HogwartsHouse? = .gryffindor
      
      var body: some View {
         Form {
            HPicker("Hogwarts House", locked: [.gryffindor, .slytherin], selection: self.$selectedHouse)
         }
      }
   }
   
   return Preview()
}
