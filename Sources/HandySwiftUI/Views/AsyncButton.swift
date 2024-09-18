import SwiftUI

/// A ``Button`` that creates a ``Task`` in its action closure which gets automatically cancelled ``.onDisappear``.
/// The button shows both progress while the task is in progress and indicates success or failure when the task is completed or throws an error.
///
/// This button is useful for performing asynchronous operations with visual feedback, such as network requests or lengthy computations.
///
/// # Features
/// - Displays a progress indicator while the task is running
/// - Shows a checkmark for successful completion
/// - Shows an X mark for task failure
/// - Automatically cancels the task when the view disappears
///
/// # Example usage:
/// ```swift
/// struct ContentView: View {
///     @State private var result: String = ""
///
///     var body: some View {
///         VStack {
///             Text(result)
///             AsyncButton("Fetch Data", systemImage: "arrow.down.circle") {
///                 // Simulating a network request
///                 try await Task.sleep(for: .seconds(2))
///                 self.result = "Data fetched successfully!"
///             } catchError: { error in
///                 self.result = "Error: \(error.localizedDescription)"
///             }
///         }
///     }
/// }
/// ```
public struct AsyncButton: View {
   /// The localized string key for the button's title.
   let titleKey: LocalizedStringKey

   /// An optional system image name to display alongside the title.
   let systemImage: String?

   /// The asynchronous action to perform when the button is tapped.
   let asyncAction: () async throws -> Void

   /// A closure to handle any errors thrown by the async action.
   let catchError: (Error) -> Void

   /// Indicates whether the task just completed successfully.
   @State private var justCompleted: Bool = false

   /// Indicates whether the task just failed.
   @State private var justFailed: Bool = false

   /// The current task being executed, if any.
   @State private var task: Task<Void, Error>?

   /// Computes the appropriate system image based on the button's state.
   var statefulSystemImage: String? {
      if self.justCompleted {
         return "checkmark"
      } else if self.justFailed {
         return "xmark"
      } else {
         return self.systemImage
      }
   }

   /// Computes the appropriate image color based on the button's state.
   var statefulImageColor: Color? {
      if self.justCompleted {
         return Color.green
      } else if self.justFailed {
         return Color.red
      } else {
         return nil
      }
   }

   /// Creates a new `AsyncButton` with the specified title, optional system image, async action, and error handler.
   ///
   /// - Parameters:
   ///   - titleKey: The localized string key for the button's title.
   ///   - systemImage: An optional system image name to display alongside the title.
   ///   - asyncAction: The asynchronous closure to execute when the button is tapped.
   ///   - catchError: A closure to handle any errors thrown by the async action. Defaults to doing nothing.
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
            HStack(spacing: .platformDefaultSpacing / 2) {
               ProgressView()
                  .frame(width: .platformDefaultTextHeight)
                  .macOSOnly {
                     $0.scaleEffect(0.5).frame(height: .platformDefaultTextHeight - 2)
                  }
               Text(self.titleKey)
            }
         } else {
            HStack(spacing: .platformDefaultSpacing / 2) {
               if let statefulSystemImage {
                  Image(systemName: statefulSystemImage)
                     .applyIf(self.statefulImageColor != nil) {
                        $0.foregroundStyle(self.statefulImageColor!)
                     }
                     .frame(width: .platformDefaultTextHeight)
               } else if self.systemImage != nil {
                  Color.clear.frame(width: .platformDefaultTextHeight)
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

            AsyncButton("Fail after 1 sec") {
               try await Task.sleep(for: .seconds(1))
               throw CancellationError()
            } catchError: { error in
               withAnimation {
                  self.errorMessage = error.localizedDescription
               }
            }

            Group {
               if let errorMessage {
                  #if os(tvOS)
                  Text("Failed with error:\n\(errorMessage)")
                  #else
                  GroupBox {
                     Text("Failed with error:\n\(errorMessage)")
                  }
                  #endif
               } else {
                  Color.clear
               }
            }.frame(height: 100)
         }
         .padding()
      }
   }

   return Preview()
}
