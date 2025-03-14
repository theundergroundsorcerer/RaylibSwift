/// Polygon structure
import CRaylib

public struct Polygon {
    public var vertices: [Vector2]

    public init(vertices: [Vector2]) {
        self.vertices = vertices
    }
}

extension Polygon {
    public init(vertices: Vector2...) {
        self.vertices = vertices
    }
}