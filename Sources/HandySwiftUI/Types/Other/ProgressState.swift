import Foundation

/// Represents the state of a progress operation.
public enum ProgressState<ResultType: Sendable, ErrorType: CustomStringConvertible> {
   /// The operation has not started yet.
   case notStarted

   /// The operation is currently in progress.
   case inProgress

   /// The operation failed with an error.
   case failed(error: ErrorType)

   /// The operation completed successfully.
   case successful(result: ResultType)
}

extension ProgressState: Equatable where ResultType: Equatable, ErrorType: Equatable {}
extension ProgressState: Hashable where ResultType: Hashable, ErrorType: Hashable {}
extension ProgressState: Encodable where ResultType: Encodable, ErrorType: Encodable {}
extension ProgressState: Decodable where ResultType: Decodable, ErrorType: Decodable {}
extension ProgressState: Sendable where ResultType: Sendable, ErrorType: Sendable {}

extension ProgressState where ErrorType == String {
   /// Returns the error message if the state is `.failed`, or `nil` otherwise.
   public var failedErrorMessage: String? {
      guard case .failed(let errorMessage) = self else { return nil }
      return errorMessage
   }
}

extension ProgressState where ErrorType: Error {
   /// Returns the error description if the state is `.failed`, or `nil` otherwise.
   public var failedErrorDescription: String? {
      guard case .failed(let error) = self else { return nil }
      return error.localizedDescription
   }
}
