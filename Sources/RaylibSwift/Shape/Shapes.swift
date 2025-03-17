/// Enum containing collision detection functions
import CRaylib

public enum Shapes {
    /// Check collision between two rectangles
    @inlinable
    public static func areColliding(
        _ rectangle1: Rectangle,
        and rectangle2: Rectangle
    ) -> Bool {
        CRaylib.CheckCollisionRecs(rectangle1, rectangle2)
    }

    /// Check collision between two circles
    @inlinable
    public static func areColliding(
        _ circle1: Circle,
        and circle2: Circle
    ) -> Bool {
        CRaylib.CheckCollisionCircles(
            circle1.center,
            circle1.radius,
            circle2.center,
            circle2.radius
        )
    }

    /// Check collision between circle and rectangle
    @inlinable
    public static func areColliding(
        _ circle: Circle,
        and rectangle: Rectangle
    ) -> Bool {
        CRaylib.CheckCollisionCircleRec(circle.center, circle.radius, rectangle)
    }
    
    /// Check collision between rectangle and circle (symmetric version)
    @inlinable
    public static func areColliding(
        _ rectangle: Rectangle,
        and circle: Circle
    ) -> Bool {
        CRaylib.CheckCollisionCircleRec(circle.center, circle.radius, rectangle)
    }

    /// Check if circle collides with a line
    @inlinable
    public static func areColliding(
        _ circle: Circle,
        and line: LineSegment
    ) -> Bool {
        CRaylib.CheckCollisionCircleLine(circle.center, circle.radius, line.start, line.end)
    }
    
    /// Check if line collides with a circle (symmetric version)
    @inlinable
    public static func areColliding(
        _ line: LineSegment,
        and circle: Circle
    ) -> Bool {
        CRaylib.CheckCollisionCircleLine(circle.center, circle.radius, line.start, line.end)
    }

    /// Check if point is inside rectangle
    @inlinable
    public static func isInside(
        of rectangle: Rectangle,
        point: Vector2
    ) -> Bool {
        CRaylib.CheckCollisionPointRec(point, rectangle)
    }

    /// Check if point is inside circle
    @inlinable
    public static func isInside(
        of circle: Circle,
        point: Vector2
    ) -> Bool {
        CRaylib.CheckCollisionPointCircle(point, circle.center, circle.radius)
    }

    /// Check if point is inside a triangle
    @inlinable
    public static func isInside(
        of triangle: Triangle,
        point: Vector2
    ) -> Bool {
        CRaylib.CheckCollisionPointTriangle(
            point,
            triangle.vertex1,
            triangle.vertex2,
            triangle.vertex3
        )
    }

    /// Check if point belongs to line with defined margin in pixels
    @inlinable
    public static func isInside(
        of line: LineSegment,
        point: Vector2,
        threshold: Int32
    ) -> Bool {
        CRaylib.CheckCollisionPointLine(point, line.start, line.end, threshold)
    }

    /// Check if point is within a polygon
    @inlinable
    public static func isInside(
        of polygon: Polygon,
        point: Vector2
    ) -> Bool {
        polygon.vertices.withUnsafeBufferPointer { pointsPtr in
            CRaylib.CheckCollisionPointPoly(point, pointsPtr.baseAddress, Int32(pointsPtr.count))
        }
    }

    /// Check intersection between two lines, returns intersection point
    @inlinable
    public static func intersection(
        of line1: LineSegment, 
        and line2: LineSegment
    ) -> Vector2? {
        var intersectionPoint = Vector2(0, 0)
        guard
            CRaylib.CheckCollisionLines(
                line1.start, line1.end, line2.start, line2.end, &intersectionPoint)
        else {
            return nil
        }
        return intersectionPoint
    }

    /// Get collision rectangle for two rectangles collision
    @inlinable 
    public static func collisionRectangle(
        of rectangle1: Rectangle,
        and rectangle2: Rectangle
    ) -> Rectangle {
        CRaylib.GetCollisionRec(rectangle1, rectangle2)
    }

    
}
