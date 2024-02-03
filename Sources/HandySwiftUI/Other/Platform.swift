import Foundation
import HandySwift
#if os(iOS)
import UIKit
#endif

public enum Platform: AutoConforming {
   case mac
   case pad
   case pc
   case phone
   case tv
   case vision
   case watch

   static var current: Platform {
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

   /// - Returns: The value provided for the Platform-specific parameter if provided, else falls back to `default`.
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
