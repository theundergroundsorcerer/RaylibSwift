// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RaylibSwift",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RaylibSwift",
            targets: ["RaylibSwift"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CRaylib",
            sources: ["shim.c"],  // Add your C source file
            publicHeadersPath: "include",  // Path where your shim.h is located
            cSettings: [
                .unsafeFlags(["-I/opt/homebrew/include"]),  // Add raylib include path
            ],
            linkerSettings: [
                .linkedLibrary("raylib"),  // Link against raylib
                .unsafeFlags(["-L/opt/homebrew/lib"])  // Add raylib library path
            ]
        ),
        .target(
            name: "RaylibSwift",
            dependencies: ["CRaylib"]
        ),
        .testTarget(
            name: "RaylibSwiftTests",
            dependencies: ["RaylibSwift"]
        ),
    ]
)
