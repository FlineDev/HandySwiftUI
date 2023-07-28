// swift-tools-version:5.9
import PackageDescription

let package = Package(
   name: "HandySwiftUI",
   platforms: [.iOS(.v17), .macOS(.v14), .tvOS(.v17), .watchOS(.v10), .visionOS(.v1)],
   products: [.library(name: "HandySwiftUI", targets: ["HandySwiftUI"])],
   dependencies: [.package(url: "https://github.com/FlineDev/HandySwift.git", branch: "main")],
   targets: [
      .target(
         name: "HandySwiftUI",
         dependencies: [.product(name: "HandySwift", package: "HandySwift")]
      ),
      .testTarget(name: "HandySwiftUITests", dependencies: ["HandySwiftUI"]),
   ]
)
