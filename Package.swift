// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "AlfredKit",
    products: [
        .library(
            name: "AlfredKit",
            targets: ["AlfredKit"]),
    ],
    targets: [
        .target(
            name: "AlfredKit",
            dependencies: []),
        .testTarget(
            name: "AlfredKitTests",
            dependencies: ["AlfredKit"]),
    ]
)
