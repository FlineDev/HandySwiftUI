// swift-tools-version: 6.0
import PackageDescription

let package = Package(
   name: "HandySwiftUI",
   platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .visionOS(.v1), .watchOS(.v9)],
   products: [.library(name: "HandySwiftUI", targets: ["HandySwiftUI"])],
   dependencies: [
//      // TODO: continue by running `swift package --disable-sandbox preview-documentation --target HandySwiftUI` and fixing build issues
//      .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
      .package(url: "https://github.com/FlineDev/HandySwift.git", from: "4.2.0")
   ],
   targets: [
      .target(
         name: "HandySwiftUI",
         dependencies: [.product(name: "HandySwift", package: "HandySwift")],
         resources: [.process("Localizable.xcstrings")]
      )
   ]
)
