import CRaylib

/// A namespace for drawing basic geometric shapes using Raylib.
extension Graphics {
    // MARK: - Pixels
    
    /// Draws a single pixel at the specified position using geometry.
    /// - Note: This can be slow; use sparingly.
    /// - Maps to: DrawPixel
    @inlinable
    public static func drawPixel(at position: (x: Int32, y: Int32), color: Color) {
        CRaylib.DrawPixel(position.x, position.y, color)
    }

    /// Draws a single pixel at the specified position using a vector.
    /// - Note: This can be slow; use sparingly.
    /// - Maps to: DrawPixelV
    @inlinable
    public static func drawPixel(at position: Vector2, color: Color) {
        CRaylib.DrawPixelV(position, color)
    }

    // MARK: - Lines

    /// Draws a line between two points specified by coordinates.
    /// - Maps to: DrawLine
    @inlinable
    public static func drawLine(
        from startPosition: (x: Int32, y: Int32),
        to endPosition: (x: Int32, y: Int32),
        color: Color
    ) {
        CRaylib.DrawLine(startPosition.x, startPosition.y, endPosition.x, endPosition.y, color)
    }

    /// Draws a line between two points using vectors and OpenGL lines.
    /// - Maps to: DrawLineV
    @inlinable
    public static func drawLine(
        from startPosition: Vector2,
        to endPosition: Vector2,
        color: Color
    ) {
        CRaylib.DrawLineV(startPosition, endPosition, color)
    }

    /// Draws a line between two points with a specified thickness using triangles or quads.
    /// - Maps to: DrawLineEx
    @inlinable
    public static func drawLine(
        from startPosition: Vector2,
        to endPosition: Vector2,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawLineEx(startPosition, endPosition, thickness, color)
    }
    
    /// Draws a cubic-bezier line segment with in-out interpolation and specified thickness.
    /// - Maps to: DrawLineBezier
    @inlinable
    public static func drawLineBezier(
        from startPosition: Vector2,
        to endPosition: Vector2,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawLineBezier(startPosition, endPosition, thickness, color)
    }

    /// Draws a sequence of connected lines using OpenGL lines.
    /// - Maps to: DrawLineStrip
    @inlinable
    public static func drawLineStrip(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawLineStrip(buffer.baseAddress, Int32(points.count), color)
        }
    }

    // MARK: - Circles and Ellipses

    /// Draws a filled circle at the specified center using coordinates.
    /// - Maps to: DrawCircle
    @inlinable
    public static func drawCircle(at center: (x: Int32, y: Int32), radius: Float, color: Color) {
        CRaylib.DrawCircle(center.x, center.y, radius, color)
    }

    /// Draws a filled circle at the specified center using a vector.
    /// - Maps to: DrawCircleV
    @inlinable
    public static func drawCircle(at center: Vector2, radius: Float, color: Color) {
        CRaylib.DrawCircleV(center, radius, color)
    }

    /// Draws a circle of specified color.
    /// - Maps to: DrawCircleV
    @inlinable
    public static func drawCircle(_ circle: Circle, color: Color) {
        CRaylib.DrawCircleV(circle.center, circle.radius, color)
    }

    /// Draws the outline of a circle at the specified center using coordinates.
    /// - Maps to: DrawCircleLines
    @inlinable
    public static func drawCircleLines(at center: (x: Int32, y: Int32), radius: Float, color: Color) {
        CRaylib.DrawCircleLines(center.x, center.y, radius, color)
    }

    /// Draws the outline of a circle at the specified center using a vector.
    /// - Maps to: DrawCircleLinesV
    @inlinable
    public static func drawCircleLines(at center: Vector2, radius: Float, color: Color) {
        CRaylib.DrawCircleLinesV(center, radius, color)
    }

    /// Draws a gradient-filled circle with inner and outer colors.
    /// - Maps to: DrawCircleGradient
    @inlinable
    public static func drawCircleGradient(
        at center: (x: Int32, y: Int32),
        radius: Float,
        innerColor: Color,
        outerColor: Color
    ) {
        CRaylib.DrawCircleGradient(center.x, center.y, radius, innerColor, outerColor)
    }

    /// Draws a filled circular sector at the specified center.
    /// - Maps to: DrawCircleSector
    @inlinable
    public static func drawCircleSector(
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

        let calculatedSegments =
            segments
            ?? defaultSegmentCount(
                startAngle: startAngle,
                endAngle: endAngle
            )

        CRaylib.DrawCircleSector(center, radius, startAngle, endAngle, calculatedSegments, color)
    }
    
    /// Draws a filled circular sector with optimized segment count.
    /// Uses precise pixel-based calculation for segment count.
    /// - Maps to: DrawCircleSector
    @inlinable
    public static func drawCircleSector(
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

    /// Draws the outline of a circular sector at the specified center.
    /// - Maps to: DrawCircleSectorLines
    @inlinable
    public static func drawCircleSectorLines(
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

        let calculatedSegments =
            segments
            ?? defaultSegmentCount(
                startAngle: startAngle,
                endAngle: endAngle
            )

        CRaylib.DrawCircleSectorLines(
            center, radius, startAngle, endAngle, calculatedSegments, color)
    }
    
    /// Draws the outline of a circular sector with optimized segment count.
    /// Uses precise pixel-based calculation for segment count.
    /// - Maps to: DrawCircleSectorLines
    @inlinable
    public static func drawCircleSectorLines(
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
    
    // MARK: - Ellipses
    
    /// Draws a filled ellipse at the specified center.
    /// - Maps to: DrawEllipse
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
    /// - Maps to: DrawEllipseLines
    @inlinable
    public static func drawEllipseLines(
        at center: (x: Int32, y: Int32),
        horizontalRadius: Float,
        verticalRadius: Float,
        color: Color
    ) {
        CRaylib.DrawEllipseLines(center.x, center.y, horizontalRadius, verticalRadius, color)
    }
    
    // MARK: - Rings
    
    /// Draws a filled ring (annulus) at the specified center.
    /// - Maps to: DrawRing
    @inlinable
    public static func drawRing(
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

        let calculatedSegments =
            segments
            ?? defaultSegmentCount(
                startAngle: startAngle,
                endAngle: endAngle
            )

        CRaylib.DrawRing(
            center, innerRadius, outerRadius, startAngle, endAngle, calculatedSegments, color)
    }
    
    /// Draws a filled ring (annulus) with optimized segment count.
    /// Uses precise pixel-based calculation for segment count.
    /// - Maps to: DrawRing
    @inlinable
    public static func drawRing(
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
            CRaylib.DrawRing(
                center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
        }
    }

    /// Draws the outline of a ring (annulus) at the specified center.
    /// - Maps to: DrawRingLines
    @inlinable
    public static func drawRingLines(
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

        let calculatedSegments =
            segments
            ?? defaultSegmentCount(
                startAngle: startAngle,
                endAngle: endAngle
            )

        CRaylib.DrawRingLines(
            center, innerRadius, outerRadius, startAngle, endAngle, calculatedSegments, color)
    }
    
    /// Draws the outline of a ring (annulus) with optimized segment count.
    /// Uses precise pixel-based calculation for segment count.
    /// - Maps to: DrawRingLines
    @inlinable
    public static func drawRingLines(
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
            CRaylib.DrawRingLines(
                center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
        }
    }

    // MARK: - Rectangles
    
    /// Draws a filled rectangle at the specified position using coordinates.
    /// - Maps to: DrawRectangle
    @inlinable
    public static func drawRectangle(
        topLeft position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangle(position.x, position.y, width, height, color)
    }

    /// Draws a filled rectangle at the specified position using vectors.
    /// - Maps to: DrawRectangleV
    @inlinable
    public static func drawRectangle(topLeft position: Vector2, size: Vector2, color: Color) {
        CRaylib.DrawRectangleV(position, size, color)
    }

    /// Draws a filled rectangle defined by a Rectangle struct.
    /// - Maps to: DrawRectangleRec
    @inlinable
    public static func drawRectangle(_ rectangle: Rectangle, color: Color) {
        CRaylib.DrawRectangleRec(rectangle, color)
    }

    /// Draws a filled rectangle with rotation and origin offset.
    /// - Maps to: DrawRectanglePro
    @inlinable
    public static func drawRectangle(
        _ rectangle: Rectangle,
        origin: Vector2,
        rotation: Float,
        color: Color
    ) {
        CRaylib.DrawRectanglePro(rectangle, origin, rotation, color)
    }

    /// Draws the outline of a rectangle using coordinates.
    /// - Maps to: DrawRectangleLines
    @inlinable
    public static func drawRectangleLines(
        topLeft position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        color: Color
    ) {
        CRaylib.DrawRectangleLines(position.x, position.y, width, height, color)
    }

    /// Draws the outline of a rectangle with a specified thickness.
    /// - Maps to: DrawRectangleLinesEx
    @inlinable
    public static func drawRectangleLines(
        _ rectangle: Rectangle,
        thickness: Float,
        color: Color
    ) {
        CRaylib.DrawRectangleLinesEx(rectangle, thickness, color)
    }
    
    /// Draws a rectangle with a vertical gradient fill.
    /// - Maps to: DrawRectangleGradientV
    @inlinable
    public static func drawRectangleGradient(
        topLeft position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        topColor: Color,
        bottomColor: Color
    ) {
        CRaylib.DrawRectangleGradientV(position.x, position.y, width, height, topColor, bottomColor)
    }

    /// Draws a rectangle with a horizontal gradient fill.
    /// - Maps to: DrawRectangleGradientH
    @inlinable
    public static func drawRectangleGradient(
        topLeft position: (x: Int32, y: Int32),
        width: Int32,
        height: Int32,
        leftColor: Color,
        rightColor: Color
    ) {
        CRaylib.DrawRectangleGradientH(position.x, position.y, width, height, leftColor, rightColor)
    }

    /// Draws a rectangle with a custom gradient fill using vertex colors.
    /// - Maps to: DrawRectangleGradientEx
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

    /// Draws a filled rectangle with rounded corners.
    /// - Maps to: DrawRectangleRounded
    @inlinable
    public static func drawRectangleRounded(
        _ rectangle: Rectangle,
        roundness: Float,
        color: Color,
        segments: Int32 = 9
    ) {
        CRaylib.DrawRectangleRounded(rectangle, roundness, segments, color)
    }
    
    /// Draws a filled rectangle with rounded corners using optimized segment count.
    /// - Maps to: DrawRectangleRounded
    @inlinable
    public static func drawRectangleRounded(
        _ rectangle: Rectangle,
        roundness: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        // Zero or near-zero roundness check
        if roundness < Float.ulpOfOne {
            // Fall back to regular rectangle for zero roundness
            Self.drawRectangle(rectangle, color: color)
            return
        }

        // Calculate corner radius from rectangle dimensions and roundness
        let cornerRadius = min(rectangle.width, rectangle.height) * roundness * 0.5

        // Each corner is a 90° arc
        let segments = optimalSegmentCount(
            radius: cornerRadius,
            arcAngle: 90.0,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )

        CRaylib.DrawRectangleRounded(rectangle, roundness, segments, color)
    }

    /// Draw rectangle lines with rounded edges.
    /// - Maps to: DrawRectangleRoundedLines
    @inlinable
    public static func drawRectangleRoundedLines(
        _ rectangle: Rectangle,
        roundness: Float,
        color: Color,
        segments: Int32 = 9
    ) {
        CRaylib.DrawRectangleRoundedLines(rectangle, roundness, segments, color)
    }
    
    /// Draws the outline of a rectangle with rounded corners using optimized segment count.
    /// - Maps to: DrawRectangleRoundedLines
    @inlinable
    public static func drawRectangleRoundedLines(
        _ rectangle: Rectangle,
        roundness: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        // Zero or near-zero roundness check
        if roundness < Float.ulpOfOne {
            // Fall back to regular rectangle outlines for zero roundness
            Self.drawRectangleLines(
                topLeft: (Int32(rectangle.x), Int32(rectangle.y)),
                width: Int32(rectangle.width),
                height: Int32(rectangle.height),
                color: color
            )
            return
        }

        // Calculate corner radius from rectangle dimensions and roundness
        let cornerRadius = min(rectangle.width, rectangle.height) * roundness * 0.5

        // Each corner is a 90° arc
        let segments = optimalSegmentCount(
            radius: cornerRadius,
            arcAngle: 90.0,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )

        CRaylib.DrawRectangleRoundedLines(rectangle, roundness, segments, color)
    }

    /// Draws the outline of a rectangle with rounded corners and specified thickness.
    /// - Maps to: DrawRectangleRoundedLinesEx
    @inlinable
    public static func drawRectangleRoundedLines(
        _ rectangle: Rectangle,
        roundness: Float,
        thickness: Float,
        color: Color,
        segments: Int32 = 9
    ) {
        CRaylib.DrawRectangleRoundedLinesEx(rectangle, roundness, segments, thickness, color)
    }

    /// Draws the outline of a rectangle with rounded corners and specified thickness using optimized segment count.
    /// - Maps to: DrawRectangleRoundedLinesEx
    @inlinable
    public static func drawRectangleRoundedLines(
        _ rectangle: Rectangle,
        roundness: Float,
        thickness: Float,
        color: Color,
        segmentPixelLength: Float,
        scale: Float = 1.0
    ) {
        // Zero or near-zero roundness check
        if roundness < Float.ulpOfOne {
            // Fall back to regular rectangle outlines with thickness for zero roundness
            Self.drawRectangleLines(rectangle, thickness: thickness, color: color)
            return
        }

        // Calculate corner radius from rectangle dimensions and roundness
        let cornerRadius = min(rectangle.width, rectangle.height) * roundness * 0.5

        // Each corner is a 90° arc
        let segments = optimalSegmentCount(
            radius: cornerRadius,
            arcAngle: 90.0,
            segmentPixelLength: segmentPixelLength,
            scale: scale
        )

        CRaylib.DrawRectangleRoundedLinesEx(rectangle, roundness, segments, thickness, color)
    }

    // MARK: - Triangles
    
    /// Draws a filled triangle with vertices in counter-clockwise order.
    /// - Maps to: DrawTriangle
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
    /// - Maps to: DrawTriangleLines
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
    /// - Maps to: DrawTriangleFan
    @inlinable
    public static func drawTriangleFan(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTriangleFan(buffer.baseAddress, Int32(points.count), color)
        }
    }

    /// Draws a filled triangle strip defined by a sequence of points.
    /// - Maps to: DrawTriangleStrip
    @inlinable
    public static func drawTriangleStrip(_ points: [Vector2], color: Color) {
        points.withUnsafeBufferPointer { buffer in
            CRaylib.DrawTriangleStrip(buffer.baseAddress, Int32(points.count), color)
        }
    }

    // MARK: - Polygons
    
    /// Draws a filled regular polygon with the specified number of sides.
    /// - Maps to: DrawPoly
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

    /// Draws a filled regular polygon based on a RegularPolygon struct.
    /// Convenience method that passes the polygon's properties to the underlying implementation.
    /// - Maps to: DrawPoly
    @inlinable 
    public static func drawPolygon(
        _ polygon: RegularPolygon,
        color: Color
    ) {
        Self.drawPolygon(
            center: polygon.center,
            numberOfSides: polygon.numberOfSides,
            radius: polygon.radius,
            rotation: polygon.rotation,
            color: color)
    }

    /// Draws the outline of a regular polygon with the specified number of sides.
    /// - Maps to: DrawPolyLines
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

    /// Draws the outline of a regular polygon based on a RegularPolygon struct.
    /// Convenience method that passes the polygon's properties to the underlying implementation.
    /// - Maps to: DrawPolyLines 
    @inlinable
    public static func drawPolygonLines(
        _ polygon: RegularPolygon,
        color: Color
    ) {
        Self.drawPolygonLines(
            center: polygon.center,
            numberOfSides: polygon.numberOfSides,
            radius: polygon.radius,
            rotation: polygon.rotation,
            color: color)
    }

    /// Draws the outline of a regular polygon with the specified thickness.
    /// - Maps to: DrawPolyLinesEx
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

    /// Draws the outline of a regular polygon with specified thickness.
    /// Convenience method that passes the polygon's properties to the underlying implementation.
    /// - Maps to: DrawPolyLinesEx
    @inlinable
    public static func drawPolygonLines(
        _ polygon: RegularPolygon,
        thickness: Float,
        color: Color
    ) {
        Self.drawPolygonLines(
            center: polygon.center,
            numberOfSides: polygon.numberOfSides,
            radius: polygon.radius,
            rotation: polygon.rotation,
            thickness: thickness,
            color: color
        )
    }

    // MARK: - Segment Count Utility Methods
    
    /// Calculates optimal number of segments for drawing curved shapes.
    /// Custom Swift implementation that balances visual quality with performance.
    /// Uses curve length and scale to determine appropriate segment count.
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

    /// Calculates optimal segment count for a specific arc range.
    /// Variation that takes start and end angles instead of arc angle.
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

    /// Calculates default number of segments for drawing curved shapes.
    /// Uses raylib's convention of 36 segments for a full circle.
    /// Scales proportionally based on the angle of the arc.
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

    /// Calculates default segment count for a specific arc range.
    /// Variation that takes start and end angles instead of arc angle.
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
}
