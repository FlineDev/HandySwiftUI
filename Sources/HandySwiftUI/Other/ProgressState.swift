import Foundation

public enum ProgressState: Hashable {
   case notStarted
   case inProgress
   case failed(errorMessage: String)
   case successful

   public var failedErrorMessage: String? {
      guard case .failed(let errorMessage) = self else { return nil }
      return errorMessage
   }
}
