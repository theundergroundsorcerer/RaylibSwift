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
    /// Returns nil if not found
    /// Maps to: GetGlyphIndex
    @inlinable
    public static func glyphIndex(ofCodePoint codePoint: Int32, in font: Font) -> Int32? {
        let index: Int32 = CRaylib.GetGlyphIndex(font, codePoint)

        guard index >= 0 && index < font.glyphCount && font.glyphs[Int(index)].value == codePoint
        else {
            return nil
        }

        return index
    }

    /// Get glyph font info data for a codepoint (unicode character). Returns nil if not found
    /// Equivalent to GetGlyphInfo but uses glyphIndex under the hood.
    @inlinable
    public static func glyphInfo(ofCodePoint codePoint: Int32, in font: Font) -> GlyphInfo? {
        Self.glyphIndex(ofCodePoint: codePoint, in: font).map { (index: Int32) in
            font.glyphs[Int(index)]
        }
    }

    /// Get glyph rectangle in font atlas for a codepoint (unicode character).
    /// Returns nil if not found
    /// Equivalent to GetGlyphAtlasRectangle but uses glyphIndex under the hood
    @inlinable
    public static func glyphAtlasRectangle(
        ofCodePoint codePoint: Int32,
        in font: Font
    ) -> Rectangle? {
        Self.glyphIndex(ofCodePoint: codePoint, in: font).map { (index: Int32) in
            font.recs[Int(index)]
        }
    }

}
