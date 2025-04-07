/// Triangle shape representing three points in 2D space
import CRaylib

public struct Triangle {
    /// Internal tuple storage for all three vertices
    @usableFromInline
    internal var vertices: (v1: Vector2, v2: Vector2, v3: Vector2)

    /// First vertex of the triangle
    /// Direct access with internal-only mutation
    @inlinable
    public internal(set) var vertex1: Vector2 {
        get { vertices.v1 }
        @usableFromInline
        set { vertices.v1 = newValue }
    }

    /// Second vertex of the triangle
    /// Direct access with internal-only mutation
    @inlinable
    public internal(set) var vertex2: Vector2 {
        get { vertices.v2 }
        @usableFromInline
        set { vertices.v2 = newValue }
    }

    /// Third vertex of the triangle
    /// Direct access with internal-only mutation
    @inlinable
    public internal(set) var vertex3: Vector2 {
        get { vertices.v3 }
        @usableFromInline
        set { vertices.v3 = newValue }
    }

    /// Creates a triangle with three positional vertices
    public init(_ vertex1: Vector2, _ vertex2: Vector2, _ vertex3: Vector2) {
        self.vertices = (v1: vertex1, v2: vertex2, v3: vertex3)
    }
    
    /// Moves the triangle by the given offset
    /// Translates all vertices by the specified amount
    @inlinable
    public mutating func move(offset: Vector2) {
        self.vertex1 += offset
        self.vertex2 += offset
        self.vertex3 += offset
    }
}

extension Triangle {
    /// Creates a triangle with named vertex parameters
    @inlinable
    public init(vertex1: Vector2, vertex2: Vector2, vertex3: Vector2) {
        self.init(vertex1, vertex2, vertex3)
    }

    /// Creates a triangle with coordinate tuples
    @inlinable 
    public init(
        _ v1: (x: Float, y: Float),
        _ v2: (x: Float, y: Float),
        _ v3: (x: Float, y: Float)
    ) {
        self.init(Vector2(v1.x, v1.y), Vector2(v2.x, v2.y), Vector2(v3.x, v3.y))
    }

    /// Creates a triangle with separate coordinates
    @inlinable
    public init(x1: Float, y1: Float, x2: Float, y2: Float, x3: Float, y3: Float) {
        self.init(Vector2(x1, y1), Vector2(x2, y2), Vector2(x3, y3))
    }
    
    /// Draws a filled triangle
    /// Maps to DrawTriangle() in raylib
    @inlinable
    public func draw(color: Color) {
        CRaylib.DrawTriangle(vertex1, vertex2, vertex3, color)
    }
    
    /// Draws the outline of a triangle
    /// Maps to DrawTriangleLines() in raylib
    @inlinable
    public func drawOutline(color: Color) {
        CRaylib.DrawTriangleLines(vertex1, vertex2, vertex3, color)
    }
    
    /// Checks if this triangle contains a point
    /// Maps to CheckCollisionPointTriangle() in raylib
    @inlinable
    public func contains(point: Vector2) -> Bool {
        return Shapes.isInside(of: self, point: point)
    }
}