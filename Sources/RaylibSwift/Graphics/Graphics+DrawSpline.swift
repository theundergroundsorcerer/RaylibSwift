import CRaylib

/// Splines drawing functions
extension Graphics {
    /// Draw spline: Linear, minimum 2 points
    /// Maps to DrawSplineLinear
    @inlinable
    public static func drawSplineLinear(points: [Vector2], thickness: Float, color: Color) {
        CRaylib.DrawSplineLinear(points, I(points.count), thickness, color)
    }

    /// Draw spline: B-Spline, minimum 4 points
    /// Maps to DrawSplineBasis
    @inlinable
    public static func drawSplineBasis(points: [Vector2], thickness: Float, color: Color) {
        CRaylib.DrawSplineBasis(points, I(points.count), thickness, color)
    }

    /// Draw spline: Catmull-Rom, minimum 4 points
    /// Maps to DrawSplineCatmullRom
    @inlinable
    public static func drawSplineCatmullRom(points: [Vector2], thickness: Float, color: Color) {
        CRaylib.DrawSplineCatmullRom(points, I(points.count), thickness, color)
    }

    /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
    /// Maps to DrawSplineBezierQuadratic
    @inlinable
    public static func drawSplineBezierQuadratic(
        points: [Vector2],
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawSplineBezierQuadratic(points, I(points.count), thickness, color)
    }

    /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
    /// Maps to DrawSplineBezierCubic
    @inlinable
    public static func drawSplineBezierCubic(points: [Vector2], thickness: Float, color: Color) {
        CRaylib.DrawSplineBezierCubic(points, I(points.count), thickness, color)
    }

    /// Draw spline segment: Linear, 2 points
    /// Maps to DrawSplineSegmentLinear
    @inlinable
    public static func drawSplineSegmentLinear(
        points: (Vector2, Vector2),
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawSplineSegmentLinear(points.0, points.1, thickness, color)
    }

    /// Draw spline segment: B-Spline, 4 points
    /// Maps to DrawSplineSegmentBasis
    @inlinable
    public static func drawSplineSegmentBasis(
        points: (Vector2, Vector2, Vector2, Vector2),
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawSplineSegmentBasis(points.0, points.1, points.2, points.3, thickness, color)
    }

    /// Draw spline segment: Catmull-Rom, 4 points
    /// Maps to DrawSplineSegmentCatmullRom
    @inlinable
    public static func drawSplineSegmentCatmullRom(
        points: (Vector2, Vector2, Vector2, Vector2),
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawSplineSegmentCatmullRom(
            points.0, points.1, points.2, points.3, thickness, color)
    }

    /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
    /// Maps to DrawSplineSegmentBezierQuadratic
    @inlinable
    public static func drawSplineSegmentBezierQuadratic(
        points: (Vector2, Vector2),
        controlPoint: Vector2,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawSplineSegmentBezierQuadratic(points.0, controlPoint, points.1, thickness, color)
    }

    /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
    /// Maps to DrawSplineSegmentBezierCubic
    @inlinable
    public static func drawSplineSegmentBezierCubic(
        points: (Vector2, Vector2),
        controlPoints: (Vector2, Vector2),
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawSplineSegmentBezierCubic(
            points.0, controlPoints.0, controlPoints.1, points.1, thickness, color)
    }

}
