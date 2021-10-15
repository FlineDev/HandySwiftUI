import SwiftUI

/// The type of progress for the overlay.
public enum ProgressType {
  /// An indeterminate progress indicator to be used to indicate an ongoing process without detailed progress information.
  case indeterminate(running: Bool, title: LocalizedStringKey?)

  /// A determinate progress indicator indicating the current state of progress.
  case determinate(progress: Progress)
}

fileprivate struct ProgressOverlay: ViewModifier {
  let progressType: ProgressType

  func body(content: Content) -> some View {
    content
      .overlay(
        Group {
          switch progressType {
          case let .indeterminate(running, title):
            if running {
              if let title = title {
                ProgressView(title)
              }
              else {
                ProgressView()
              }
            }
            else {
              EmptyView()
            }

          case let .determinate(progress):
            ProgressView(progress)
          }
        }
      )
  }
}

extension View {
  /// Show a progress overlay on the current view of the given type.
  public func progressOverlay(type: ProgressType) -> some View {
    modifier(ProgressOverlay(progressType: type))
  }
}
