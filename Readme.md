# RaylibSwift

Experimental bindings for Raylib for modern Swift and recent versions of Raylib. At the moment of writing, this is used for personal hobby projects by the author.

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


## Current Status

- **Pre-Alpha Stage**: The project is in very early development. Most functionality has not been implemented yet, and the library is not usable for production.
- **Platform Support**: Works on macOS with raylib installed via Homebrew. Linux support is now available!
- **Future Plans**: 
    - Bundle raylib files to make the package self-contained
    - Add support for Windows platforms
    - Note: No mobile platform support is planned at the moment. Swift currently lacks stable Android development capabilities, and there is no stable port of Raylib to iOS

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

### 2. Add the following dependency in your Package.swift file
```swift
.package(url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", branch: "v0.2.0-with-linux-support")
```

Your Package.swift should look something like this:
```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
        name: "MyProject",
        dependencies: [
                .package(url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", branch: "v0.2.0-with-linux-support")
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

### Example program
Coming soon! Check back after core functionality has been implemented.

## License

- **Raylib**: Licensed under [zlib/libpng license](https://github.com/raysan5/raylib/blob/master/LICENSE)  
- **RaylibSwift**: Licensed under MIT License