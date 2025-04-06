// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

/// Required for linking on linux at the moment
#if os(Linux)
    let linkerSettings: [LinkerSetting] = [.linkedLibrary("m")]
#else
    let linkerSettings: [LinkerSetting]? = nil
#endif

let package = Package(
    name: "RaylibSwift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RaylibSwift",
            targets: ["RaylibSwift"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .systemLibrary(
            name: "CRaylib",
            pkgConfig: "raylib"
        ),
        .target(
            name: "CRaygui",
            dependencies: ["CRaylib"],  // CRaygui depends on CRaylib
            sources: ["raygui_impl.c"],
            publicHeadersPath: "include"
        ),
        .target(
            name: "CRaylibExtensions",
            dependencies: ["CRaylib"],
            sources: ["raylib_extensions.c"],
            publicHeadersPath: "include"
        ),
        .target(
            name: "RaylibSwift",
            dependencies: ["CRaylib", "CRaylibExtensions", "CRaygui"],
            linkerSettings: linkerSettings
        ),
        .testTarget(
            name: "RaylibSwiftTests",
            dependencies: ["RaylibSwift"]
        ),
    ]
)
