/// Contains Rectangle from CRaylib and its extension methods.

import CRaylib
/// Rectangle, 4 components
public typealias Rectangle = CRaylib.Rectangle

extension Rectangle {
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
        CRaylib.DrawRectangleRec(self, color)
    }
    
    /// Draws the outline of a rectangle
    /// Maps to DrawRectangleLinesEx() in raylib
    @inlinable
    public func drawOutline(thickness: Float = 1.0, color: Color) {
        CRaylib.DrawRectangleLinesEx(self, thickness, color)
    }
    
    /// Draws a rectangle with rotation around an origin point
    /// Maps to DrawRectanglePro() in raylib
    @inlinable
    public func draw(origin: Vector2, rotation: Float, color: Color) {
        CRaylib.DrawRectanglePro(self, origin, rotation, color)
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
        CRaylib.DrawRectangleGradientEx(
            self, topLeftColor, bottomLeftColor, topRightColor, bottomRightColor)
    }
    
    /// Draws a filled rectangle with rounded corners
    /// Maps to DrawRectangleRounded() in raylib
    @inlinable
    public func drawRounded(roundness: Float, segments: Int32, color: Color) {
        CRaylib.DrawRectangleRounded(self, roundness, segments, color)
    }
    
    /// Draws the outline of a rectangle with rounded corners
    /// Maps to DrawRectangleRoundedLinesEx() in raylib
    @inlinable
    public func drawRoundedOutline(
        roundness: Float,
        segments: Int32, 
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawRectangleRoundedLinesEx(self, roundness, segments, thickness, color)
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