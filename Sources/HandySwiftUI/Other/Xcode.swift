import Foundation

public enum Xcode {
   public static var isRunningForPreviews: Bool {
      ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
   }
}
