// swift-tools-version:5.3
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
    .package(name: "HandySwift", url: "https://github.com/Flinesoft/HandySwift.git", from: "3.2.1"),

    // Introspect underlying UIKit components from SwiftUI.
    .package(name: "Introspect", url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.1.0"),
  ],
  targets: [
    .target(name: "HandySwiftUI", dependencies: ["HandySwift", "Introspect"]),
    .testTarget(name: "HandySwiftUITests", dependencies: ["HandySwiftUI"]),
  ]
)
