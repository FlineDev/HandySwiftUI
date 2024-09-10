import Foundation

/// Provides information about the current Xcode environment.
public enum Xcode {
   /// Indicates whether the code is running in Xcode's preview environment.
   ///
   /// This property can be used to conditionally adjust behavior or logic based on whether the code is being previewed in Xcode.
   public static var isRunningForPreviews: Bool {
      ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
   }
}
