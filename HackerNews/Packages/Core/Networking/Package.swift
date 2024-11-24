// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "NetworkingClient", targets: ["NetworkingClient"]),
        .library(name: "NetworkingProto", targets: ["NetworkingProto"]),
        .library(name: "NetworkingMock", targets: ["NetworkingMock"])
    ],
    targets: [
        .target(name: "NetworkingClient", dependencies: ["NetworkingProto"]),
        .target(name: "NetworkingProto"),
        .target(name: "NetworkingMock", dependencies: ["NetworkingProto"]),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["NetworkingClient", "NetworkingProto"]
        ),
    ]
)
