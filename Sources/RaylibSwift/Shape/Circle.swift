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
        CRaylib.DrawCircleSector(
            self.center,
            self.radius,
            startAngle,
            endAngle,
            segments ?? optimalSegmentCount(startAngle: startAngle, endAngle: endAngle),
            color
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
        CRaylib.DrawCircleSectorLines(
            self.center,
            self.radius,
            startAngle,
            endAngle,
            segments ?? optimalSegmentCount(startAngle: startAngle, endAngle: endAngle),
            color)
    }

    /// Draws gradient filled circle with inner and outer colors
    /// Maps to DrawCircleGradient() in raylib
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
    /// Maps to DrawCircleLinesV() in raylib
    @inlinable
    public func drawOutline(color: Color) {
        CRaylib.DrawCircleLinesV(self.center, self.radius, color)
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
        CRaylib.DrawRing(
            self.center,
            innerRadius,
            self.radius,
            startAngle,
            endAngle,
            segments ?? optimalSegmentCount(startAngle: startAngle, endAngle: endAngle),
            color
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
        CRaylib.DrawRingLines(
            self.center,
            innerRadius,
            self.radius,
            startAngle,
            endAngle,
            segments ?? optimalSegmentCount(startAngle: startAngle, endAngle: endAngle),
            color
        )
    }

    /// Calculates optimal number of segments for drawing circular arcs
    /// Custom Swift implementation that balances visual quality with performance
    /// Uses arc length and display scale to determine appropriate segment count
    @usableFromInline
    internal func optimalSegmentCount(
        startAngle: Float,
        endAngle: Float,
        pixelsPerLength: Float = 4.0,
        scale: Float = 1.0,
        minimum: Int32 = 12,
        maximum: Int32 = 72
    ) -> Int32 {
        let safeMinimum = minimum > 0 ? minimum : 12
        let safeMaximum = maximum > safeMinimum ? maximum : 72
        let safeScale = scale >= 0.1 && scale <= 10 ? scale : 1
        let safePixelsPerLength =
            pixelsPerLength >= 1 && pixelsPerLength <= 20 ? pixelsPerLength : 4

        let arcFraction = min(abs(endAngle - startAngle) / 360, 1)
        let pixelLength = arcFraction * 2 * Float.pi * radius * safeScale
        let base = Int32((pixelLength / safePixelsPerLength).rounded())
        return max(safeMinimum, min(base, safeMaximum))
    }
}
