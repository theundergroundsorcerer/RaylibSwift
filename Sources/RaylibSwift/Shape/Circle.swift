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

    /// Creates a circle with a Int32 tuple center point and radius
    @inlinable
    public init(center: (x: Int32, y: Int32), radius: Float) {
        self.init(Vector2(Float(center.x), Float(center.y)), radius)
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
        startAngle: Float,
        endAngle: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawCircleSector(
            self.center,
            self.radius,
            startAngle,
            endAngle,
            segments,
            color
        )
    }

    /// Draws the outline of a circular sector
    @inlinable
    public func drawSectorLines(
        startAngle: Float,
        endAngle: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawCircleSectorLines(
            self.center,
            self.radius,
            startAngle,
            endAngle,
            segments,
            color)
    }

    /// Draws gradient filled circle with inner and outer colors
    @inlinable
    public func drawGradient(innerColor: Color, outerColor: Color) {
        CRaylib.DrawCircleGradient(
            Int32(self.center.x),
            Int32(self.center.y),
            radius,
            innerColor,
            outerColor
        )
    }

    /// Draws outline of the circle
    @inlinable
    public func drawOutline(color: Color) {
        CRaylib.DrawCircleLinesV(self.center, self.radius, color)
    }

    /// Draws a filled ring segment
    @inlinable
    public func drawRing(
        innerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawRing(
            self.center,
            innerRadius,
            self.radius,
            startAngle, 
            endAngle,
            segments,
            color
        )
    }

    /// Draws the outline of the ring segment
    @inlinable func drawRingOutline(
        innerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawRingLines(
            self.center,
            innerRadius,
            self.radius,
            startAngle,
            endAngle,
            segments,
            color
        )
    }
}
