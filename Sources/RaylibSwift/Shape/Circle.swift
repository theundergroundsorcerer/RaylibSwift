/// A convenience type for describing a circle in raylib
public struct Circle {
    /// The center point of the circle
    public var center: Point
    /// The radius of the circle
    public var radius: Float

    /// Creates a circle with a center point and radius
    public init(_ center: Point, _ radius: Float) {
        self.center = center
        self.radius = radius
    }
    
}

extension Circle {
    /// Creates a circle with a named center point and radius
    @inlinable
    public init(center: Point, radius: Float) {
        self.init(center, radius)
    }

    /// Creates a circle with a Float tuple center point and radius
    @inlinable
    public init (center: (x: Float, y: Float), radius: Float) {
        self.init(Point(center.x, center.y), radius)
    }

    /// Creates a circle with separate x/y coordinates and radius
    @inlinable 
    public init(centerX: Float, centerY: Float, radius: Float) {
        self.init(Point(centerX, centerY), radius)
    }

    /// Creates a circle with an Int32 tuple center point and radius
    @inlinable 
    public init(center: (x: Int32, y: Int32), radius: Float) {
        self.init(Point(center.x, center.y), radius)
    }
}
