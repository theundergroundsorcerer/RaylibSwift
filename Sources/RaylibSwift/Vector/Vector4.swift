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

extension Vector4 {
    /// Adds two vectors component-wise
    @inlinable
    public static func + (left: Vector4, right: Vector4) -> Vector4 {
        return Vector4(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z, w: left.w + right.w)
    }

    /// Subtracts second vector from first component-wise
    @inlinable
    public static func - (left: Vector4, right: Vector4) -> Vector4 {
        return Vector4(x: left.x - right.x, y: left.y - right.y, z: left.z - right.z, w: left.w - right.w)
    }

    /// Multiplies vector by scalar value (scalar first)
    @inlinable
    public static func * (scalar: Float, vector: Vector4) -> Vector4 {
        return Vector4(x: scalar * vector.x, y: scalar * vector.y, z: scalar * vector.z, w: scalar * vector.w)
    }

    /// Multiplies vector by scalar value (vector first)
    @inlinable
    public static func * (vector: Vector4, scalar: Float) -> Vector4 {
        return Vector4(x: scalar * vector.x, y: scalar * vector.y, z: scalar * vector.z, w: scalar * vector.w)
    }

    /// Divides vector components by scalar value
    @inlinable
    public static func / (vector: Vector4, scalar: Float) -> Vector4 {
        return Vector4(x: vector.x / scalar, y: vector.y / scalar, z: vector.z / scalar, w: vector.w / scalar)
    }

    /// Adds right vector to left vector in-place
    @inlinable
    public static func += (left: inout Vector4, right: Vector4) {
        left.x += right.x
        left.y += right.y
        left.z += right.z
        left.w += right.w
    }

    /// Subtracts right vector from left vector in-place
    @inlinable 
    public static func -= (left: inout Vector4, right: Vector4) {
        left.x -= right.x
        left.y -= right.y
        left.z -= right.z
        left.w -= right.w
    }

    /// Multiplies vector by scalar in-place
    @inlinable 
    public static func *= (vector: inout Vector4, scalar: Float) {
        vector.x *= scalar
        vector.y *= scalar
        vector.z *= scalar
        vector.w *= scalar
    }

    /// Divides vector by scalar in-place
    @inlinable
    public static func /= (vector: inout Vector4, scalar: Float) {
        vector.x /= scalar
        vector.y /= scalar
        vector.z /= scalar
        vector.w /= scalar
    }

    /// Calculates dot product of two vectors
    @inlinable 
    public static func dot(_ left: Vector4, _ right: Vector4) -> Float {
        return left.x * right.x + left.y * right.y + left.z * right.z + left.w * right.w
    }
}

extension Vector4 {
    /// Calculates dot product with another vector
    @inlinable 
    public func dot(_ vector: Vector4) -> Float {
        return self.x * vector.x + self.y * vector.y + self.z * vector.z + self.w * vector.w
    }

    /// Returns squared length of vector (faster than magnitude)
    @inlinable 
    public var magnitudeSquared: Float {
        return self.dot(self)
    }

    /// Returns length of vector
    @inlinable
    public var magnitude: Float {
        return self.magnitudeSquared.squareRoot()
    }

    /// Returns normalized copy of vector (unit length)
    @inlinable 
    public var normalized: Vector4 {
        if self.magnitude < Float.ulpOfOne {
            return self
        }
        return self / magnitude
    }

    /// Normalizes this vector in-place to unit length
    @inlinable 
    public mutating func normalize() {
        if self.magnitude < Float.ulpOfOne {
            return
        }
        else {
            self /= self.magnitude
        }
    }
}