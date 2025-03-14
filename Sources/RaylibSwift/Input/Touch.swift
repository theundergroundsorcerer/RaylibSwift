import CRaylib
/// Input-related functions: touch
public enum Touch {
    /// Get touch position X for touch point 0 (relative to screen size)
    @inlinable 
    public static var touchX: Int32 {
        CRaylib.GetTouchX()
    }

    /// Get touch position Y for touch point 0 (relative to screen size)
    @inlinable
    public static var touchY: Int32 {
        CRaylib.GetTouchY()
    }

    /// Get touch position XY for a touch point index (relative to screen size)
    @inlinable
    public static func touchPosition(index: Int32) -> Vector2 {
        CRaylib.GetTouchPosition(index)
    }

    /// Get touch point identifier for given index
    @inlinable
    public static func touchPointId(index: Int32) -> Int32 {
        CRaylib.GetTouchPointId(index)
    }

    /// Get number of touch points
    @inlinable
    public static var touchPointCount: Int32 {
        CRaylib.GetTouchPointCount()
    }
}