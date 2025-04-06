import CRaylib
import Foundation

/// A convenience type for describing a regular polygon with equal sides
/// Represents a multi-sided shape with equal-length sides and equal angles
public struct RegularPolygon {
    /// Backing storage for center point
    @usableFromInline
    internal var _center: Vector2

    /// Backing storage for number of sides
    @usableFromInline
    internal var _numberOfSides: Int32

    /// Backing storage for radius
    @usableFromInline
    internal var _radius: Float

    /// Backing storage for rotation
    @usableFromInline
    internal var _rotation: Float

    /// The center point of the polygon
    @inlinable
    public internal(set) var center: Vector2 {
        get { return _center }
        @usableFromInline
        set { _center = newValue }
    }

    /// Creates a regular polygon with specified parameters
    /// All parameters are validated to ensure a valid polygon
    public init(center: Vector2, numberOfSides: Int32, radius: Float, rotation: Float) {
        _center = center
        _numberOfSides = numberOfSides >= 3 ? numberOfSides : 3
        _radius = radius > 0 ? radius : 0
        _rotation = rotation
    }
    
    /// The number of sides of the polygon
    /// Automatically enforces a minimum of 3 sides
    @inlinable
    public internal(set) var numberOfSides: Int32 {
        get { return _numberOfSides }
        @usableFromInline
        set { _numberOfSides = newValue >= 3 ? newValue : 3 }
    }

    /// The radius of the polygon (distance from center to vertices)
    /// Automatically enforces a positive radius
    @inlinable
    public internal(set) var radius: Float {
        get { return _radius }
        @usableFromInline
        set { _radius = newValue > 0 ? newValue : 0 }
    }

    /// The rotation of the polygon in radians
    /// Controls the orientation of the polygon
    @inlinable
    public internal(set) var rotation: Float {
        get { return _rotation }
        @usableFromInline
        set { _rotation = newValue }
    }

    /// Calculates and returns the vertices of the polygon
    /// Creates an array of Vector2 points representing each vertex
    /// - Note: Vertices are calculated on each call. For repeated use within the same frame,
    ///         consider caching the result locally.
    @inlinable
    public func vertices() -> [Vector2] {
        var result = [Vector2]()
        result.reserveCapacity(Int(numberOfSides))
        for i in 0..<numberOfSides {
            let angle = rotation + F(i) * 2.0 * F.pi / F(numberOfSides)
            result.append(
                Vector2(
                    x: center.x + radius * cos(angle),
                    y: center.y + radius * sin(angle)))
        }
        return result
    }

    /// Moves the polygon by the given offset
    /// Translates position while maintaining size and shape
    @inlinable
    public mutating func move(offset: Vector2) {
        self.center += offset
    }

    /// Changes the radius of the polygon
    /// Validation is performed through the radius setter
    @inlinable
    public mutating func resize(radius: Float) {
        /// check for valid range is performed in radius setter
        self.radius = radius 
    }

    /// Changes the number of sides of the polygon
    /// Validation is performed through the numberOfSides setter
    @inlinable
    public mutating func resize(numberOfSides: Int32) {
        self.numberOfSides = numberOfSides
    }
}

extension RegularPolygon {
    /// Draws a filled regular polygon
    /// Maps to DrawPoly() in raylib
    @inlinable
    public func draw(color: Color) {
        Graphics.drawPolygon(
            center: self.center, 
            numberOfSides: self.numberOfSides,
            radius: self.radius,
            rotation: self.rotation,
            color: color)
    }

    /// Draws the outline of a regular polygon
    /// Maps to DrawPolyLines() in raylib
    @inlinable
    public func drawOutline(color: Color) {
        Graphics.drawPolygonLines(
            center: self.center,
            numberOfSides: self.numberOfSides,
            radius: self.radius,
            rotation: self.rotation,
            color: color
        )
    }

    /// Draws the outline of a regular polygon with specified thickness
    /// Maps to DrawPolyLinesEx() in raylib
    @inlinable
    public func drawOutline(thickness: Float, color: Color) {
        Graphics.drawPolygonLines(
            center: self.center,
            numberOfSides: self.numberOfSides,
            radius: self.radius,
            rotation: self.rotation,
            thickness: thickness,
            color: color
        )
    }

    /// Checks if a point is inside the polygon
    /// Maps to CheckCollisionPointPoly() in raylib
    @inlinable
    public func contains(_ point: Vector2) -> Bool {
        return self.vertices().withUnsafeBufferPointer { verticesPtr in 
            CRaylib.CheckCollisionPointPoly(point, verticesPtr.baseAddress, self.numberOfSides)
        }
    }
}

