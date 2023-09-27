import SwiftUI

/// A ``Button`` that creates a ``Task`` in its action closure which gets automatically cancelled ``.onDisappear``.
/// The buttons shows both progress while the task is in progress and indicates success or failure when task is completed or throws an error.
public struct AsyncButton: View {
   let titleKey: LocalizedStringKey
   let systemImage: String?
   let asyncAction: () async throws -> Void
   let catchError: (Error) -> Void

   @State
   private var justCompleted: Bool = false

   @State
   private var justFailed: Bool = false

   @State
   private var task: Task<Void, Error>?

   var statefulSystemImage: String? {
      if self.justCompleted {
         return "checkmark"
      } else if self.justFailed {
         return "xmark"
      } else {
         return self.systemImage
      }
   }

   var statefulImageColor: Color? {
      if self.justCompleted {
         return Color.green
      } else if self.justFailed {
         return Color.red
      } else {
         return nil
      }
   }

   public init(
      _ titleKey: LocalizedStringKey,
      systemImage: String? = nil,
      asyncAction: @escaping () async throws -> Void,
      catchError: @escaping (Error) -> Void = { _ in }
   ) {
      self.titleKey = titleKey
      self.systemImage = systemImage
      self.asyncAction = asyncAction
      self.catchError = catchError
   }

   public var body: some View {
      Button {
         withAnimation {
            self.task = Task {
               do {
                  try await self.asyncAction()

                  withAnimation {
                     self.task = nil
                     self.justCompleted = true
                  }

                  Task {
                     try await Task.sleep(for: .seconds(2))
                     withAnimation {
                        self.justCompleted = false
                     }
                  }
               } catch {
                  withAnimation {
                     self.task = nil
                     self.justFailed = true
                  }

                  Task {
                     try await Task.sleep(for: .seconds(2))
                     withAnimation {
                        self.justFailed = false
                     }
                  }

                  self.catchError(error)
               }
            }
         }
      } label: {
         if self.task != nil {
            HStack(spacing: 4) {
               ProgressView()
                  .frame(width: 25)
               Text(self.titleKey)
            }
         } else {
            HStack(spacing: 4) {
               if let statefulSystemImage {
                  Image(systemName: statefulSystemImage)
                     .applyIf(self.statefulImageColor != nil) {
                        $0.foregroundStyle(self.statefulImageColor!)
                     }
                     .frame(width: 25)
               } else {
                  Color.clear.frame(width: 25)
               }

               Text(self.titleKey)
            }
         }
      }
      .disabled(self.task != nil)
      .onDisappear {
         self.task?.cancel()
      }
   }
}

#Preview {
   struct Preview: View {
      @State
      var errorMessage: String?
      
      var body: some View {
         VStack(spacing: 20) {
            AsyncButton("Succeed after 1 sec", systemImage: "play") {
               try await Task.sleep(for: .seconds(1))
            }

            AsyncButton("Fail after 1 sec", systemImage: "play") {
               try await Task.sleep(for: .seconds(1))
               throw CancellationError()
            } catchError: { error in
               withAnimation {
                  self.errorMessage = error.localizedDescription
               }
            }

            Group {
               if let errorMessage {
                  GroupBox {
                     Text("Failed with error:\n\(errorMessage)")
                  }
               } else {
                  Color.clear
               }
            }.frame(height: 100)
         }
      }
   }

   return Preview()
}
