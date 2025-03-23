import CRaylib

/// A typealias for String that provides raylib text functionality
public typealias Text = String

/// Static extensions
extension Text {
    /// Set vertical line spacing when drawing with line-breaks
    /// Maps to: SetTextLineSpacing
    @inlinable
    public static func setLineSpacing(_ spacing: Int32) {
        CRaylib.SetTextLineSpacing(spacing)
    }

    /// Measure string width for default font
    /// Maps to: MeasureText
    @inlinable
    public static func measureWidth(of text: Text, fontSize: Int32) -> Int32 {
        text.withCString { (textPtr: UnsafePointer<CChar>) in
            CRaylib.MeasureText(textPtr, fontSize)
        }
    }

    /// Measure string size for Font
    /// Maps to: MeasureTextEx
    @inlinable
    public static func measure(
        _ text: Text,
        font: Font,
        fontSize: Float,
        spacing: Float
    ) -> Vector2 {
        text.withCString { (textPtr: UnsafePointer<CChar>) in
            CRaylib.MeasureTextEx(font, textPtr, fontSize, spacing)
        }
    }

    /// Get glyph index position in font for a codepoint (unicode character)
    /// Fallback to "?" if not found
    /// Maps to: GetGlyphIndex
    @inlinable
    public static func glyphIndex(ofCodePoint codePoint: Int32, in font: Font) -> Int32 {
        CRaylib.GetGlyphIndex(font, codePoint)
    }

    /// Get glyph font info data for a codepoint (unicode character). 
    // Fallback to "?" if not found
    /// Maps to: GetGlyphInfo
    @inlinable
    public static func glyphInfo(ofCodePoint codePoint: Int32, in font: Font) -> GlyphInfo {
        CRaylib.GetGlyphInfo(font, codePoint)
    }

    /// Get glyph rectangle in font atlas for a codepoint (unicode character).
    /// Fallback to "?" if not found
    /// Maps to: GetGlyphAtlasRectangle 
    @inlinable
    public static func glyphAtlasRectangle(
        ofCodePoint codePoint: Int32,
        in font: Font
    ) -> Rectangle {
        return CRaylib.GetGlyphAtlasRec(font, codePoint)
    }
}

/// Instance methods
extension Text {
    /// Measure width of this text string with default font
    /// Maps to: MeasureText
    @inlinable
    public func measureWidth(fontSize: Int32) -> Int32 {
        return Text.measureWidth(of: self, fontSize: fontSize)
    }
    
    /// Measure size of this text string with custom font
    /// Maps to: MeasureTextEx
    @inlinable
    public func measure(
        using font: Font,
        fontSize: Float,
        spacing: Float
    ) -> Vector2 {
        return Text.measure(self, font: font, fontSize: fontSize, spacing: spacing)
    }
}
