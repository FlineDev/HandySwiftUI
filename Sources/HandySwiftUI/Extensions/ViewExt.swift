import SwiftUI

extension View {
   /// Erases the type of the view to `AnyView` to avoid issues with the compiler
   /// stating "Function declares an opaque type ..."
   ///
   /// This is useful when working with views of unknown types or when
   /// building dynamic UIs.
   public func eraseToAnyView() -> AnyView {
      AnyView(self)
   }

   /// Adds an inner border with a rounded rectangle shape with the provided corner radius.
   ///
   /// - Parameters:
   ///   - content: The fill style for the border.
   ///   - cornerRadius: The radius of the rounded corners. Defaults to 0.
   ///   - lineWidth: The width of the border line. Defaults to 1.
   ///
   /// - Returns: A view with a rounded rectangle border.
   public func roundedRectangleBorder(_ content: some ShapeStyle, cornerRadius: CGFloat, lineWidth: CGFloat = 1) -> some View {
      self
         .cornerRadius(cornerRadius)
         .overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: lineWidth).padding(-(lineWidth / 2)))
   }

   /// Adds an inner border with a capsule shape with the provided corner radius.
   ///
   /// - Parameters:
   ///   - content: The fill style for the border.
   ///   - lineWidth: The width of the border line. Defaults to 1.
   ///
   /// - Returns: A view with a capsule border.
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

   /// Adds a `.padding` modifier only when the current platform is macOS.
   @inlinable
   public func macOSOnlyPadding(insets: EdgeInsets) -> some View {
      #if os(macOS)
      return self.padding(insets)
      #else
      return self
      #endif
   }

   /// Adds a `.padding` modifier only when the current platform is macOS.
   @inlinable
   public func macOSOnlyPadding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil) -> some View {
      #if os(macOS)
      return self.padding(edges, length)
      #else
      return self
      #endif
   }

   /// Adds a `.frame` modifier only when the current platform is macOS.
   @inlinable
   public func macOSOnlyFrame(
      minWidth: CGFloat? = nil,
      idealWidth: CGFloat? = nil,
      maxWidth: CGFloat? = nil,
      minHeight: CGFloat? = nil,
      idealHeight: CGFloat? = nil,
      maxHeight: CGFloat? = nil,
      alignment: Alignment = .center
   ) -> some View {
      #if os(macOS)
      return self.frame(
         minWidth: minWidth,
         idealWidth: idealWidth,
         maxWidth: maxWidth,
         minHeight: minHeight,
         idealHeight: idealHeight,
         maxHeight: maxHeight,
         alignment: alignment
      )
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

   /// A wrapper for a view modifier that only applies on visionOS.
   ///
   /// **Example**: `.visionOSOnly { $0.foregroundColor(.green) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func visionOSOnly<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
      #if os(visionOS)
      return modifier(self)
      #else
      return self
      #endif
   }

   /// A wrapper for a view modifier that does **not** apply on visionOS; only on macOS, tvOS and watchOS.
   ///
   /// **Example**: `.visionOSExcluded { $0.foregroundColor(.red) }`
   ///
   /// - IMPORTANT: Using OS-specific APIs which may be unavailable on other platforms may cause compile-time errors.
   @inlinable
   public func visionOSExcluded<ModifiedView: View>(modifier: (Self) -> ModifiedView) -> some View {
      #if !os(visionOS)
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

   /// A wrapper for a view modifier that only applies if the given optional value is not `nil` and passes the unwrapped value as its second parameter.
   ///
   /// **Example**: `.ifLet(self.shadowColor) { $0.shadow(color: $1, radius: 40, x: 0, y: 10) } else: { $0.clipShape(.rect(cornerRadius: 15)) }`
   @inlinable
   public func ifLet<T, ModifiedView: View, ElseView: View>(
      _ optionalValue: T?,
      modifier: (Self, T) -> ModifiedView,
      else elseModifier: (Self) -> ElseView
   ) -> some View {
      if let optionalValue {
         return modifier(self, optionalValue).eraseToAnyView()
      }
      else {
         return elseModifier(self).eraseToAnyView()
      }
   }


   /// Executes the provided closure when the app is about to resign its active state (e.g., when switching to another app or minimizing the window).
   ///
   /// Use this modifier to perform cleanup tasks or save state when the app moves to the background.
   ///
   /// Example:
   /// ```swift
   /// struct VideoPlayerView: View {
   ///     @StateObject private var player = VideoPlayer()
   ///
   ///     var body: some View {
   ///         VideoContent(player: player)
   ///             .onAppResignActive {
   ///                 player.pause()
   ///             }
   ///     }
   /// }
   /// ```
   public func onAppResignActive(_ closure: @escaping () -> Void) -> some View {
      #if os(macOS)
      self.onReceive(
         NotificationCenter.default.publisher(for: NSApplication.willResignActiveNotification),
         perform: { _ in closure() }
      )
      #else
      self.onReceive(
         NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
         perform: { _ in closure() }
      )
      #endif
   }

   /// Executes the provided closure when the app becomes active (e.g., when returning from another app or un-minimizing the window).
   ///
   /// Use this modifier to resume tasks or refresh content when the app returns to the foreground.
   ///
   /// Example:
   /// ```swift
   /// struct ChatView: View {
   ///     @StateObject private var viewModel = ChatViewModel()
   ///
   ///     var body: some View {
   ///         MessagesList(messages: viewModel.messages)
   ///             .onAppBecomeActive {
   ///                 viewModel.refreshMessages()
   ///             }
   ///     }
   /// }
   /// ```
   public func onAppBecomeActive(_ closure: @escaping () -> Void) -> some View {
      #if os(macOS)
      self.onReceive(
         NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification),
         perform: { _ in closure() }
      )
      #else
      self.onReceive(
         NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification),
         perform: { _ in closure() }
      )
      #endif
   }

   #warning("🧑‍💻 consider creating keypath variants, as well as one for platforms")
}
