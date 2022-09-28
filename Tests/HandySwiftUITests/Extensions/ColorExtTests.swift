import SwiftUI
import XCTest
@testable import HandySwiftUI

final class ColorExtTests: XCTestCase {
   func testChangeTo() {
      // testing if anything crashes when running this
      _ = Color.yellow.change(.luminance, to: 0.1)
   }
}
