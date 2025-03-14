import CRaylib

/// A 4D vector type that represents points or directions with x, y, z and w components
public typealias Vector4 = CRaylib.Vector4

/// Quaternion, 4 components (Vector4 alias)
public typealias Quaternion = Vector4

extension Vector4 {
    /// Creates a Vector4 with the specified component values
    @inlinable
    public init(_ x: Float, _ y: Float, _ z: Float, _ w: Float) {
        self.init(x: x, y: y, z: z, w: w)
    }
}

/// Creates a Vector4 using a function-style constructor
@inlinable public func Vector(_ x: Float, _ y: Float, _ z: Float, w: Float) -> Vector4 {
    Vector4(x: x, y: y, z: z, w: w)
}