// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HandySwiftUI",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(name: "HandySwiftUI", targets: ["HandySwiftUI"]),
    ],
    dependencies: [
        .package(name: "Introspect", url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "HandySwiftUI", dependencies: ["Introspect"]),
        .testTarget(name: "HandySwiftUITests", dependencies: ["HandySwiftUI"]),
    ]
)
