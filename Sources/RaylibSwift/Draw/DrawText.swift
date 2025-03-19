import CRaylib
// Text Drawing functions
extension Graphics {
    /// Draw current FPS
    @inlinable
    public static func fps(at position: (x: Int32, y: Int32)) {
        CRaylib.DrawFPS(position.x, position.y)
    }

    /// Draw text (using default font)
    @inlinable
    public static func text(
        _ text: String,
        at position: (x: Int32, y: Int32),
        fontSize: Int32,
        color: Color
    ) {
        text.withCString { cText in
            CRaylib.DrawText(cText, position.x, position.y, fontSize, color)
        }
    }

    /// Draw text using font and additional parameters
    @inlinable
    public static func text(
        _ text: String,
        using font: Font,
        at position: Vector2,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        text.withCString { cText in
            CRaylib.DrawTextEx(font, cText, position, fontSize, spacing, color)
        }
    }

    /// Draw text using Font and pro parameters (rotation)
    @inlinable
    public static func text(
        _ text: String,
        using font: Font,
        at position: Vector2,
        origin: Vector2,
        rotation: Float,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        text.withCString { cText in
            CRaylib.DrawTextPro(font, cText, position, origin, rotation, fontSize, spacing, color)
        }
    }

    /// Draw one character (codepoint)
    @inlinable
    public static func codePoint(
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
    public static func codepoints(
        _ codepoints: [Int32],
        using font: Font,
        at position: Vector2,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        codepoints.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTextCodepoints(
                font,
                buffer.baseAddress,
                Int32(buffer.count),
                position,
                fontSize,
                spacing,
                color
            )
        }
    }

    /// Draw multiple characters from array slice
    @inlinable
    public static func codepoints(
        _ codepoints: ArraySlice<Int32>,
        using font: Font,
        at position: Vector2,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        codepoints.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTextCodepoints(
                font,
                buffer.baseAddress,
                Int32(buffer.count),
                position,
                fontSize,
                spacing,
                color
            )
        }
    }
}