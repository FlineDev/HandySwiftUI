import Foundation

/// Represents the state of an asynchronous operation that produces a result when successful.
///
/// Use this type to track the progression of asynchronous operations through their lifecycle:
/// - Initial state (not started)
/// - Loading state (in progress)
/// - Final state (either successful with a result or failed with an error)
///
/// Example usage:
/// ```swift
/// var state = AsyncResult<Int, Error>.notStarted
/// state = .inProgress
/// do {
///     let result = try await perform()
///     state = .successful(result: result)
/// } catch {
///     state = .failed(error: error)
/// }
/// ```
///
/// For operations that don't produce any value when successful, use ``AsyncState`` instead.
///
/// - Note: Both the result and error types must conform to `Sendable` and `CustomStringConvertible` respectively to ensure thread-safety and proper error reporting.
public enum AsyncResult<ResultType: Sendable, ErrorType: CustomStringConvertible> {
   /// The operation has not started yet.
   case notStarted

   /// The operation is currently in progress.
   case inProgress

   /// The operation failed with an error.
   case failed(error: ErrorType)

   /// The operation completed successfully.
   case successful(result: ResultType)
}

extension AsyncResult: Equatable where ResultType: Equatable, ErrorType: Equatable {}
extension AsyncResult: Hashable where ResultType: Hashable, ErrorType: Hashable {}
extension AsyncResult: Encodable where ResultType: Encodable, ErrorType: Encodable {}
extension AsyncResult: Decodable where ResultType: Decodable, ErrorType: Decodable {}
extension AsyncResult: Sendable where ResultType: Sendable, ErrorType: Sendable {}

extension AsyncResult where ErrorType == String {
   /// Returns the error message if the state is `.failed`, or `nil` otherwise.
   public var failedErrorMessage: String? {
      guard case .failed(let errorMessage) = self else { return nil }
      return errorMessage
   }
}

extension AsyncResult where ErrorType: Error {
   /// Returns the error description if the state is `.failed`, or `nil` otherwise.
   public var failedErrorDescription: String? {
      guard case .failed(let error) = self else { return nil }
      return error.localizedDescription
   }
}
