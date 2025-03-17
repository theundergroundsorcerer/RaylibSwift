import CRaylib

/// A 3D vector type that represents points or directions with x, y and z components
public typealias Vector3 = CRaylib.Vector3

extension Vector3 {
    /// Creates a Vector3 with specified float component values
    @inlinable
    public init(_ x: Float, _ y: Float, _ z: Float) {
        self.init(x: x, y: y, z: z)
    }
}

/// Creates a Vector3 using a function-style constructor with float values
@inlinable
public func Vector(_ x: Float, _ y: Float, _ z: Float) -> Vector3 {
    Vector3(x: x, y: y, z: z)
}
