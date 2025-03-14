/// Polygon structure
import CRaylib

public struct Polygon {
    public var vertices: [Point]

    public init(vertices: [Point]) {
        self.vertices = vertices
    }
}

extension Polygon {
    public init(vertices: Vector2...) {
        self.vertices = vertices
    }
}