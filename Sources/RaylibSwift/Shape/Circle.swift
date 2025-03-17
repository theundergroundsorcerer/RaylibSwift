import CRaylib

/// A convenience type for describing a circle in raylib
public struct Circle {
    /// The center point of the circle
    public var center: Vector2
    /// The radius of the circle
    public var radius: Float

    /// Creates a circle with a center point and radius
    public init(_ center: Vector2, _ radius: Float) {
        self.center = center
        self.radius = radius
    }

}

extension Circle {
    /// Creates a circle with a named center point and radius
    @inlinable
    public init(center: Vector2, radius: Float) {
        self.init(center, radius)
    }

    /// Creates a circle with a Float tuple center point and radius
    @inlinable
    public init(center: (x: Float, y: Float), radius: Float) {
        self.init(Vector2(center.x, center.y), radius)
    }

    /// Creates a circle with separate x/y coordinates and radius
    @inlinable
    public init(centerX: Float, centerY: Float, radius: Float) {
        self.init(Vector2(centerX, centerY), radius)
    }

    /// Draws using specified color
    @inlinable
    public func draw(color: Color) {
        Draw.circle(self, color: color)
    }

    /// Draws a filled circular sector
    @inlinable
    public func drawSector(
        fromAngle start: Float,
        toAngle end: Float, 
        segments: Int32, 
        color: Color
    ) {
        CRaylib.DrawCircleSector(
            self.center,
            self.radius,
            start,
            end,
            segments,
            color
        )
    }

    /// Draws the outline of a circular sector
    public func drawSectorLines(
        fromAngle start: Float, 
        toAngle end: Float, 
        segments: Int32, 
        color: Color
    ) {
        CRaylib.DrawCircleSectorLines(
            self.center,
            self.radius,
            start,
            end,
            segments,
            color)
    }

    /// Draws gradient filled circle with inner and outer colors
    public func drawGradient(innerColor: Color, outerColor: Color) {
        CRaylib.DrawCircleGradient(
            Int32(self.center.x), 
            Int32(self.center.y),
            radius, 
            innerColor, 
            outerColor)
    }
}
