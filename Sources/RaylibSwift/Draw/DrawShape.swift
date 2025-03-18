import CRaylib

/// A namespace for drawing basic geometric shapes using Raylib.
extension Draw {
    // MARK: - Pixels
    /// Draws a single pixel at the specified position using geometry.
    /// - Note: This can be slow; use sparingly.
    @inlinable
    public static func pixel(at position: (x: Int32, y: Int32), color: Color) {
        CRaylib.DrawPixel(position.x, position.y, color)
    }

    /// Draws a single pixel at the specified position using a vector.
    /// - Note: This can be slow; use sparingly.
    @inlinable
    public static func pixel(at position: Vector2, color: Color) {
        CRaylib.DrawPixelV(position, color)
    }

    // MARK: - Lines
    /// Draws a line between two points specified by coordinates.
    @inlinable
    public static func line(
        from startPosition: (x: Int32, y: Int32),
        to endPosition: (x: Int32, y: Int32),
        color: Color
    ) {
        CRaylib.DrawLine(startPosition.x, startPosition.y, endPosition.x, endPosition.y, color)
    }

    /// Draws a line between two points using vectors and OpenGL lines.
    @inlinable
    public static func line(
        from startPosition: Vector2,
        to endPosition: Vector2,
        color: Color
    ) {
        CRaylib.DrawLineV(startPosition, endPosition, color)
    }

    /// Draws a line between two points with a specified thickness using triangles or quads.
    @inlinable
    public static func line(
        from startPosition: Vector2,
        to endPosition: Vector2,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawLineEx(startPosition, endPosition, thickness, color)
    }

    /// Draws a sequence of connected lines using OpenGL lines.
    @inlinable
    public static func lineStrip(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawLineStrip(buffer.baseAddress, Int32(points.count), color)
        }
    }

    /// Draws a cubic-bezier line segment with in-out interpolation and specified thickness.
    @inlinable
    public static func lineBezier(
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
    public static func circleSector(
        at center: Vector2,
        radius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segments: Int32? = nil
    ) {
        // Zero or near-zero angle check
        if abs(endAngle - startAngle) < Float.ulpOfOne {
            return  // Nothing to draw for zero angle
        }
        
        let calculatedSegments = segments ?? defaultSegmentCount(
            startAngle: startAngle, 
            endAngle: endAngle
        )
        
        CRaylib.DrawCircleSector(center, radius, startAngle, endAngle, calculatedSegments, color)
    }

    /// Draws the outline of a circular sector at the specified center.
    @inlinable
    public static func circleSectorLines(
        at center: Vector2,
        radius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segments: Int32? = nil
    ) {
        // Zero or near-zero angle check
        if abs(endAngle - startAngle) < Float.ulpOfOne {
            return  // Nothing to draw for zero angle
        }
        
        let calculatedSegments = segments ?? defaultSegmentCount(
            startAngle: startAngle, 
            endAngle: endAngle
        )
        
        CRaylib.DrawCircleSectorLines(center, radius, startAngle, endAngle, calculatedSegments, color)
    }

    /// Draws a gradient-filled circle with inner and outer colors.
    @inlinable
    public static func circleGradient(
        at center: (x: Int32, y: Int32),
        radius: Float,
        innerColor: Color,
        outerColor: Color
    ) {
        CRaylib.DrawCircleGradient(center.x, center.y, radius, innerColor, outerColor)
    }

    /// Draws a filled circle at the specified center using a vector.
    @inlinable
    public static func circle(at center: Vector2, radius: Float, color: Color) {
        CRaylib.DrawCircleV(center, radius, color)
    }

    /// Draws a filled circle at the specified center using coordinates
    @inlinable
    public static func circle(at center: (x: Int32, y: Int32), radius: Float, color: Color) {
        CRaylib.DrawCircle(center.x, center.y, radius, color)
    }

    /// Draws a circle of specified color 
    @inlinable 
    public static func circle(_ circle: Circle, color: Color) {
        CRaylib.DrawCircleV(circle.center, circle.radius, color)
    }
    

    /// Draws the outline of a circle at the specified center using coordinates.
    @inlinable
    public static func circleLines(at center: (x: Int32, y: Int32), radius: Float, color: Color)
    {
        CRaylib.DrawCircleLines(center.x, center.y, radius, color)
    }

    /// Draws the outline of a circle at the specified center using a vector.
    @inlinable
    public static func circleLines(at center: Vector2, radius: Float, color: Color) {
        CRaylib.DrawCircleLinesV(center, radius, color)
    }

    /// Draws a filled ellipse at the specified center.
    @inlinable
    public static func ellipse(
        at center: (x: Int32, y: Int32),
        horizontalRadius: Float,
        verticalRadius: Float,
        color: Color
    ) {
        CRaylib.DrawEllipse(center.x, center.y, horizontalRadius, verticalRadius, color)
    }

    /// Draws the outline of an ellipse at the specified center.
    @inlinable
    public static func ellipseLines(
        at center: (x: Int32, y: Int32),
        horizontalRadius: Float,
        verticalRadius: Float,
        color: Color
    ) {
        CRaylib.DrawEllipseLines(center.x, center.y, horizontalRadius, verticalRadius, color)
    }

    /// Draws a filled ring (annulus) at the specified center.
    @inlinable
    public static func ring(
        at center: Vector2,
        innerRadius: Float,
        outerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segments: Int32? = nil
    ) {
        // Zero or near-zero angle check
        if abs(endAngle - startAngle) < Float.ulpOfOne {
            return  // Nothing to draw for zero angle
        }
        
        let calculatedSegments = segments ?? defaultSegmentCount(
            startAngle: startAngle, 
            endAngle: endAngle
        )
        
        CRaylib.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, calculatedSegments, color)
    }

    /// Draws the outline of a ring (annulus) at the specified center.
    @inlinable
    public static func ringLines(
        at center: Vector2,
        innerRadius: Float,
        outerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segments: Int32? = nil
    ) {
        // Zero or near-zero angle check
        if abs(endAngle - startAngle) < Float.ulpOfOne {
            return  // Nothing to draw for zero angle
        }
        
        let calculatedSegments = segments ?? defaultSegmentCount(
            startAngle: startAngle, 
            endAngle: endAngle
        )
        
        CRaylib.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, calculatedSegments, color)
    }

    // MARK: - Rectangles
    /// Draws a filled rectangle at the specified position using coordinates.
    @inlinable
    public static func rectangle(
        at position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangle(position.x, position.y, width, height, color)
    }

    /// Draws a filled rectangle at the specified position using vectors.
    @inlinable
    public static func rectangle(at position: Vector2, size: Vector2, color: Color) {
        CRaylib.DrawRectangleV(position, size, color)
    }

    /// Draws a filled rectangle defined by a Rectangle struct.
    @inlinable
    public static func rectangle(_ rectangle: Rectangle, color: Color) {
        CRaylib.DrawRectangleRec(rectangle, color)
    }

    /// Draws a filled rectangle with rotation and origin offset.
    @inlinable
    public static func rectangle(
        _ rectangle: Rectangle,
        origin: Vector2,
        rotation: Float,
        color: Color
    ) {
        CRaylib.DrawRectanglePro(rectangle, origin, rotation, color)
    }

    /// Draws a rectangle with a vertical gradient fill.
    @inlinable
    public static func rectangleGradientVertical(
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
    public static func rectangleGradientHorizontal(
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
    public static func rectangleGradient(
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
    public static func rectangleLines(
        at position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangleLines(position.x, position.y, width, height, color)
    }

    /// Draws the outline of a rectangle with a specified thickness.
    @inlinable
    public static func rectangleLines(
        _ rectangle: Rectangle,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawRectangleLinesEx(rectangle, thickness, color)
    }

    /// Draws a filled rectangle with rounded corners.
    @inlinable
    public static func rectangleRounded(
        _ rectangle: Rectangle,
        roundness: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangleRounded(rectangle, roundness, segments, color)
    }

    /// Draw rectangle lines with rounded edges
    @inlinable
    public static func rectangleRoundedLines(
        _ rectangle: Rectangle,
        roundness: Float,
        segments: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangleRoundedLines(rectangle, roundness, segments, color)
    }

    /// Draws the outline of a rectangle with rounded corners and specified thickness.
    @inlinable
    public static func rectangleRoundedLines(
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
    public static func triangle(
        vertex1: Vector2,
        vertex2: Vector2,
        vertex3: Vector2,
        color: Color
    ) {
        CRaylib.DrawTriangle(vertex1, vertex2, vertex3, color)
    }

    /// Draws the outline of a triangle with vertices in counter-clockwise order.
    @inlinable
    public static func triangleLines(
        vertex1: Vector2,
        vertex2: Vector2,
        vertex3: Vector2,
        color: Color
    ) {
        CRaylib.DrawTriangleLines(vertex1, vertex2, vertex3, color)
    }

    /// Draws a filled triangle fan defined by a sequence of points, with the first point as the center.
    @inlinable
    public static func triangleFan(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTriangleFan(buffer.baseAddress, Int32(points.count), color)
        }
    }

    /// Draws a filled triangle strip defined by a sequence of points.
    @inlinable
    public static func triangleStrip(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTriangleStrip(buffer.baseAddress, Int32(points.count), color)
        }
    }

    // MARK: - Polygons
    /// Draws a filled regular polygon with the specified number of sides.
    @inlinable
    public static func polygon(
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
    public static func polygonLines(
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
    public static func polygonLines(
        center: Vector2,
        numberOfSides: Int32,
        radius: Float,
        rotation: Float,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawPolyLinesEx(center, numberOfSides, radius, rotation, thickness, color)
    }

    /// Calculates optimal number of segments for drawing curved shapes
    /// Custom Swift implementation that balances visual quality with performance
    /// Uses curve length and scale to determine appropriate segment count
    @inlinable
    public static func optimalSegmentCount(
        radius: Float,
        arcAngle: Float,
        segmentPixelLength: Float = 4.0,
        scale: Float = 1.0,
        minimum: Int32 = 1,
        maximum: Int32 = 100
    ) -> Int32 {
        // Zero or near-zero angle special case
        if abs(arcAngle) < Float.ulpOfOne {
            return 0  // Return 0 segments for zero angle (nothing to draw)
        }
        
        // For very small arcs, we need fewer segments
        let correctedScale = scale >= 0.1 && scale <= 10 ? scale : 1
        let correctedSegmentLength = 
            segmentPixelLength >= 1 && segmentPixelLength <= 20 ? segmentPixelLength : 4

        // Calculate arc length 
        let arcLength = abs(arcAngle) * Float.pi / 180.0 * radius * correctedScale
        
        // Calculate segments based on pixel length
        let rawSegmentCount = Int32((arcLength / correctedSegmentLength).rounded(.up))
        return max(minimum, min(rawSegmentCount, maximum))
    }
    
    /// Calculates optimal segment count for a specific arc range
    /// Variation that takes start and end angles instead of arc angle
    @inlinable
    public static func optimalSegmentCount(
        radius: Float,
        startAngle: Float,
        endAngle: Float,
        segmentPixelLength: Float = 4.0,
        scale: Float = 1.0,
        minimum: Int32 = 1,
        maximum: Int32 = 100
    ) -> Int32 {
        let arcAngle = abs(endAngle - startAngle)
        return optimalSegmentCount(
            radius: radius,
            arcAngle: arcAngle,
            segmentPixelLength: segmentPixelLength,
            scale: scale,
            minimum: minimum,
            maximum: maximum
        )
    }
    
    /// Calculates default number of segments for drawing curved shapes
    /// Uses raylib's convention of 36 segments for a full circle
    /// Scales proportionally based on the angle of the arc
    @usableFromInline
    internal static func defaultSegmentCount(
        arcAngle: Float,
        segmentsPerFullCircle: Int32 = 36
    ) -> Int32 {
        // Zero or near-zero angle special case
        if abs(arcAngle) < Float.ulpOfOne {
            return 0  // Return 0 segments for zero angle (nothing to draw)
        }
        
        // Calculate segments proportionally to angle
        // Full circle (360°) gets segmentsPerFullCircle segments
        let segmentCount = 
        Int32((abs(arcAngle) / 360.0 * Float(segmentsPerFullCircle)).rounded(.up))
        
        // Ensure at least 1 segment
        return max(1, segmentCount)
    }
    
    /// Calculates default segment count for a specific arc range
    /// Variation that takes start and end angles instead of arc angle
    @usableFromInline
    internal static func defaultSegmentCount(
        startAngle: Float,
        endAngle: Float,
        segmentsPerFullCircle: Int32 = 36
    ) -> Int32 {
        let arcAngle = abs(endAngle - startAngle)
        return defaultSegmentCount(
            arcAngle: arcAngle,
            segmentsPerFullCircle: segmentsPerFullCircle
        )
    }

    // MARK: - Optimized Segment Drawing Methods

    /// Draws a filled circular sector with optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public static func circleSector(
        at center: Vector2,
        radius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        let segments = optimalSegmentCount(
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )
        
        if segments > 0 {
            CRaylib.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
        }
    }

    /// Draws the outline of a circular sector with optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public static func circleSectorLines(
        at center: Vector2,
        radius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        let segments = optimalSegmentCount(
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )
        
        if segments > 0 {
            CRaylib.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
        }
    }

    /// Draws a filled ring (annulus) with optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public static func ring(
        at center: Vector2,
        innerRadius: Float,
        outerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        // Use the larger radius for segment calculation
        let maxRadius = max(innerRadius, outerRadius)
        let segments = optimalSegmentCount(
            radius: maxRadius,
            startAngle: startAngle,
            endAngle: endAngle,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )
        
        if segments > 0 {
            CRaylib.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
        }
    }

    /// Draws the outline of a ring (annulus) with optimized segment count
    /// Uses precise pixel-based calculation for segment count
    @inlinable
    public static func ringLines(
        at center: Vector2,
        innerRadius: Float,
        outerRadius: Float,
        startAngle: Float,
        endAngle: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        // Use the larger radius for segment calculation
        let maxRadius = max(innerRadius, outerRadius)
        let segments = optimalSegmentCount(
            radius: maxRadius,
            startAngle: startAngle,
            endAngle: endAngle,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )
        
        if segments > 0 {
            CRaylib.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
        }
    }
}
