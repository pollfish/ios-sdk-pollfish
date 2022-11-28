// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pollfish",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Pollfish",
            targets: ["Pollfish"])
    ],
    targets: [
        .binaryTarget(
            name: "Pollfish.xcframework",
            path: "Pollfish.xcframework")
    ],
    swiftLanguageVersions: [.v5]
)
