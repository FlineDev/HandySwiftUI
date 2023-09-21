#if canImport(SwiftData)
import SwiftData

@available(iOS 17, *)
extension PersistentModel {
   public var isPersisted: Bool {
      self.persistentModelID.storeIdentifier != nil
   }
}
#endif
