/// Contains Rectangle from CRaylib and its extension methods.

import CRaylib
/// Rectangle, 4 components
public typealias Rectangle = CRaylib.Rectangle

extension Rectangle {
    /// Initializes a rectangle with top-left position and dimensions
    @inlinable
    public init(topLeft: Vector2, width: Float, height: Float) {
        self.init(x: topLeft.x, y: topLeft.y, width: width, height: height)
    }

    /// Moves the rectangle by the given offset
    /// Translates position while maintaining size
    @inlinable
    public mutating func move(offset: Vector2) {
        self.x += offset.x
        self.y += offset.y
    }

    /// Draws a filled rectangle
    /// Maps to DrawRectangleRec() in raylib
    @inlinable
    public func draw(color: Color) {
        Graphics.drawRectangle(self, color: color)
    }
    
    /// Draws the outline of a rectangle
    /// Maps to DrawRectangleLinesEx() in raylib
    @inlinable
    public func drawOutline(color: Color, thickness: Float = 1.0) {
        Graphics.drawRectangleLines(self, thickness: thickness, color: color)
    }
    
    /// Draws a rectangle with rotation around an origin point
    /// Maps to DrawRectanglePro() in raylib
    @inlinable
    public func draw(origin: Vector2, rotation: Float, color: Color) {
        Graphics.drawRectangle(self, origin: origin, rotation: rotation, color: color)
    }
    
    /// Draws a rectangle with a custom gradient fill
    /// Maps to DrawRectangleGradientEx() in raylib
    @inlinable
    public func drawGradient(
        topLeftColor: Color, 
        bottomLeftColor: Color,
        topRightColor: Color,
        bottomRightColor: Color
    ) {
        Graphics.drawRectangleGradient(
            self,
            topLeftColor: topLeftColor,
            bottomLeftColor: bottomLeftColor,
            topRightColor: topRightColor,
            bottomRightColor: bottomRightColor)
    }
    
    /// Draws a rectangle with a vertical gradient fill
    /// Maps to DrawRectangleGradientV() in raylib
    @inlinable
    public func drawGradient(topColor: Color, bottomColor: Color) {
        Graphics.drawRectangleGradient(
            topLeft: (Int32(x), Int32(y)),
            width: Int32(width),
            height: Int32(height),
            topColor: topColor,
            bottomColor: bottomColor)
    }
    
    /// Draws a rectangle with a horizontal gradient fill
    /// Maps to DrawRectangleGradientH() in raylib
    @inlinable
    public func drawGradient(leftColor: Color, rightColor: Color) {
        Graphics.drawRectangleGradient(
            topLeft: (Int32(x), Int32(y)),
            width: Int32(width),
            height: Int32(height),
            leftColor: leftColor,
            rightColor: rightColor)
    }
    
    /// Draws a filled rectangle with rounded corners
    /// Maps to DrawRectangleRounded() in raylib
    @inlinable
    public func drawRounded(roundness: Float, color: Color, segments: Int32 = 9) {
        Graphics.drawRectangleRounded(self, roundness: roundness, color: color, segments: segments)
    }
    
    /// Draws the outline of a rectangle with rounded corners
    /// Maps to DrawRectangleRoundedLines() in raylib
    @inlinable
    public func drawRoundedOutline(
        roundness: Float,
        color: Color,
        segments: Int32 = 9
    ) {
        Graphics.drawRectangleRoundedLines(
            self,
            roundness: roundness,
            color: color,
            segments: segments)
    }
    
    /// Draws the outline of a rectangle with rounded corners and specified thickness
    /// Maps to DrawRectangleRoundedLinesEx() in raylib
    @inlinable
    public func drawRoundedOutline(
        roundness: Float,
        thickness: Float,
        color: Color,
        segments: Int32 = 9
    ) {
        Graphics.drawRectangleRoundedLines(
            self,
            roundness: roundness,
            thickness: thickness,
            color: color,
            segments: segments)
    }

    /// Draws a filled rectangle with rounded corners using optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public func drawRounded(
        roundness: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        Graphics.drawRectangleRounded(
            self,
            roundness: roundness,
            color: color,
            segmentPixelLength: segmentPixelLength,
            scale: scale)
    }

    /// Draws the outline of a rectangle with rounded corners using optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public func drawRoundedOutline(
        roundness: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        Graphics.drawRectangleRoundedLines(
            self,
            roundness: roundness,
            color: color,
            segmentPixelLength: segmentPixelLength,
            scale: scale)
    }

    /// Draws the outline of a rectangle with rounded corners and specified thickness using optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public func drawRoundedOutline(
        roundness: Float,
        thickness: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        Graphics.drawRectangleRoundedLines(
            self,
            roundness: roundness,
            thickness: thickness,
            color: color,
            segmentPixelLength: segmentPixelLength,
            scale: scale)
    }

    /// Checks if this rectangle collides with another rectangle
    /// Maps to CheckCollisionRecs() in raylib
    @inlinable
    public func collides(with other: Rectangle) -> Bool {
        return Shapes.areColliding(self, and: other)
    }

    /// Checks if this rectangle collides with a circle
    /// Maps to CheckCollisionCircleRec() in raylib
    @inlinable
    public func collides(with circle: Circle) -> Bool {
        return Shapes.areColliding(self, and: circle)
    }

    /// Checks if this rectangle contains a point
    /// Maps to CheckCollisionPointRec() in raylib
    @inlinable
    public func contains(_ point: Vector2) -> Bool {
        return Shapes.isInside(of: self, point: point)
    }

    /// Gets collision rectangle from overlap with another rectangle
    /// Maps to GetCollisionRec() in raylib
    @inlinable
    public func collisionRectangle(with other: Rectangle) -> Rectangle {
        return Shapes.collisionRectangle(of: self, and: other)
    }
}