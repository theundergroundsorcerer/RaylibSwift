import CRaylib

/// Enables color equality comparisons
/// Replaces CRaylib.ColorIsEqual
extension Color: @retroactive Equatable {
    @inlinable
    public static func == (lhs: Color, rhs: Color) -> Bool {
        CRaylib.ColorIsEqual(lhs, rhs)
    }
}

/// Enables using colors in Sets and as Dictionary keys
extension Color: @retroactive Hashable {
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(r)
        hasher.combine(g)
        hasher.combine(b)
        hasher.combine(a)
    }
}

extension Color {
    /// Check if two colors are equal
    ///
    /// - Warning: Deprecated. Use the `==` operator instead.
    @available(*, deprecated, message: "Use the == operator instead")
    @inlinable
    public static func isEqual(color1: Color, color2: Color) -> Bool {
        CRaylib.ColorIsEqual(color1, color2)
    }

    /// Get color with alpha applied, alpha goes from 0.0f to 1.0f
    @inlinable
    public static func fade(_ color: Color, alpha: Float) -> Color {
        CRaylib.Fade(color, alpha)
    }

    /// Get hexadecimal value for a Color()
    @inlinable
    public static func toInt(_ color: Color) -> Int32 {
        Int32(color)
    }

    /// Get Color normalized as float [0..1]
    @inlinable
    public static func normalize(_ color: Color) -> Vector4 {
        CRaylib.ColorNormalize(color)
    }

    /// Get Color from normalized values [0..1]
    @inlinable
    public static func fromNormalized(_ normalized: Vector4) -> Color {
        CRaylib.ColorFromNormalized(normalized)
    }

    /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
    @inlinable
    public static func toHSV(_ color: Color) -> Vector3 {
        CRaylib.ColorToHSV(color)
    }

    /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
    @inlinable
    public static func fromHSV(hue: Float, saturation: Float, value: Float) -> Color {
        CRaylib.ColorFromHSV(hue, saturation, value)
    }

    /// Get color multiplied with another color
    @inlinable
    public static func tint(_ color: Color, using tint: Color) -> Color {
        CRaylib.ColorTint(color, tint)
    }

    /// Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
    @inlinable
    public static func brightness(_ color: Color, factor: Float) -> Color {
        CRaylib.ColorBrightness(color, factor)
    }

    /// Get color with contrast correction, contrast values between -1.0f and 1.0f
    @inlinable
    public static func contrast(_ color: Color, contrast: Float) -> Color {
        CRaylib.ColorContrast(color, contrast)
    }

    /// Get color with alpha applied, alpha goes from 0.0f to 1.0f
    @inlinable
    public static func alpha(_ color: Color, alpha: Float) -> Color {
        CRaylib.ColorAlpha(color, alpha)
    }

    /// Get src alpha-blended into dst color with tint
    @inlinable
    public static func alphaBlend(desitnation: Color, source: Color, tint: Color) -> Color {
        CRaylib.ColorAlphaBlend(desitnation, source, tint)
    }

    /// Get color lerp (linear interpolation) between two colors, factor [0.0f..1.0f]
    @inlinable
    public static func lerp(color1: Color, color2: Color, factor: Float32) -> Color {
        CRaylib.ColorLerp(color1, color2, factor)
    }

    /// Get Color structure from hexadecimal value
    @inlinable
    public static func fromHex(_ hexValue: UInt32) -> Color {
        CRaylib.GetColor(hexValue)
    }

    /// Get Color from a source pixel pointer of certain format
    @inlinable
    public static func pixelColor(source: UnsafeMutableRawPointer, format: Pixel.Format) -> Color {
        CRaylib.GetPixelColor(source, format.rawValue)
    }

    /// Set color formatted into destination pixel pointer
    @inlinable
    public static func setPixelColor(
        destination: UnsafeMutableRawPointer,
        color: Color,
        format: Pixel.Format
    ) {
        CRaylib.SetPixelColor(destination, color, format.rawValue)
    }

    /// Get pixel data size in bytes for certain format
    @inlinable 
    public static  func pixelDataSize(
        width: Int32, 
        height: Int32, 
        format: Pixel.Format) -> Int32 {
        CRaylib.GetPixelDataSize(width, height, format.rawValue)
    }
}

/*
// Color/pixel related functions
RLAPI bool ColorIsEqual(Color col1, Color col2);                            // Check if two colors are equal
RLAPI Color Fade(Color color, float alpha);                                 // Get color with alpha applied, alpha goes from 0.0f to 1.0f
RLAPI int ColorToInt(Color color);                                          // Get hexadecimal value for a Color (0xRRGGBBAA)
RLAPI Vector4 ColorNormalize(Color color);                                  // Get Color normalized as float [0..1]
RLAPI Color ColorFromNormalized(Vector4 normalized);                        // Get Color from normalized values [0..1]
RLAPI Vector3 ColorToHSV(Color color);                                      // Get HSV values for a Color, hue [0..360], saturation/value [0..1]
RLAPI Color ColorFromHSV(float hue, float saturation, float value);         // Get a Color from HSV values, hue [0..360], saturation/value [0..1]
RLAPI Color ColorTint(Color color, Color tint);                             // Get color multiplied with another color
RLAPI Color ColorBrightness(Color color, float factor);                     // Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
RLAPI Color ColorContrast(Color color, float contrast);                     // Get color with contrast correction, contrast values between -1.0f and 1.0f
RLAPI Color ColorAlpha(Color color, float alpha);                           // Get color with alpha applied, alpha goes from 0.0f to 1.0f
RLAPI Color ColorAlphaBlend(Color dst, Color src, Color tint);              // Get src alpha-blended into dst color with tint
RLAPI Color ColorLerp(Color color1, Color color2, float factor);            // Get color lerp interpolation between two colors, factor [0.0f..1.0f]
RLAPI Color GetColor(unsigned int hexValue);                                // Get Color structure from hexadecimal value
RLAPI Color GetPixelColor(void *srcPtr, int format);                        // Get Color from a source pixel pointer of certain format
RLAPI void SetPixelColor(void *dstPtr, Color color, int format);            // Set color formatted into destination pixel pointer
RLAPI int GetPixelDataSize(int width, int height, int format);              // Get pixel data size in bytes for certain format
*/

extension Int32 {
    @inlinable
    public init(_ color: Color) {
        self = CRaylib.ColorToInt(color)
    }
}
