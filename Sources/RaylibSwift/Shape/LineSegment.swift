/// A line defined by two points
public struct LineSegment {
    public var start: Point
    public var end: Point

    public init(start: Point, end: Point) {
        self.start = start
        self.end = end
    }
}

extension LineSegment {
    @inlinable 
    public init(_ start: Point, _ end: Point) {
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