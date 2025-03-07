import CRaylib

/// Touch input related functionality
extension Input {
    public enum Gestures {

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
        }
    }
}
