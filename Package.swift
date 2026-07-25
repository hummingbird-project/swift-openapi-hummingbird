// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-openapi-hummingbird",
    platforms: [.macOS(.v14), .iOS(.v17), .tvOS(.v17), .watchOS(.v10)],
    products: [.library(name: "OpenAPIHummingbird", targets: ["OpenAPIHummingbird"])],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-runtime.git", from: "1.0.0", traits: []),
        .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "OpenAPIHummingbird",
            dependencies: [
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            ]
        ),
        .testTarget(
            name: "OpenAPIHummingbirdTests",
            dependencies: ["OpenAPIHummingbird", .product(name: "HummingbirdTesting", package: "hummingbird")]
        ),
    ]
)
