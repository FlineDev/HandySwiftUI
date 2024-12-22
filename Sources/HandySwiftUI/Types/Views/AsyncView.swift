import SwiftUI

// TODO: make view more customizable with customizable in progress view (keep the default) and a customizable failed view (keep the default)
// TODO: document all public APIs in detail with practical real-world examples (and also improve the preview example to be more realistic)

public struct AsyncView<ResultType: Sendable, SuccessContent: View>: View {
   @State private var progressState: ProgressState<ResultType, String> = .notStarted

   let successContent: (ResultType) -> SuccessContent
   let loadingTask: () async throws -> ResultType

   @State private var task: Task<Void, Error>?

   public init(
      @ViewBuilder success successContent: @escaping (ResultType) -> SuccessContent,
      loadingTask: @escaping () async throws -> ResultType
   ) {
      self.successContent = successContent
      self.loadingTask = loadingTask
   }

   public var body: some View {
      Group {
         switch self.progressState {
         case .notStarted:
            Color.clear
               .onAppear {
                  self.progressState = .inProgress

                  self.task = Task {
                     do {
                        let result = try await self.loadingTask()
                        self.progressState = .successful(result: result)
                     } catch {
                        self.progressState = .failed(error: error.localizedDescription)
                     }
                  }
               }

         case .inProgress:
            ProgressView(String(localized: "Loading…", bundle: .module))
               .padding()

         case .failed(let errorMessage):
            VStack {
               Text("Failed to load with error: \(errorMessage)", bundle: .module)

               Button(String(localized: "Try again", bundle: .module)) {
                  self.progressState = .inProgress

                  self.task = Task {
                     do {
                        let result = try await self.loadingTask()
                        self.progressState = .successful(result: result)
                     } catch {
                        self.progressState = .failed(error: error.localizedDescription)
                     }
                  }
               }
            }
            .padding()

         case .successful(let result):
            self.successContent(result)
         }
      }
      .onDisappear {
         self.task?.cancel()
      }
   }
}

#if DEBUG
#Preview {
   AsyncView {
      Text("Hello World")
   } loadingTask: {
      try await Task.sleep(for: .seconds(1))
   }
}
#endif
