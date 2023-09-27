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
   public func throwingTask(
      asyncAction: @escaping () async throws -> Void,
      catchError: @escaping (Error) -> Void = { _ in }
   ) -> some View {
      self.modifier(ThrowingTaskModifier(asyncAction: asyncAction, catchError: catchError))
   }
}
