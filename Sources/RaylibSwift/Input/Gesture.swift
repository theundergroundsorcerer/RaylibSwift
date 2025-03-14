import CRaylib

/// Gesture and Touch input related functionality

/// Touch gesture flags
public struct Gesture: OptionSet {
    public let rawValue: UInt32

    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

    /// No gesture
    /// Replaces: GESTURE_NONE
    public static var none: Gesture { Gesture(rawValue: 0) }

    /// Tap gesture
    /// Replaces: GESTURE_TAP
    public static var tap: Gesture { Gesture(rawValue: 1) }

    /// Double tap gesture
    /// Replaces: GESTURE_DOUBLETAP
    public static var doubleTap: Gesture { Gesture(rawValue: 2) }

    /// Hold gesture
    /// Replaces: GESTURE_HOLD
    public static var hold: Gesture { Gesture(rawValue: 4) }

    /// Drag gesture
    /// Replaces: GESTURE_DRAG
    public static var drag: Gesture { Gesture(rawValue: 8) }

    /// Swipe right gesture
    /// Replaces: GESTURE_SWIPE_RIGHT
    public static var swipeRight: Gesture { Gesture(rawValue: 16) }

    /// Swipe left gesture
    /// Replaces: GESTURE_SWIPE_LEFT
    public static var swipeLeft: Gesture { Gesture(rawValue: 32) }

    /// Swipe up gesture
    /// Replaces: GESTURE_SWIPE_UP
    public static var swipeUp: Gesture { Gesture(rawValue: 64) }

    /// Swipe down gesture
    /// Replaces: GESTURE_SWIPE_DOWN
    public static var swipeDown: Gesture { Gesture(rawValue: 128) }

    /// Pinch in gesture
    /// Replaces: GESTURE_PINCH_IN
    public static var pinchIn: Gesture { Gesture(rawValue: 256) }

    /// Pinch out gesture
    /// Replaces: GESTURE_PINCH_OUT
    public static var pinchOut: Gesture { Gesture(rawValue: 512) }

    /// Enable a set of gestures using flags
    @inlinable
    public static func enable(_ flags: Gesture) {
        CRaylib.SetGesturesEnabled(flags.rawValue)
    }

    /// Check if a gesture or combination of gestures have been detected
    @inlinable
    public static func isDetected(_ gesture: Gesture) -> Bool {
        CRaylib.IsGestureDetected(gesture.rawValue)
    }

    /// Get latest detected gesture
    @inlinable
    public static var currentDetected: Gesture {
        Gesture(rawValue: UInt32(CRaylib.GetGestureDetected()))
    }

    /// Get gesture hold time in seconds
    @inlinable
    public static var holdDuration: Float {
        CRaylib.GetGestureHoldDuration()
    }

    /// Get gesture drag vector
    @inlinable
    public static var dragVector: Point {
        CRaylib.GetGestureDragVector()
    }

    /// Get gesture drag angle
    @inlinable
    public static var dragAngle: Float {
        CRaylib.GetGestureDragAngle()
    }

    /// Get gesture pinch delta
    @inlinable
    public static var pinchVector: Point {
        CRaylib.GetGesturePinchVector()
    }

    /// Get gesture pinch angle
    @inlinable
    public static var pinchAngle: Float {
        CRaylib.GetGesturePinchAngle()
    }
}
