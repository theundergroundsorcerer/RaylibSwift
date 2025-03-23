import CRaylib

// Drawing functionality for Text (String)
extension Text {
    /// Draw text using default font
    /// Maps to: DrawText
    @inlinable
    public func draw(
        at position: (x: Int32, y: Int32),
        fontSize: Int32,
        color: Color
    ) {
        Graphics.drawText(self, at: position, fontSize: fontSize, color: color)
    }
    
    /// Draw text using custom font
    /// Maps to: DrawTextEx
    @inlinable
    public func draw(
        using font: Font,
        at position: Vector2,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        Graphics.drawText(self, using: font, at: position, fontSize: fontSize, spacing: spacing, color: color)
    }
    
    /// Draw text with rotation
    /// Maps to: DrawTextPro
    @inlinable
    public func draw(
        using font: Font,
        at position: Vector2,
        origin: Vector2,
        rotation: Float,
        fontSize: Float,
        spacing: Float,
        color: Color
    ) {
        Graphics.drawText(self, using: font, at: position, origin: origin, rotation: rotation, 
                          fontSize: fontSize, spacing: spacing, color: color)
    }
}