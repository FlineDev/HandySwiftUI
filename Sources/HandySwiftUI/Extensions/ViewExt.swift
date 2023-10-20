import SwiftUI

extension View {
   /// Use to prevent issues with the compiler stating 'Function declares an opaque type ...' by calling on each returned view.
   public func eraseToAnyView() -> AnyView {
      AnyView(self)
   }
   
   /// Draws an inner border with a rounded rectangle shape with provided corner radius.
   public func roundedRectangleBorder(_ content: some ShapeStyle, cornerRadius: CGFloat, lineWidth: CGFloat = 1) -> some View {
      self
         .cornerRadius(cornerRadius)
         .overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: lineWidth).padding(-(lineWidth / 2)))
   }
   
   /// Draws an inner border with a capsule shape with provided corner radius.
   public func capsuleBorder(_ content: some ShapeStyle, lineWidth: CGFloat = 1) -> some View {
      self
         .cornerRadius(960)
         .overlay(Capsule().strokeBorder(content, lineWidth: lineWidth).padding(-(lineWidth / 2)))
   }

   // MARK: - Platform-specific modifiers
   // Original source (modified):
   // https://github.com/InvadingOctopus/octopusui/blob/develop/Sources/OctopusUI/View%20Modifiers/OSSpecificViewModifiers.swift
   
   /// A wrapper for a view modifier that only applies on iOS/iPadOS.
   ///
   /// **Example**: `.iOSOnly { $0.foregroundColor(.green) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func iOSOnly<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
#if os(iOS)
      return modifier(self)
#else
      return self
#endif
   }
   
   /// A wrapper for a view modifier that does **not** apply on iOS/iPadOS; only on macOS, tvOS and watchOS.
   ///
   /// **Example**: `.iOSExcluded { $0.foregroundColor(.red) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func iOSExcluded<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
#if !os(iOS)
      return modifier(self)
#else
      return self
#endif
   }
   
   /// A wrapper for a view modifier that only applies on macOS.
   ///
   /// **Example**: `.macOSOnly { $0.foregroundColor(.green) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func macOSOnly<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
#if os(macOS)
      return modifier(self)
#else
      return self
#endif
   }
   
   /// A wrapper for a view modifier that does **not** apply on macOS; only on iOS/iPadOS, tvOS and watchOS.
   ///
   /// **Example**: `.macOSExcluded { $0.foregroundColor(.red) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func macOSExcluded<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
#if !os(macOS)
      return modifier(self)
#else
      return self
#endif
   }
   
   /// A wrapper for a view modifier that only applies on tvOS.
   ///
   /// **Example**: `.tvOSOnly { $0.foregroundColor(.green) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func tvOSOnly<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
#if os(tvOS)
      return modifier(self)
#else
      return self
#endif
   }
   
   /// A wrapper for a view modifier that does **not** apply on tvOS; only on iOS/iPadOS, macOS and watchOS.
   ///
   /// **Example**: `.tvOSExcluded { $0.foregroundColor(.red) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func tvOSExcluded<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
#if !os(tvOS)
      return modifier(self)
#else
      return self
#endif
   }
   
   /// A wrapper for a view modifier that only applies on watchOS.
   ///
   /// **Example**: `.watchOSOnly { $0.foregroundColor(.green) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func watchOSOnly<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
#if os(watchOS)
      return modifier(self)
#else
      return self
#endif
   }
   
   /// A wrapper for a view modifier that does **not** apply on watchOS; only on iOS/iPadOS, macOS and tvOS.
   ///
   /// **Example**: `.watchOSExcluded { $0.foregroundColor(.red) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func watchOSExcluded<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
#if !os(watchOS)
      return modifier(self)
#else
      return self
#endif
   }
   
   /// A wrapper for a view modifier that only applies if the given condition is met and allows for providing another modification if not.
   ///
   /// **Example**: `.applyIf(colorScheme == .dark) { $0.shadow(color: Color(white: 0.88), radius: 40, x: 0, y: 10) } else: { $0.foregroundColor(.white) }`
   @inlinable
   public func applyIf<M: View, A: View>(
      _ condition: Bool,
      modifier: (Self) -> M,
      else alternativeModifier: (Self) -> A
   ) -> some View {
      if condition {
         return modifier(self).eraseToAnyView()
      }
      else {
         return alternativeModifier(self).eraseToAnyView()
      }
   }
   
   /// A wrapper for a view modifier that only applies if the given condition is met.
   ///
   /// **Example**: `.applyIf(colorScheme == .dark) { $0.shadow(color: Color(white: 0.88), radius: 40, x: 0, y: 10) }`
   @inlinable
   public func applyIf<ModifiedView: View>(_ condition: Bool, modifier: (Self) -> ModifiedView) -> some View {
      if condition {
         return modifier(self).eraseToAnyView()
      }
      else {
         return self.eraseToAnyView()
      }
   }
   
   /// A wrapper for a view modifier that only applies if the given condition is **not** met.
   ///
   /// **Example**: `.applyIfNot(colorScheme == .dark) { $0.shadow(color: Color(white: 0.88), radius: 40, x: 0, y: 10) }`
   @inlinable
   public func applyIfNot<ModifiedView: View>(_ condition: Bool, modifier: (Self) -> ModifiedView) -> some View {
      if !condition {
         return modifier(self).eraseToAnyView()
      }
      else {
         return self.eraseToAnyView()
      }
   }

   /// A wrapper for a view modifier that only applies if the given optional value is not `nil` and passes the unwrapped value as its second parameter.
   ///
   /// **Example**: `.ifLet(self.shadowColor) { $0.shadow(color: $1, radius: 40, x: 0, y: 10) }`
   @inlinable
   public func ifLet<T, ModifiedView: View>(_ optionalValue: T?, modifier: (Self, T) -> ModifiedView) -> some View {
      if let optionalValue {
         return modifier(self, optionalValue).eraseToAnyView()
      }
      else {
         return self.eraseToAnyView()
      }
   }

   #warning("🧑‍💻 consider creating keypath variants, as well as one for platforms")
}
