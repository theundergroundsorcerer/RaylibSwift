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

extension Vector3 {
    /// Adds two vectors component-wise
    @inlinable
    public static func + (left: Vector3, right: Vector3) -> Vector3 {
        return Vector3(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
    }

    /// Subtracts second vector from first component-wise
    @inlinable
    public static func - (left: Vector3, right: Vector3) -> Vector3 {
        return Vector3(x: left.x - right.x, y: left.y - right.y, z: left.z - right.z)
    }

    /// Multiplies vector by scalar value (scalar first)
    @inlinable
    public static func * (scalar: Float, vector: Vector3) -> Vector3 {
        return Vector3(x: scalar * vector.x, y: scalar * vector.y, z: scalar * vector.z)
    }

    /// Multiplies vector by scalar value (vector first)
    @inlinable
    public static func * (vector: Vector3, scalar: Float) -> Vector3 {
        return Vector3(x: scalar * vector.x, y: scalar * vector.y, z: scalar * vector.z)
    }

    /// Divides vector components by scalar value
    @inlinable
    public static func / (vector: Vector3, scalar: Float) -> Vector3 {
        return Vector3(x: vector.x / scalar, y: vector.y / scalar, z: vector.z / scalar)
    }

    /// Adds right vector to left vector in-place
    @inlinable
    public static func += (left: inout Vector3, right: Vector3) {
        left.x += right.x
        left.y += right.y
        left.z += right.z
    }

    /// Subtracts right vector from left vector in-place
    @inlinable 
    public static func -= (left: inout Vector3, right: Vector3) {
        left.x -= right.x
        left.y -= right.y
        left.z -= right.z
    }

    /// Multiplies vector by scalar in-place
    @inlinable 
    public static func *= (vector: inout Vector3, scalar: Float) {
        vector.x *= scalar
        vector.y *= scalar
        vector.z *= scalar
    }

    /// Divides vector by scalar in-place
    @inlinable
    public static func /= (vector: inout Vector3, scalar: Float) {
        vector.x /= scalar
        vector.y /= scalar
        vector.z /= scalar
    }

    /// Calculates dot product of two vectors
    @inlinable 
    public static func dot(_ left: Vector3, _ right: Vector3) -> Float {
        return left.x * right.x + left.y * right.y + left.z * right.z
    }
}

extension Vector3 {
    /// Calculates dot product with another vector
    @inlinable 
    public func dot(_ vector: Vector3) -> Float {
        return self.x * vector.x + self.y * vector.y + self.z * vector.z
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
    public var normalized: Vector3 {
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
    
    /// Calculates cross product of two vectors (perpendicular vector)
    @inlinable
    public static func cross(_ left: Vector3, _ right: Vector3) -> Vector3 {
        return Vector3(
            x: left.y * right.z - left.z * right.y,
            y: left.z * right.x - left.x * right.z,
            z: left.x * right.y - left.y * right.x
        )
    }
    
    /// Calculates cross product with another vector
    @inlinable
    public func cross(_ vector: Vector3) -> Vector3 {
        return Vector3.cross(self, vector)
    }
}

/// Adds equality comparison for Vector3 instances
extension Vector3: @retroactive Equatable {
    /// Checks if two vectors have the same component values
    @inlinable
    public static func == (lhs: Vector3, rhs: Vector3) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
}

/// Adds hashing support for Vector3 to use in dictionaries and sets
extension Vector3: @retroactive Hashable {
    /// Creates a hash value that reflects the vector's component values
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.x)
        hasher.combine(self.y)
        hasher.combine(self.z)
    }
}
