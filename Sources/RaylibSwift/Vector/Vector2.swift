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

extension Vector2 {
    /// Adds two vectors component-wise
    @inlinable
    public static func + (left: Vector2, right: Vector2) -> Vector2 {
        return Vector2(x: left.x + right.x, y: left.y + right.y)
    }

    /// Subtracts second vector from first component-wise
    @inlinable
    public static func - (left: Vector2, right: Vector2) -> Vector2 {
        return Vector2(x: left.x - right.x, y: left.y - right.y)
    }

    /// Multiplies vector by scalar value (scalar first)
    @inlinable
    public static func * (scalar: Float, vector: Vector2) -> Vector2 {
        return Vector2(x: scalar * vector.x, y: scalar * vector.y)
    }

    /// Multiplies vector by scalar value (vector first)
    @inlinable
    public static func * (vector: Vector2, scalar: Float) -> Vector2 {
        return Vector2(x: scalar * vector.x, y: scalar * vector.y)
    }

    /// Divides vector components by scalar value
    @inlinable
    public static func / (vector: Vector2, scalar: Float) -> Vector2 {
        return Vector2(x: vector.x / scalar, y: vector.y / scalar)
    }

    /// Adds right vector to left vector in-place
    @inlinable
    public static func += (left: inout Vector2, right: Vector2) {
        left.x += right.x
        left.y += right.y
    }

    /// Subtracts right vector from left vector in-place
    @inlinable 
    public static func -= (left: inout Vector2, right: Vector2) {
        left.x -= right.x
        left.y -= right.y
    }

    /// Multiplies vector by scalar in-place
    @inlinable 
    public static func *= (vector: inout Vector2, scalar: Float) {
        vector.x *= scalar
        vector.y *= scalar
    }

    /// Divides vector by scalar in-place
    @inlinable
    public static func /= (vector: inout Vector2, scalar: Float) {
        vector.x /= scalar
        vector.y /= scalar
    }

    /// Calculates dot product of two vectors
    @inlinable 
    public static func dot(_ left: Vector2, _ right: Vector2) -> Float {
        return left.x * right.x + left.y * right.y
    }
}

extension Vector2 {
    /// Calculates dot product with another vector
    @inlinable 
    public func dot(_ vector: Vector2) -> Float {
        return self.x * vector.x + self.y * vector.y
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
    public var normalized: Vector2 {
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
