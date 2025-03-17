/// Polygon structure for representing a multi-sided shape with arbitrary vertices
import CRaylib

public struct Polygon {
    /// Backing storage for vertices
    @usableFromInline
    internal var _vertices: [Vector2]

    /// The vertices that define the polygon
    /// Direct access to vertex array with internal-only mutation
    @inlinable
    public internal(set) var vertices: [Vector2] {
        get { _vertices }
        @usableFromInline
        set { _vertices = newValue }
    }

    /// Creates a polygon with specified vertices array
    public init(vertices: [Vector2]) {
        self._vertices = vertices
    }
    
    /// Moves the polygon by the given offset
    /// Translates all vertices by the specified amount
    @inlinable
    public mutating func move(offset: Vector2) {
        for i in 0..<_vertices.count {
            _vertices[i] += offset
        }
    }
}

extension Polygon {
    /// Creates a polygon with a variadic list of vertices
    public init(vertices: Vector2...) {
        self._vertices = vertices
    }
    
    /// Draws a filled polygon using triangle fan technique
    /// Maps to DrawTriangleFan() in raylib
    @inlinable
    public func draw(color: Color) {
        if vertices.count == 0 {
            return
        }
        
        vertices.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTriangleFan(buffer.baseAddress, Int32(vertices.count), color)
        }
    }
    
    /// Draws the outline of a polygon
    /// Maps to DrawLineStrip() in raylib with manual closing
    @inlinable
    public func drawOutline(color: Color) {
        if vertices.count == 0 {
            return
        }
        
        if vertices.count == 1 {
            // For a single vertex, just draw a point
            CRaylib.DrawPixelV(vertices[0], color)
            return
        }
        
        // Draw the line strip for all vertices
        vertices.withUnsafeBufferPointer { buffer in
            CRaylib.DrawLineStrip(buffer.baseAddress, Int32(vertices.count), color)
        }
        
        // Close the polygon by drawing the final line if there are at least 3 vertices
        // and the first and last vertices aren't the same
        if vertices.count >= 3 && vertices.first != vertices.last {
            CRaylib.DrawLineV(vertices.last!, vertices.first!, color)
        }
    }
    
    /// Draws a polygon as a triangle strip
    /// Maps to DrawTriangleStrip() in raylib
    @inlinable
    public func drawAsTriangleStrip(color: Color) {
        if vertices.count == 0 {
            return
        }
        
        vertices.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTriangleStrip(buffer.baseAddress, Int32(vertices.count), color)
        }
    }

    /// Checks if this polygon contains a point
    /// Maps to CheckCollisionPointPoly() in raylib
    @inlinable
    public func contains(_ point: Vector2) -> Bool {
        return Shapes.isInside(of: self, point: point)
    }
}