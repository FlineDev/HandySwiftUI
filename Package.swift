// swift-tools-version: 6.2
import PackageDescription

let package = Package(
   name: "HandySwiftUI",
   defaultLocalization: "en",
   platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .visionOS(.v1), .watchOS(.v9)],
   products: [.library(name: "HandySwiftUI", targets: ["HandySwiftUI"])],
   dependencies: [.package(url: "https://github.com/FlineDev/HandySwift.git", from: "4.4.0")],
   targets: [
      .target(
         name: "HandySwiftUI",
         dependencies: [.product(name: "HandySwift", package: "HandySwift")],
         resources: [.process("Localizable.xcstrings")]
      )
   ]
)
