// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "API",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HNClient",
            targets: ["HNClient"]),
        
        .library(name: "HNClientProto", targets: ["HNClientProto"]),
//        .library(name: "HNClientMock", targets: ["HNClientMock"])
    ],
    dependencies: [
        .package(name: "NetworkingClient", path: "../Networking")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "HNClient", dependencies: ["HNClientProto", .product(name: "NetworkingProto", package: "NetworkingClient")]),
        .target(name: "HNClientProto", dependencies: [.product(name: "NetworkingProto", package: "NetworkingClient")]),
//        .target(name: "HNClientMock", dependencies: ["HNClientProto"]),
        
        .testTarget(
            name: "APITests",
            dependencies: ["HNClient"]
        ),
    ]
)
