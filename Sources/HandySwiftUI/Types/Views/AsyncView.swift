import SwiftUI

// TODO: make view more customizable with customizable in progress view (keep the default) and a customizable failed view (keep the default)
// TODO: document all public APIs in detail with practical real-world examples (and also improve the preview example to be more realistic)

public struct AsyncView<ResultType: Sendable, SuccessContent: View>: View {
   @State private var progressState: ProgressState<ResultType, String> = .notStarted

   let successContent: (ResultType) -> SuccessContent
   let loadingTask: () async throws -> ResultType

   let resultOptionalStorage: Binding<ResultType?>?
   let resultDefaultValueStorage: Binding<ResultType>?

   @State private var task: Task<Void, Error>?

   public init(
      editableResult resultOptionalStorage: Binding<ResultType?>,
      @ViewBuilder success successContent: @escaping (ResultType) -> SuccessContent,
      loadingTask: @escaping () async throws -> ResultType
   ) {
      self.successContent = successContent
      self.loadingTask = loadingTask
      self.resultOptionalStorage = resultOptionalStorage
      self.resultDefaultValueStorage = nil
   }

   public init(
      editableResult resultDefaultValueStorage: Binding<ResultType>,
      @ViewBuilder success successContent: @escaping (ResultType) -> SuccessContent,
      loadingTask: @escaping () async throws -> ResultType
   ) {
      self.successContent = successContent
      self.loadingTask = loadingTask
      self.resultOptionalStorage = nil
      self.resultDefaultValueStorage = resultDefaultValueStorage
   }

   public init(
      @ViewBuilder success successContent: @escaping (ResultType) -> SuccessContent,
      loadingTask: @escaping () async throws -> ResultType
   ) {
      self.successContent = successContent
      self.loadingTask = loadingTask
      self.resultOptionalStorage = nil
      self.resultDefaultValueStorage = nil
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
                        self.resultDefaultValueStorage?.wrappedValue = result
                        self.resultOptionalStorage?.wrappedValue = result
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
                        self.resultDefaultValueStorage?.wrappedValue = result
                        self.resultOptionalStorage?.wrappedValue = result
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

#if DEBUG && swift(>=6.0)
@available(iOS 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
#Preview {
   @Previewable @State var projectPath: String = ""

   AsyncView(editableResult: $projectPath) { projectPath in
      Text(verbatim: "Project Path: \(projectPath)")
   } loadingTask: {
      try await Task.sleep(for: .seconds(1))
      return "/fake/path/to/project"
   }
}
#endif
