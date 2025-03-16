import CRaylib

/**
 * Swift-friendly extensions for Raylib's Color type
 * 
 * This extension provides all standard Raylib color constants as Swift properties,
 * replacing the C-style macros with clean Swift syntax. 
 *
 * Replaces: LIGHTGRAY, GRAY, DARKGRAY, etc.
 *
 * Example usage:
 * ```swift
 * // Instead of: DrawRectangle(10, 10, 100, 50, RED)
 * DrawRectangle(10, 10, 100, 50, Color.red)
 * ```
 */

 /// Color, 4 components, R8G8B8A8 (32bit)
public typealias Color = CRaylib.Color

public extension Color {
    /// Light gray color (200, 200, 200, 255)
    /// Replaces: LIGHTGRAY
    static var lightGray: Color { Color(r: 200, g: 200, b: 200, a: 255) }
    
    /// Gray color (130, 130, 130, 255)
    /// Replaces: GRAY
    static var gray: Color { Color(r: 130, g: 130, b: 130, a: 255) }
    
    /// Dark gray color (80, 80, 80, 255)
    /// Replaces: DARKGRAY
    static var darkGray: Color { Color(r: 80, g: 80, b: 80, a: 255) }
    
    /// Yellow color (253, 249, 0, 255)
    /// Replaces: YELLOW
    static var yellow: Color { Color(r: 253, g: 249, b: 0, a: 255) }
    
    /// Gold color (255, 203, 0, 255)
    /// Replaces: GOLD
    static var gold: Color { Color(r: 255, g: 203, b: 0, a: 255) }
    
    /// Orange color (255, 161, 0, 255)
    /// Replaces: ORANGE
    static var orange: Color { Color(r: 255, g: 161, b: 0, a: 255) }
    
    /// Pink color (255, 109, 194, 255)
    /// Replaces: PINK
    static var pink: Color { Color(r: 255, g: 109, b: 194, a: 255) }
    
    /// Red color (230, 41, 55, 255)
    /// Replaces: RED
    static var red: Color { Color(r: 230, g: 41, b: 55, a: 255) }
    
    /// Maroon color (190, 33, 55, 255)
    /// Replaces: MAROON
    static var maroon: Color { Color(r: 190, g: 33, b: 55, a: 255) }
    
    /// Green color (0, 228, 48, 255)
    /// Replaces: GREEN
    static var green: Color { Color(r: 0, g: 228, b: 48, a: 255) }
    
    /// Lime color (0, 158, 47, 255)
    /// Replaces: LIME
    static var lime: Color { Color(r: 0, g: 158, b: 47, a: 255) }
    
    /// Dark green color (0, 117, 44, 255)
    /// Replaces: DARKGREEN
    static var darkGreen: Color { Color(r: 0, g: 117, b: 44, a: 255) }
    
    /// Sky blue color (102, 191, 255, 255)
    /// Replaces: SKYBLUE
    static var skyBlue: Color { Color(r: 102, g: 191, b: 255, a: 255) }
    
    /// Blue color (0, 121, 241, 255)
    /// Replaces: BLUE
    static var blue: Color { Color(r: 0, g: 121, b: 241, a: 255) }
    
    /// Dark blue color (0, 82, 172, 255)
    /// Replaces: DARKBLUE
    static var darkBlue: Color { Color(r: 0, g: 82, b: 172, a: 255) }
    
    /// Purple color (200, 122, 255, 255)
    /// Replaces: PURPLE
    static var purple: Color { Color(r: 200, g: 122, b: 255, a: 255) }
    
    /// Violet color (135, 60, 190, 255)
    /// Replaces: VIOLET
    static var violet: Color { Color(r: 135, g: 60, b: 190, a: 255) }
    
    /// Dark purple color (112, 31, 126, 255)
    /// Replaces: DARKPURPLE
    static var darkPurple: Color { Color(r: 112, g: 31, b: 126, a: 255) }
    
    /// Beige color (211, 176, 131, 255)
    /// Replaces: BEIGE
    static var beige: Color { Color(r: 211, g: 176, b: 131, a: 255) }
    
    /// Brown color (127, 106, 79, 255)
    /// Replaces: BROWN
    static var brown: Color { Color(r: 127, g: 106, b: 79, a: 255) }
    
    /// Dark brown color (76, 63, 47, 255)
    /// Replaces: DARKBROWN
    static var darkBrown: Color { Color(r: 76, g: 63, b: 47, a: 255) }
    
    /// White color (255, 255, 255, 255)
    /// Replaces: WHITE
    static var white: Color { Color(r: 255, g: 255, b: 255, a: 255) }
    
    /// Black color (0, 0, 0, 255)
    /// Replaces: BLACK
    static var black: Color { Color(r: 0, g: 0, b: 0, a: 255) }
    
    /// Transparent color (0, 0, 0, 0)
    /// Replaces: BLANK
    static var blank: Color { Color(r: 0, g: 0, b: 0, a: 0) }
    
    /// Magenta color (255, 0, 255, 255)
    /// Replaces: MAGENTA
    static var magenta: Color { Color(r: 255, g: 0, b: 255, a: 255) }
    
    /// Raylib white color (245, 245, 245, 255)
    /// Replaces: RAYWHITE
    static var rayWhite: Color { Color(r: 245, g: 245, b: 245, a: 255) }
}