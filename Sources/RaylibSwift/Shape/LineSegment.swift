/// A line defined by two points
public struct LineSegment {
    public var start: Vector2
    public var end: Vector2

    public init(start: Vector2, end: Vector2) {
        self.start = start
        self.end = end
    }
}

extension LineSegment {
    @inlinable 
    public init(_ start: Vector2, _ end: Vector2) {
        self.init(start: start, end: end)
    }

    @inlinable 
    public init(_ point1: (x: Float, y: Float), _ point2: (x: Float, y: Float)) {
        self.init(Point(point1.x, point1.y), Point(point2.x, point2.y))
    }

    @inlinable init(x1: Float, y1: Float, x2: Float, y2: Float) {
        self.init(Point(x1, y1), Point(x2, y2))
    }
}