import CRaylib

/// A convenience type for describing a circle in raylib
public struct Circle {
    /// Center of the circle
    public var center: Vector2

    /// Radius of the circle - assumed not be negative

    @NonNegative public var radius: Float

    

    /// Creates a circle with a center point and radius
    /// Maps to manual construction as CircleShape isn't in raylib C API
    public init(center: Vector2, radius: Float) {
        self.center = center
        self.radius = radius < 0 ? 0 : radius
    }

    /// Moves the circle in given direction
    /// Offsets the circle's center position by the provided vector
    @inlinable
    public mutating func move(offset: Vector2) {
        self.center = self.center + offset
    }

    /// Moves the circle center to the given point (no raylib equivalent)
    @inlinable
    public mutating func move(to center: Vector2) {
        self.center = center
    }

    /// Changes the radius of the circle
    /// If the value is negative - radius is set to 0
    @inlinable
    public mutating func resize(radius: Float) {
        self.radius = radius
    }
}

extension Circle {
    /// Creates a circle with a named center point and radius
    /// Convenience initializer with positional parameters
    @inlinable
    public init(_ center: Vector2, _ radius: Float) {
        self.init(center: center, radius: radius)
    }

    /// Creates a circle with a Int32 tuple center point and radius
    /// Useful for interoperating with raylib functions that use int coordinates
    @inlinable
    public init(center: (x: Int32, y: Int32), radius: Float) {
        self.init(Vector2(F(center.x), F(center.y)), radius)
    }

    /// Creates a circle with separate x/y coordinates and radius
    /// Convenient when using individual coordinate values
    @inlinable
    public init(centerX: Float, centerY: Float, radius: Float) {
        self.init(center: Vector2(centerX, centerY), radius: radius)
    }

    /// Draws using specified color
    /// Maps to DrawCircleV() in raylib with automated parameter passing
    @inlinable
    public func draw(color: Color) {
        Graphics.drawCircle(self, color: color)
    }

    /// Draws a filled circular sector (a "pie slice")
    /// Maps to DrawCircleSector() in raylib
    @inlinable
    public func drawSector(
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segments: Int32? = nil
    ) {
        Graphics.drawCircleSector(
            at: self.center,
            radius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segments: segments
        )
    }

    /// Draws a filled circular sector (a "pie slice") with optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public func drawSector(
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        Graphics.drawCircleSector(
            at: self.center,
            radius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )
    }

    /// Draws the outline of a circular sector
    /// Maps to DrawCircleSectorLines() in raylib
    @inlinable
    public func drawSectorLines(
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segments: Int32? = nil
    ) {
        Graphics.drawCircleSectorLines(
            at: self.center,
            radius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segments: segments
        )
    }

    /// Draws the outline of a circular sector with optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public func drawSectorLines(
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        Graphics.drawCircleSectorLines(
            at: self.center,
            radius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )
    }

    /// Draws gradient filled circle with inner and outer colors
    /// Maps to DrawCircleGradient() in raylib
    @inlinable
    public func drawGradient(innerColor: Color, outerColor: Color) {
        Graphics.drawCircleGradient(
            at: (I(self.center.x), I(self.center.y)),
            radius: radius,
            innerColor: innerColor,
            outerColor: outerColor
        )
    }

    /// Draws outline of the circle
    /// Maps to DrawCircleLinesV() in raylib
    @inlinable
    public func drawOutline(color: Color) {
        Graphics.drawCircleLines(at: self.center, radius: self.radius, color: color)
    }

    /// Draws a filled ring segment (like a donut section)
    /// Maps to DrawRing() in raylib
    @inlinable
    public func drawRing(
        innerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segments: Int32? = nil
    ) {
        Graphics.drawRing(
            at: self.center,
            innerRadius: innerRadius,
            outerRadius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segments: segments
        )
    }

    /// Draws a filled ring segment (like a donut section) with optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public func drawRing(
        innerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        Graphics.drawRing(
            at: self.center,
            innerRadius: innerRadius,
            outerRadius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )
    }

    /// Draws the outline of the ring segment
    /// Maps to DrawRingLines() in raylib
    @inlinable
    public func drawRingOutline(
        innerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segments: Int32? = nil
    ) {
        Graphics.drawRingLines(
            at: self.center,
            innerRadius: innerRadius,
            outerRadius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segments: segments
        )
    }

    /// Draws the outline of a ring segment with optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public func drawRingOutline(
        innerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        Graphics.drawRingLines(
            at: self.center,
            innerRadius: innerRadius,
            outerRadius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )
    }

    /// Checks if this circle collides with another circle
    /// Maps to CheckCollisionCircles() in raylib
    @inlinable
    public func collides(with other: Circle) -> Bool {
        return Shapes.areColliding(self, and: other)
    }

    /// Checks if this circle collides with a rectangle
    /// Maps to CheckCollisionCircleRec() in raylib
    @inlinable
    public func collides(with rectangle: Rectangle) -> Bool {
        return Shapes.areColliding(self, and: rectangle)
    }

    /// Checks if this circle intersects with a line
    /// Maps to CheckCollisionCircleLine() in raylib
    @inlinable
    public func intersects(with line: Line) -> Bool {
        return Shapes.areColliding(self, and: line)
    }

    /// Checks if this circle contains a point
    /// Maps to CheckCollisionPointCircle() in raylib
    @inlinable
    public func contains(_ point: Vector2) -> Bool {
        return Shapes.isInside(of: self, point: point)
    }
}


