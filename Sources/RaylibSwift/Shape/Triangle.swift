/// Triangle shape
import CRaylib

public struct Triangle {
    public var vertex1: Vector2
    public var vertex2: Vector2
    public var vertex3: Vector2

    public init(_ vertex1: Vector2, _ vertex2: Vector2, _ vertex3: Vector2) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
    }
}

extension Triangle {
    @inlinable
    public init(vertex1: Vector2, vertex2: Vector2, vertex3: Vector2) {
        self.init(vertex1, vertex2, vertex3)
    }

    @inlinable 
    public init(
        _ v1: (x: Float, y: Float),
        _ v2: (x: Float, y: Float),
        _ v3: (x: Float, y: Float)
    ) {
        self.init(Vector2(v1.x, v1.y), Vector2(v2.x, v2.y), Vector2(v3.x, v3.y) )
    }

    @inlinable
    public init(x1: Float, y1: Float, x2: Float, y2: Float, x3: Float, y3: Float) {
        self.init(Vector2(x1, y1), Vector2(x2, y2), Vector2(x3, y3))
    }
}