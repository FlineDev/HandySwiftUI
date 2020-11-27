import Introspect
import SwiftUI

extension View {
  /// Makes views of type `TextField` become the first responder if the condition is met.
  public func becomeFirstResponder(if condition: Bool) -> some View {
    introspectTextField { textField in
      if condition {
        textField.becomeFirstResponder()
      }
    }
  }

  /// Resigns views of type `TextField` and `TextEditor` and sets the condition back to false.
  public func resignFirstResponder(when condition: Binding<Bool>) -> some View {
    introspectTextField { textField in
      if condition.wrappedValue {
        condition.wrappedValue = false
        textField.resignFirstResponder()
      }
    }
    .introspectScrollView { scrollView in
      if condition.wrappedValue {
        condition.wrappedValue = false
        #if !os(macOS)
          scrollView.endEditing(true)
        #endif
      }
    }
  }

  // MARK: - Platform-specific modifiers
  // Original source (modified):
  // https://github.com/InvadingOctopus/octopusui/blob/develop/Sources/OctopusUI/View%20Modifiers/OSSpecificViewModifiers.swift

  /// A wrapper for a view modifier that only applies on iOS/iPadOS.
  ///
  /// **Example**: `.iOS { $0.foregroundColor(.green) }`
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
  /// **Example**: `.macOS { $0.foregroundColor(.green) }`
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
  /// **Example**: `.tvOS { $0.foregroundColor(.green) }`
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
  /// **Example**: `.watchOS { $0.foregroundColor(.green) }`
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
}
