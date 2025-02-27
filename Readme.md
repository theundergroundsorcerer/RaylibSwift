
# RaylibSwift

Experimental bindings for Raylib for modern Swift and recent versions of Raylib. At the moment of writing, this is used for personal hobby projects by the author. Features will be added when needed.

## Current Status
- Implemented color macros
- Works for macOS and requires raylib to be installed with homebrew (however, other system-wide installations might work)

## Requirements

- Swift 6.0+
- raylib (installed via Homebrew)

## Installation

### 1. Install raylib

```bash
brew install raylib
```

### 2. Add the following dependency in your Package.swift file
```swift
.package(url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", from: "0.1.0")
```

Your Package.swift should look something like this:
```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MyProject",
    dependencies: [
        .package(url: "https://github.com/theundergroundsorcerer/RaylibSwift.git", from: "0.1.0")
    ],
    targets: [
        .executableTarget(
            name: "MyProject",
            dependencies: ["RaylibSwift"]),
    ]
)
```

## Usage
For now, just use it as if you'd use raylib, with the only difference being color macros replaced by 
`Color.red` instead of `RED` or `Color.darkBrown` instead of `DARKBROWN`.

### Example program
```swift
import RaylibSwift

// Initialize window
let screenWidth = 800
let screenHeight = 450
InitWindow(Int32(screenWidth), Int32(screenHeight), "RaylibSwift Example")
SetTargetFPS(60)

// Main game loop
while !WindowShouldClose() {
    
    // Draw
    BeginDrawing()
    
    ClearBackground(Color.rayWhite)
    DrawText("Welcome to RaylibSwift!", 190, 200, 20, Color.black)
    
    EndDrawing()
}

// Close window
CloseWindow()
```

## License
Raylib itself is licensed under a zlib/libpng license.  
The bindings are under MIT License.
