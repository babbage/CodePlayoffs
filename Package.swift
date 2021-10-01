// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodePlayoffs",
    products: [
        .library(
            name: "CodePlayoffs",
            targets: ["TheDraft"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TheDraft",
            dependencies: []),
        .testTarget(
            name: "ThePlayoffs",
            dependencies: ["TheDraft"]),
    ]
)
