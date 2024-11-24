// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feed",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Feed",
            targets: ["Feed"]),
    ],
    dependencies: [
        .package(name: "API", path: "../Core/API"),
        .package(name: "Networking", path: "../Core/Networking")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Feed",
            dependencies: [
                .product(name: "HNClientProto", package: "API"),
                .product(name: "HNClient", package: "API"),
//                .product(name: "HNClientMock", package: "API"),
                .product(name: "NetworkingMock", package: "Networking")
            ]
        ),
        .testTarget(
            name: "FeedTests",
            dependencies: ["Feed"]
        ),
    ]
)
