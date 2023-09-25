#if canImport(SwiftData)
import SwiftData

@available(iOS 17, tvOS 17, macOS 14, *)
extension PersistentModel {
   public var isPersisted: Bool {
      self.persistentModelID.storeIdentifier != nil
   }
}
#endif
