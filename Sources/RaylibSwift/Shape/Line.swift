import CRaylib
/// A line defined by two points
public struct Line {
    /// Start position of the line
    public var start: Vector2
    
    /// End position of the line
    public var end: Vector2

    /// Creates a line with specified start and end points
    public init(start: Vector2, end: Vector2) {
        self.start = start
        self.end = end
    }

    /// Moves the line by the given offset
    /// Translates both endpoints by the specified amount
    @inlinable
    public mutating func move(offset: Vector2) {
        self.start += offset
        self.end += offset
    }
}

extension Line {
    /// Creates a line with positional parameters
    @inlinable 
    public init(_ start: Vector2, _ end: Vector2) {
        self.init(start: start, end: end)
    }

    /// Creates a line from tuples of coordinates
    @inlinable 
    public init(_ start: (x: Float, y: Float), _ end: (x: Float, y: Float)) {
        self.init(Vector2(start.x, start.y), Vector2(end.x, end.y))
    }

    /// Creates a line from individual coordinate components
    @inlinable 
    public init(x1: Float, y1: Float, x2: Float, y2: Float) {
        self.init(Vector2(x1, y1), Vector2(x2, y2))
    }
    
    /// Draws a line
    /// Maps to DrawLineV() in raylib
    @inlinable
    public func draw(color: Color) {
        CRaylib.DrawLineV(start, end, color)
    }
    
    /// Draws a line with specified thickness
    /// Maps to DrawLineEx() in raylib
    @inlinable
    public func draw(thickness: Float, color: Color) {
        CRaylib.DrawLineEx(start, end, thickness, color)
    }
    
    
    
    /// Checks if this line intersects with a circle
    /// Maps to CheckCollisionCircleLine() in raylib
    @inlinable
    public func intersects(with circle: Circle) -> Bool {
        return Shapes.areColliding(self, and: circle)
    }
    
    /// Checks if this line contains a point within specified threshold
    /// Maps to CheckCollisionPointLine() in raylib
    @inlinable
    public func contains(_ point: Vector2, threshold: Int32 = 1) -> Bool {
        return Shapes.isInside(of: self, point: point, threshold: threshold)
    }
    
    /// Calculates the intersection point with another line
    /// Returns nil if lines are parallel or don't intersect
    @inlinable
    public func intersection(with other: Line) -> Vector2? {
        return Shapes.intersection(of: self, and: other)
    }
}