// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "iOS-jigWatch-watch",
    platforms: [.iOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "iOS-jigWatch-watch",
            targets: ["iOS-jigWatch-watch"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "iOS-jigWatch-watch",
            dependencies: []),
        .testTarget(
            name: "iOS-jigWatch-watchTests",
            dependencies: ["iOS-jigWatch-watch"]),
    ]
)
