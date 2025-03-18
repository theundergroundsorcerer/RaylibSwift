import CRaylib

/// A convenience type for describing a circle in raylib
public struct Circle {
    /// Backing storage for center point
    @usableFromInline
    internal var _center: Vector2

    /// Backing storage for radius
    @usableFromInline
    internal var _radius: Float

    /// The center point of the circle
    /// Direct access to circle's position with internal-only mutation
    @inlinable
    public internal(set) var center: Vector2 {
        get { _center }
        @usableFromInline
        set { _center = newValue }
    }
    
    /// The radius of the circle
    /// Provides automatic validation ensuring radius is never negative
    @inlinable
    public internal(set) var radius: Float {
        get {
            _radius
        }
        @usableFromInline
        set {
            _radius = newValue < 0 ? 0 : newValue
        }
    }

    /// Creates a circle with a center point and radius
    /// Maps to manual construction as CircleShape isn't in raylib C API
    public init(center: Vector2, radius: Float) {
        self._center = center
        self._radius = radius < 0 ? 0 : radius
    }

    /// Moves the circle in given direction
    /// Offsets the circle's center position by the provided vector
    @inlinable
    public mutating func move(offset: Vector2) {
        self.center = self.center + offset
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
        self.init(Vector2(Float(center.x), Float(center.y)), radius)
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
        Draw.circle(self, color: color)
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
        Draw.circleSector(
            at: self.center,
            radius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segments: segments
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
        Draw.circleSectorLines(
            at: self.center,
            radius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segments: segments
        )
    }

    /// Draws gradient filled circle with inner and outer colors
    /// Maps to DrawCircleGradient() in raylib
    @inlinable
    public func drawGradient(innerColor: Color, outerColor: Color) {
        Draw.circleGradient(
            at: (Int32(self.center.x), Int32(self.center.y)),
            radius: radius,
            innerColor: innerColor,
            outerColor: outerColor
        )
    }

    /// Draws outline of the circle
    /// Maps to DrawCircleLinesV() in raylib
    @inlinable
    public func drawOutline(color: Color) {
        Draw.circleLines(at: self.center, radius: self.radius, color: color)
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
        Draw.ring(
            at: self.center,
            innerRadius: innerRadius,
            outerRadius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segments: segments
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
        Draw.ringLines(
            at: self.center,
            innerRadius: innerRadius,
            outerRadius: self.radius,
            startAngle: startAngle,
            endAngle: endAngle,
            color: color,
            segments: segments
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


