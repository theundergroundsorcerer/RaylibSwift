import CRaylib

/// A 2D vector type that represents points or directions with x and y components
public typealias Vector2 = CRaylib.Vector2

extension Vector2 {
    /// Creates a Vector2 with specified float component values
    @inlinable
    public init(_ x: Float, _ y: Float) {
        self.init(x: x, y: y)
    }
}

/// Creates a Vector2 using a function-style constructor with float values
@inlinable
public func Vector(_ x: Float, _ y: Float) -> Vector2 {
    Vector2(x: x, y: y)  // For consistency with Vector3 and Vector4
}


