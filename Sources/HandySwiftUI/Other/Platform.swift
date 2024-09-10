import Foundation
import HandySwift
#if os(iOS)
import UIKit
#endif

/// Represents the current platform on which the code is running.
public enum Platform: AutoConforming {
   /// macOS platform.
   case mac

   /// iPad platform.
   case pad

   /// Generic PC platform (includes Windows and Linux).
   case pc

   /// iPhone platform.
   case phone

   /// tvOS platform.
   case tv

   /// visionOS platform.
   case vision

   /// watchOS platform.
   case watch

   /// Returns the current platform based on the device's user interface idiom.
   public static var current: Platform {
      #if os(iOS)
      return UIDevice.current.userInterfaceIdiom == .phone ? .phone : .pad
      #elseif os(macOS)
      return .mac
      #elseif os(tvOS)
      return .tv
      #elseif os(visionOS)
      return .vision
      #elseif os(watchOS)
      return .watch
      #elseif os(Linux)
      return .pc
      #elseif os(Windows)
      return .pc
      #else
      fatalError("Unsupported operating system")
      #endif
   }

   /// Returns the value associated with the specified platform, or the default value if no platform-specific value is provided.
   ///
   /// - Parameters:
   ///   - defaultValue: The default value to return if no platform-specific value is provided.
   ///   - mac: The value for the macOS platform.
   ///   - pad: The value for the iPad platform.
   ///   - pc: The value for the PC platform.
   ///   - phone: The value for the iPhone platform.
   ///   - tv: The value for the tvOS platform.
   ///   - vision: The value for the visionOS platform.
   ///   - watch: The value for the watchOS platform.
   ///
   /// - Returns: The value associated with the current platform, or the default value.
   public static func value<T>(
      default defaultValue: T,
      mac: T? = nil,
      pad: T? = nil,
      pc: T? = nil,
      phone: T? = nil,
      tv: T? = nil,
      vision: T? = nil,
      watch: T? = nil
   ) -> T {
      switch Self.current {
      case .mac: mac ?? defaultValue
      case .pad: pad ?? defaultValue
      case .pc: pc ?? defaultValue
      case .phone: phone ?? defaultValue
      case .tv: tv ?? defaultValue
      case .vision: vision ?? defaultValue
      case .watch: watch ?? defaultValue
      }
   }
}
