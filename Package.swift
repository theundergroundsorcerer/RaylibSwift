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
        .systemLibrary(
            name: "CRaylib",
            pkgConfig: "raylib",
            providers: [
                .brew(["raylib"])
            ]
        ),
        .target(
            name: "CRaylibExtensions",
            dependencies: ["CRaylib"],
            sources: ["raylib_extensions.c"],
            publicHeadersPath: "include"
        ),
        .target(
            name: "RaylibSwift",
            dependencies: ["CRaylib", "CRaylibExtensions"]
        ),
        .testTarget(
            name: "RaylibSwiftTests",
            dependencies: ["RaylibSwift"]
        ),
    ]
)
