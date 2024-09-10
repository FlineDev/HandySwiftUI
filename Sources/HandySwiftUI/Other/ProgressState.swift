import Foundation

/// Represents the state of a progress operation.
public enum ProgressState: Hashable, Codable {
   /// The operation has not started yet.
   case notStarted

   /// The operation is currently in progress.
   case inProgress

   /// The operation failed with an error.
   case failed(errorMessage: String)

   /// The operation completed successfully.
   case successful

   /// Returns the error message if the state is `.failed`, or `nil` otherwise.
   public var failedErrorMessage: String? {
      guard case .failed(let errorMessage) = self else { return nil }
      return errorMessage
   }
}
