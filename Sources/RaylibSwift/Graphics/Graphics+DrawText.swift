import CRaylib
import Foundation

// Text Drawing functions
extension Graphics {
    /// Draw current FPS
    @inlinable
    public static func drawFps(at position: (x: Int32, y: Int32)) {
        CRaylib.DrawFPS(position.x, position.y)
    }

    /// Draw text (using default font)
    @inlinable
    public static func drawText(
        _ text: String,
        at position: (x: Int32, y: Int32),
        fontSize: Int32,
        color: Color
    ) {
        CRaylib.DrawText(text, position.x, position.y, fontSize, color)
    }

    /// Draw text using font and additional parameters
    @inlinable
    public static func drawText(
        _ text: String,
        using font: Font,
        at position: Vector2,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        CRaylib.DrawTextEx(font, text, position, fontSize, spacing, color)
    }

    /// Draw text using Font and pro parameters (rotation)
    @inlinable
    public static func drawText(
        _ text: String,
        using font: Font,
        at position: Vector2,
        origin: Vector2,
        rotation: Float,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        CRaylib.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, color)
    }

    /// Draw one character (codepoint)
    @inlinable
    public static func drawCodePoint(
        _ codepoint: Int32,
        using font: Font,
        at position: Vector2,
        fontSize: Float,
        color: Color
    ) {
        CRaylib.DrawTextCodepoint(font, codepoint, position, fontSize, color)
    }

    /// Draw multiple characters (codepoints)
    @inlinable
    public static func drawCodePoints(
        _ codepoints: [Int32],
        using font: Font,
        at position: Vector2,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        CRaylib.DrawTextCodepoints(
            font, codepoints, I(codepoints.count), position, fontSize, spacing, color)
    }

    /// Draw multiple characters from array slice
    @inlinable
    public static func drawCodePoints(
        _ codepoints: ArraySlice<Int32>,
        using font: Font,
        at position: Vector2,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        codepoints.withUnsafeBufferPointer { (buffer: UnsafeBufferPointer<Int32>) in
            CRaylib.DrawTextCodepoints(
                font,
                buffer.baseAddress,
                I(buffer.count),
                position,
                fontSize,
                spacing,
                color
            )
        }
    }
}
