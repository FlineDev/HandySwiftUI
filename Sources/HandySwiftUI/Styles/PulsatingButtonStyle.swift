import HandySwift
import SwiftUI

/// A button style that creates a pulsating effect around the button's background.
public struct PulsatingButtonStyle: ButtonStyle {
   let color: Color
   let cornerRadius: CGFloat
   let glowRadius: CGFloat
   let duration: TimeInterval

   @State private var onBeat = false

   /// Initializes a new `PulsatingButtonStyle` with the specified properties.
   ///
   /// - Parameters:
   ///   - color: The color of the button and its pulsating effect.
   ///   - cornerRadius: The corner radius of the button.
   ///   - glowRadius: The radius of the pulsating effect's glow (default: 5).
   ///   - duration: The duration of a single pulsation cycle (default: 2 seconds).
   public init(color: Color, cornerRadius: CGFloat, glowRadius: CGFloat = 5, duration: TimeInterval = .seconds(2)) {
      self.color = color
      self.cornerRadius = cornerRadius
      self.glowRadius = glowRadius
      self.duration = duration
   }

   public func makeBody(configuration: Configuration) -> some View {
      configuration.label
         .background(
            RoundedRectangle(cornerRadius: self.onBeat ? self.cornerRadius + self.glowRadius : self.cornerRadius)
               .stroke(self.color, lineWidth: self.onBeat ? 2 * self.glowRadius : 0)
               .padding(self.onBeat ? -self.glowRadius : 0)
               .opacity(self.onBeat ? 0 : 0.5)
               .animation(.easeOut(duration: self.duration).repeatForever(autoreverses: false), value: self.onBeat)
               .onAppear {
                  self.onBeat.toggle()
               }
         )
   }
}

extension ButtonStyle where Self == PulsatingButtonStyle {
   /// Creates a `PulsatingButtonStyle` with customizable properties.
   ///
   /// - Parameters:
   ///   - color: The color of the button and its pulsating effect.
   ///   - cornerRadius: The corner radius of the button.
   ///   - glowRadius: The radius of the pulsating effect's glow (default: 5).
   ///   - duration: The duration of a single pulsation cycle (default: 2 seconds).
   ///
   /// - Returns: A new `PulsatingButtonStyle` instance.
   public static func pulsating(color: Color, cornerRadius: CGFloat, glowRadius: CGFloat = 5, duration: TimeInterval = .seconds(2))
      -> PulsatingButtonStyle
   {
      PulsatingButtonStyle(color: color, cornerRadius: cornerRadius, glowRadius: glowRadius, duration: duration)
   }
}

#if DEBUG
   #Preview {
      VStack {
         Button {

         } label: {
            Image(systemName: "person.circle")
               .font(.largeTitle)
               .foregroundStyle(Color.accentColor)
         }
         .buttonStyle(.pulsating(color: Color.accentColor, cornerRadius: 25))
      }
      .padding(20)
   }
#endif
