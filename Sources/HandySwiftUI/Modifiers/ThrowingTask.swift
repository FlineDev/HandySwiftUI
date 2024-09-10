import SwiftUI

struct ThrowingTaskModifier: ViewModifier {
   let asyncAction: () async throws -> Void
   let catchError: (Error) -> Void

   init(
      asyncAction: @escaping () async throws -> Void,
      catchError: @escaping (Error) -> Void
   ) {
      self.asyncAction = asyncAction
      self.catchError = catchError
   }

   func body(content: Content) -> some View {
      content
         .task {
            do {
               try await self.asyncAction()
            } catch {
               self.catchError(error)
            }
         }
   }
}

extension View {
   /// Applies a `ThrowingTaskModifier` to the view, allowing you to execute an asynchronous task and handle errors.
   ///
   /// See `ThrowingTaskModifier` for more details and an example.
   ///
   /// - Parameters:
   ///   - asyncAction: The asynchronous task to execute.
   ///   - catchError: A closure that is called if an error occurs during the task execution.
   ///
   /// - Returns: A view with the `ThrowingTaskModifier` applied.
   public func throwingTask(
      asyncAction: @escaping () async throws -> Void,
      catchError: @escaping (Error) -> Void = { _ in }
   ) -> some View {
      self.modifier(ThrowingTaskModifier(asyncAction: asyncAction, catchError: catchError))
   }
}
