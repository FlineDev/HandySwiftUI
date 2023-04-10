// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
   name: "HandySwiftUI",
   platforms: [.iOS(.v14), .macOS(.v11), .tvOS(.v14)],
   products: [
      .library(name: "HandySwiftUI", targets: ["HandySwiftUI"])
   ],
   dependencies: [
      // Handy Swift features that didn't make it into the Swift standard library.
      .package(url: "https://github.com/FlineDev/HandySwift.git", branch: "main"),

      // Introspect underlying UIKit components from SwiftUI.
      .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.1.0"),
   ],
   targets: [
      .target(
         name: "HandySwiftUI",
         dependencies: [
            .product(name: "HandySwift", package: "HandySwift"),
            .product(name: "Introspect", package: "SwiftUI-Introspect"),
         ]
      ),
      .testTarget(name: "HandySwiftUITests", dependencies: ["HandySwiftUI"]),
   ]
)
