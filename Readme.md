# RaylibSwift

Experimental bindings for Raylib for modern Swift and recent versions of Raylib.

## ⚠️ IMPORTANT: Development Status

**EARLY DEVELOPMENT - NOT RECOMMENDED FOR PRODUCTION USE**

This project is in active, early-stage development with frequent breaking changes. The API is unstable and subject to significant modifications without notice. It is currently used primarily for the author's personal hobby projects.

## Acknowledgments

- Special thanks to Ramon Santamaria ([@raysan5](https://github.com/raysan5)), the creator of Raylib, for developing the library that makes game programming more accessible.
- This project was inspired by and partially mimics the work of [STREGAsGate's Raylib](https://github.com/STREGAsGate/Raylib) for Swift. 

## Design Philosophy and Approach

This project differs from [STREGAsGate's Raylib](https://github.com/STREGAsGate/Raylib) bindings in the following ways:

- Up to date - has been tested against recent versions of Swift and Raylib.
- The API is not a literal translation of C to Swift - functions and types are broken into several namespaces and there are Swift wrappers for native Raylib when I believe it is more convenient.
- When there is no easy way to map Swift to C (like in logging functions), bridging utilities in C together with Swift wrappers are provided to achieve the same or practically equivalent functionality.
- An attempt is made to make writing code more "Swift idiomatic."
- A cheatsheet that translates C Raylib API to RaylibSwift will be provided (once most of raylib functionality has been ported).

## Currently Ported API Components (v0.2.0)

- **Window Management**: Basic window creation, configuration, and state management
- **Input Handling**: Keyboard, mouse, gamepad input detection
- **Graphics**: 
  - Shape drawing (rectangles, circles, triangles, polygons, lines)
  - Text rendering with various options
  - Texture loading and rendering
  - Color manipulation and blending
- **Collision Detection**: Basic collision detection between geometric shapes
- **Core Utilities**: Time functions, logging, configuration

Many Raylib features are still being ported, including 3D functionality, audio, and more advanced graphics features.

## Platform Support

- **macOS**: Supported with raylib installed via Homebrew
- **Linux**: Supported with manually installed raylib
- **Future Plans**: 
    - Bundle raylib files to make the package self-contained
    - Add support for Windows platforms
    - Note: No mobile platform support is planned at the moment

## Requirements

- Swift 6.0+
- raylib 5.5+ (installed via package manager or built manually)
- For Linux: GLFW, OpenGL, and other raylib dependencies

## Installation

### 1. Install raylib

**On macOS:**
```bash
brew install raylib
```

**On Linux or other platforms:**
Install raylib manually by following the instructions on the [official raylib website](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux). Make sure raylib is properly built and installed in your system paths.

⚠️ **Important Note for Linux Users**: The RaylibSwift package currently assumes raylib is installed in standard system paths (`/usr/local/include` and `/usr/local/lib`). If you've installed raylib in a custom location, you may need to modify the `shim.h` file in the Sources/CRaylib directory.

### 2. Add the following dependency in your Package.swift file
```swift
.package(url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", branch: "main")
```


Your Package.swift should look something like this:
```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
        name: "MyProject",
        dependencies: [
                .package(url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", exact: "0.2.0")
        ],
        targets: [
                .executableTarget(
                        name: "MyProject",
                        dependencies: ["RaylibSwift"]),
        ]
)
```

## Usage
This library is currently in pre-alpha stage and not ready for production use. Examples and usage documentation will be added once core functionality is implemented.

### Version Notes

- **v0.1.0 (master branch)**: The initial release that directly exposes the C API. This version is usable for projects that prefer working with the raw Raylib API. Please refer to Raylib documentation. It works in the same way as the C API - sometimes explicit type conversions are required, and a small subset of functionality is not exposed to Swift.
- **v0.2.0-dev**: Current development version with Swift-idiomatic wrappers and improved API organization.
- **v0.2.0-with-linux-support**: Adds support for Linux platforms with manually installed raylib.

### Example program
Coming soon! Check back after core functionality has been implemented.

## License

- **Raylib**: Licensed under [zlib/libpng license](https://github.com/raysan5/raylib/blob/master/LICENSE)  
- **RaylibSwift**: Licensed under MIT License