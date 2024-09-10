// swift-tools-version:5.10
import PackageDescription

let package = Package(
   name: "HandySwiftUI",
   platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .visionOS(.v1), .watchOS(.v9)],
   products: [.library(name: "HandySwiftUI", targets: ["HandySwiftUI"])],
   dependencies: [.package(url: "https://github.com/FlineDev/HandySwift.git", from: "4.2.0")],
   targets: [.target(name: "HandySwiftUI", dependencies: [.product(name: "HandySwift", package: "HandySwift")])]
)
