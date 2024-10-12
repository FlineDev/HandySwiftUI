import SwiftUI

/// A custom toggle style that works like ``CheckboxToggleStyle`` but supports all Apple platforms, not just macOS.
public struct CheckboxUniversalToggleStyle: ToggleStyle {
   public func makeBody(configuration: Configuration) -> some View {
      #if os(macOS)
      Toggle(isOn: configuration.$isOn) {
         configuration.label
      }
      .toggleStyle(.checkbox)
      #elseif os(tvOS)
      Toggle(isOn: configuration.$isOn) {
         configuration.label
      }
      #else
      Button {
         withAnimation {
            configuration.isOn.toggle()
         }
      } label: {
         HStack(spacing: 14) {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
               .foregroundStyle(Color.accentColor)
               .font(.title2)
               .frame(width: 32, height: 32, alignment: .center)
               .padding(.leading, -2)

            configuration.label
         }
      }
      .buttonStyle(.plain)
      #endif
   }
}

extension ToggleStyle where Self == CheckboxUniversalToggleStyle {
   /// A custom toggle style that works like ``ToggleStyle.checkbox`` but supports all Apple platforms, not just macOS.
   public static var checkboxUniversal: CheckboxUniversalToggleStyle { .init() }
}

#if DEBUG && swift(>=6.0)
@available(iOS 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
#Preview {
   @Previewable @State var isOn: Bool = false

   Form {
      Toggle("Default Toggle Style", isOn: $isOn)

      Toggle("Checkbox Universal Style", isOn: $isOn)
         .toggleStyle(.checkboxUniversal)

      Label("Checkbox Label", systemImage: "square.fill")
   }
   .macOSOnlyPadding()
}
#endif
