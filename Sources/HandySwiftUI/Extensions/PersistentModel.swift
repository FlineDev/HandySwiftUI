#if canImport(SwiftData)
import SwiftData

@available(iOS 17, *)
extension PersistentModel {
   var isPersisted: Bool {
      self.persistentModelID.storeIdentifier != nil
   }
}
#endif
