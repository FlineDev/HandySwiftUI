import Foundation

@available(*, deprecated, renamed: "AsyncState")
public typealias ProgressState = AsyncState

/// Represents the state of an asynchronous operation.
///
/// Use this type to track the progression of asynchronous operations through their lifecycle:
/// - Initial state (not started)
/// - Loading state (in progress)
/// - Final state (either successful or failed with an error)
///
/// Example usage:
/// ```swift
/// var state = AsyncState<Error>.notStarted
/// state = .inProgress
/// do {
///     try await perform()
///     state = .successful
/// } catch {
///     state = .failed(error: error)
/// }
/// ```
///
/// For operations that produce a value when successful, use ``AsyncResult`` instead.
///
/// - Note: The error type must conform to `CustomStringConvertible` to ensure proper error reporting.
public enum AsyncState<ErrorType: CustomStringConvertible> {
   /// The operation has not started yet.
   case notStarted

   /// The operation is currently in progress.
   case inProgress

   /// The operation failed with an error.
   case failed(error: ErrorType)

   /// The operation completed successfully.
   case successful
}

extension AsyncState: Equatable where ErrorType: Equatable {}
extension AsyncState: Hashable where ErrorType: Hashable {}
extension AsyncState: Encodable where ErrorType: Encodable {}
extension AsyncState: Decodable where ErrorType: Decodable {}
extension AsyncState: Sendable where ErrorType: Sendable {}

extension AsyncState where ErrorType == String {
   /// Returns the error message if the state is `.failed`, or `nil` otherwise.
   public var failedErrorMessage: String? {
      guard case .failed(let errorMessage) = self else { return nil }
      return errorMessage
   }
}

extension AsyncState where ErrorType: Error {
   /// Returns the error description if the state is `.failed`, or `nil` otherwise.
   public var failedErrorDescription: String? {
      guard case .failed(let error) = self else { return nil }
      return error.localizedDescription
   }
}
