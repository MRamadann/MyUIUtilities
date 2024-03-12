// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyUIUtilities",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "MyUIUtilities",
            targets: ["MyUIUtilities"]),
    ],
    dependencies: [
                .package(url: "https://github.com/MRamadann/UIPackage", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "MyUIUtilities",
            dependencies: []),
    ]
)
