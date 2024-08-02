// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "JigWatch",
    platforms: [.iOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "JigWatch",
            targets: ["JigWatch"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "JigWatch",
            dependencies: []),
        .testTarget(
            name: "iOS-jigWatch-sdkTests",
            dependencies: ["JigWatch"]),
    ]
)
