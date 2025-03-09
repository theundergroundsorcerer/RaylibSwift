import CRaylib

extension Window {
    public enum Cursor {
        /// Shows cursor
        @inlinable
        public static func show() {
            CRaylib.ShowCursor()
        }

        /// Hides cursor
        @inlinable
        public static func hide() {
            CRaylib.HideCursor()
        }

        /// Check if cursor is not visible
        @inlinable
        public static var isHidden: Bool {
            CRaylib.IsCursorHidden()
        }

        /// Check if cursor is visible
        @inlinable
        public static var isVisible: Bool {
            !isHidden
        }

        /// Enables cursor (unlock cursor)
        @inlinable
        public static func enable() {
            CRaylib.EnableCursor()
        }

        /// Disables cursor (lock cursor)
        @inlinable
        public static func disable() {
            CRaylib.DisableCursor()
        }

        /// Check if cursor is on the screen
        @inlinable
        public static var isOnScreen: Bool {
            CRaylib.IsCursorOnScreen()
        }
    }
}
