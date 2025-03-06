import CRaylib

/// A namespace for drawing basic geometric shapes using Raylib.
extension Graphics {
    // MARK: - Pixels
    /// Draws a single pixel at the specified position using geometry.
    /// - Note: This can be slow; use sparingly.
    @inlinable
    public static func drawPixel(at position: (x: Int32, y: Int32), color: Color) {
        CRaylib.DrawPixel(position.x, position.y, color)
    }

    /// Draws a single pixel at the specified position using a vector.
    /// - Note: This can be slow; use sparingly.
    @inlinable
    public static func drawPixel(at position: Vector2, color: Color) {
        CRaylib.DrawPixelV(position, color)
    }

    // MARK: - Lines
    /// Draws a line between two points specified by coordinates.
    @inlinable
    public static func drawLine(
        from startPosition: (x: Int32, y: Int32),
        to endPosition: (x: Int32, y: Int32),
        color: Color
    ) {
        CRaylib.DrawLine(startPosition.x, startPosition.y, endPosition.x, endPosition.y, color)
    }

    /// Draws a line between two points using vectors and OpenGL lines.
    @inlinable
    public static func drawLine(
        from startPosition: Vector2,
        to endPosition: Vector2,
        color: Color
    ) {
        CRaylib.DrawLineV(startPosition, endPosition, color)
    }

    /// Draws a line between two points with a specified thickness using triangles or quads.
    @inlinable
    public static func drawLine(
        from startPosition: Vector2,
        to endPosition: Vector2,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawLineEx(startPosition, endPosition, thickness, color)
    }

    /// Draws a sequence of connected lines using OpenGL lines.
    @inlinable
    public static func drawLineStrip(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawLineStrip(buffer.baseAddress, Int32(points.count), color)
        }
    }

    /// Draws a cubic-bezier line segment with in-out interpolation and specified thickness.
    @inlinable
    public static func drawLineBezier(
        from startPosition: Vector2,
        to endPosition: Vector2,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawLineBezier(startPosition, endPosition, thickness, color)
    }

    // MARK: - Circles and Ellipses
    /// Draws a filled circular sector at the specified center.
    @inlinable
    public static func drawCircleSector(
        at center: Vector2,
        radius: Float,
        startAngle: Float,
        endAngle: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
    }

    /// Draws the outline of a circular sector at the specified center.
    @inlinable
    public static func drawCircleSectorLines(
        at center: Vector2,
        radius: Float,
        startAngle: Float,
        endAngle: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
    }

    /// Draws a gradient-filled circle with inner and outer colors.
    @inlinable
    public static func drawCircleGradient(
        at center: (x: Int32, y: Int32),
        radius: Float,
        innerColor: Color,
        outerColor: Color
    ) {
        CRaylib.DrawCircleGradient(center.x, center.y, radius, innerColor, outerColor)
    }

    /// Draws a filled circle at the specified center using a vector.
    @inlinable
    public static func drawCircle(at center: Vector2, radius: Float, color: Color) {
        CRaylib.DrawCircleV(center, radius, color)
    }

    /// Draws the outline of a circle at the specified center using coordinates.
    @inlinable
    public static func drawCircleLines(at center: (x: Int32, y: Int32), radius: Float, color: Color)
    {
        CRaylib.DrawCircleLines(center.x, center.y, radius, color)
    }

    /// Draws the outline of a circle at the specified center using a vector.
    @inlinable
    public static func drawCircleLines(at center: Vector2, radius: Float, color: Color) {
        CRaylib.DrawCircleLinesV(center, radius, color)
    }

    /// Draws a filled ellipse at the specified center.
    @inlinable
    public static func drawEllipse(
        at center: (x: Int32, y: Int32),
        horizontalRadius: Float,
        verticalRadius: Float,
        color: Color
    ) {
        CRaylib.DrawEllipse(center.x, center.y, horizontalRadius, verticalRadius, color)
    }

    /// Draws the outline of an ellipse at the specified center.
    @inlinable
    public static func drawEllipseLines(
        at center: (x: Int32, y: Int32),
        horizontalRadius: Float,
        verticalRadius: Float,
        color: Color
    ) {
        CRaylib.DrawEllipseLines(center.x, center.y, horizontalRadius, verticalRadius, color)
    }

    /// Draws a filled ring (annulus) at the specified center.
    @inlinable
    public static func drawRing(
        at center: Vector2,
        innerRadius: Float,
        outerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
    }

    /// Draws the outline of a ring (annulus) at the specified center.
    @inlinable
    public static func drawRingLines(
        at center: Vector2,
        innerRadius: Float,
        outerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawRingLines(
            center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
    }

    // MARK: - Rectangles
    /// Draws a filled rectangle at the specified position using coordinates.
    @inlinable
    public static func drawRectangle(
        at position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangle(position.x, position.y, width, height, color)
    }

    /// Draws a filled rectangle at the specified position using vectors.
    @inlinable
    public static func drawRectangle(at position: Vector2, size: Vector2, color: Color) {
        CRaylib.DrawRectangleV(position, size, color)
    }

    /// Draws a filled rectangle defined by a Rectangle struct.
    @inlinable
    public static func drawRectangle(_ rectangle: Rectangle, color: Color) {
        CRaylib.DrawRectangleRec(rectangle, color)
    }

    /// Draws a filled rectangle with rotation and origin offset.
    @inlinable
    public static func drawRectangle(
        _ rectangle: Rectangle,
        origin: Vector2,
        rotation: Float,
        color: Color
    ) {
        CRaylib.DrawRectanglePro(rectangle, origin, rotation, color)
    }

    /// Draws a rectangle with a vertical gradient fill.
    @inlinable
    public static func drawRectangleGradientVertical(
        at position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        topColor: Color,
        bottomColor: Color
    ) {
        CRaylib.DrawRectangleGradientV(position.x, position.y, width, height, topColor, bottomColor)
    }

    /// Draws a rectangle with a horizontal gradient fill.
    @inlinable
    public static func drawRectangleGradientHorizontal(
        at position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        leftColor: Color,
        rightColor: Color
    ) {
        CRaylib.DrawRectangleGradientH(position.x, position.y, width, height, leftColor, rightColor)
    }

    /// Draws a rectangle with a custom gradient fill using vertex colors.
    @inlinable
    public static func drawRectangleGradient(
        _ rectangle: Rectangle,
        topLeftColor: Color,
        bottomLeftColor: Color,
        topRightColor: Color,
        bottomRightColor: Color
    ) {
        CRaylib.DrawRectangleGradientEx(
            rectangle, topLeftColor, bottomLeftColor, topRightColor, bottomRightColor)
    }

    /// Draws the outline of a rectangle using coordinates.
    @inlinable
    public static func drawRectangleLines(
        at position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangleLines(position.x, position.y, width, height, color)
    }

    /// Draws the outline of a rectangle with a specified thickness.
    @inlinable
    public static func drawRectangleLines(
        _ rectangle: Rectangle,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawRectangleLinesEx(rectangle, thickness, color)
    }

    /// Draws a filled rectangle with rounded corners.
    @inlinable
    public static func drawRectangleRounded(
        _ rectangle: Rectangle,
        roundness: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangleRounded(rectangle, roundness, segments, color)
    }

    /// Draws the outline of a rectangle with rounded corners and specified thickness.
    @inlinable
    public static func drawRectangleRoundedLines(
        _ rectangle: Rectangle,
        roundness: Float,
        segments: Int32,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawRectangleRoundedLinesEx(rectangle, roundness, segments, thickness, color)
    }

    // MARK: - Triangles
    /// Draws a filled triangle with vertices in counter-clockwise order.
    @inlinable
    public static func drawTriangle(
        vertex1: Vector2,
        vertex2: Vector2,
        vertex3: Vector2,
        color: Color
    ) {
        CRaylib.DrawTriangle(vertex1, vertex2, vertex3, color)
    }

    /// Draws the outline of a triangle with vertices in counter-clockwise order.
    @inlinable
    public static func drawTriangleLines(
        vertex1: Vector2,
        vertex2: Vector2,
        vertex3: Vector2,
        color: Color
    ) {
        CRaylib.DrawTriangleLines(vertex1, vertex2, vertex3, color)
    }

    /// Draws a filled triangle fan defined by a sequence of points, with the first point as the center.
    @inlinable
    public static func drawTriangleFan(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTriangleFan(buffer.baseAddress, Int32(points.count), color)
        }
    }

    /// Draws a filled triangle strip defined by a sequence of points.
    @inlinable
    public static func drawTriangleStrip(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTriangleStrip(buffer.baseAddress, Int32(points.count), color)
        }
    }

    // MARK: - Polygons
    /// Draws a filled regular polygon with the specified number of sides.
    @inlinable
    public static func drawPolygon(
        center: Vector2,
        numberOfSides: Int32,
        radius: Float,
        rotation: Float,
        color: Color
    ) {
        CRaylib.DrawPoly(center, numberOfSides, radius, rotation, color)
    }

    /// Draws the outline of a regular polygon with the specified number of sides.
    @inlinable
    public static func drawPolygonLines(
        center: Vector2,
        numberOfSides: Int32,
        radius: Float,
        rotation: Float,
        color: Color
    ) {
        CRaylib.DrawPolyLines(center, numberOfSides, radius, rotation, color)
    }

    /// Draws the outline of a regular polygon with the specified thickness.
    @inlinable
    public static func drawPolygonLines(
        center: Vector2,
        numberOfSides: Int32,
        radius: Float,
        rotation: Float,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawPolyLinesEx(center, numberOfSides, radius, rotation, thickness, color)
    }
}
