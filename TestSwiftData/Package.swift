// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Components",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Components",
            targets: ["Components"]),
    ],
    dependencies: [
        .package(path: "../NetworkLayer")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        .target(
            name: "Components",
            dependencies: ["NetworkLayer"]),
        .testTarget(
            name: "ComponentsTests",
            dependencies: ["Components"]),
    ]
)
