import SwiftData
import Testing

@testable import HandySwiftUI

@Model
final class TestItem {
   var title: String

   init(title: String) {
      self.title = title
   }
}

@MainActor
struct PersistentModelExtTests {
   @Test
   func insertingIsEnoughWithoutSaving() throws {
      let container = try ModelContainer(for: TestItem.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
      let item = TestItem(title: "New Item")
      #expect(!item.isPersisted)

      container.mainContext.insert(item)
      #expect(item.isPersisted)
      #expect(container.mainContext.hasChanges, "not saved yet")
   }
}
