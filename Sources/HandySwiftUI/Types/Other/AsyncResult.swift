import Foundation

/// Represents the state of an asynchronous operation that produces a value when successful.
///
/// Use this type to track the progression of asynchronous operations through their lifecycle:
/// - Initial state (not started)
/// - Loading state (in progress)
/// - Final state (either successful with a value or failed with an error)
///
/// Example usage:
/// ```swift
/// var state = AsyncResult<Int, Error>.notStarted
/// state = .inProgress
/// do {
///     let value = try await perform()
///     state = .successful(value: value)
/// } catch {
///     state = .failed(error: error)
/// }
/// ```
///
/// For operations that don't produce any value when successful, use ``AsyncState`` instead.
///
/// - Note: Both the value and error types must conform to `Sendable` and `CustomStringConvertible` respectively to ensure thread-safety and proper error reporting.
public enum AsyncResult<ValueType: Sendable, ErrorType: CustomStringConvertible> {
   /// The operation has not started yet.
   case notStarted

   /// The operation is currently in progress.
   case inProgress

   /// The operation failed with an error.
   case failed(error: ErrorType)

   /// The operation completed successfully.
   case successful(value: ValueType)
}

extension AsyncResult: Equatable where ValueType: Equatable, ErrorType: Equatable {}
extension AsyncResult: Hashable where ValueType: Hashable, ErrorType: Hashable {}
extension AsyncResult: Encodable where ValueType: Encodable, ErrorType: Encodable {}
extension AsyncResult: Decodable where ValueType: Decodable, ErrorType: Decodable {}
extension AsyncResult: Sendable where ValueType: Sendable, ErrorType: Sendable {}

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

extension AsyncResult {
   /// Returns the successful results unwrapped value if the async operation was successful. Else, returns `nil`.
   public var successValue: ValueType? {
      switch self {
      case .successful(let value): value
      default: nil
      }
   }
}
