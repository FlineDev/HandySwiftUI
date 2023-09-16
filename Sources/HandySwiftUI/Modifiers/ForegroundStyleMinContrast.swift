import SwiftUI

struct ForegroundStyleMinContrast: ViewModifier {
   @Environment(\.colorScheme)
   private var colorScheme

   let requestedColor: Color
   let minContrast: Double

   /// Returns `.white` if color scheme is `.light` and `.black` if color scheme is `.dark`.
   private var background: Color {
      if self.colorScheme == .dark {
         return .gray.change(.luminance, to: 0)
      } else {
         return .gray.change(.luminance, to: 1)
      }
   }

   func body(content: Content) -> some View {
      content
         .foregroundStyle(self.requestedColorWithMinContrast)
   }

   var requestedColorWithMinContrast: Color {
      let requestedColorLuminance = self.requestedColor.hlco.luminance
      let backgroundLuminance = self.background.hlco.luminance

      guard abs(requestedColorLuminance - backgroundLuminance) < self.minContrast else { return requestedColor }

      if backgroundLuminance > 0.5 {
         return self.requestedColor.change(.luminance, to: max(backgroundLuminance - self.minContrast, 0))
      } else {
         return self.requestedColor.change(.luminance, to: min(backgroundLuminance + self.minContrast, 1))
      }
   }
}

extension View {
   public func foregroundStyle(_ color: Color, minContrast: Double) -> some View {
      self.modifier(ForegroundStyleMinContrast(requestedColor: color, minContrast: minContrast))
   }
}

struct ColorExt_Previews: PreviewProvider {
   static var previews: some View {
      VStack(spacing: 10) {
         Text(".green").foregroundColor(.green)
         Text(".green, minContrast: 0.5").foregroundStyle(.green, minContrast: 0.66)
         Text(".red").foregroundColor(.red)
         Text(".red, minContrast: 0.5").foregroundStyle(.red, minContrast: 0.66)
      }
   }
}
