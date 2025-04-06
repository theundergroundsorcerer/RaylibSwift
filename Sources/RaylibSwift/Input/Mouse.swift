import CRaylib

public enum Mouse {
    ///// Mouse buttons
    public enum Button: Int32 {
        /// Mouse button left
        case left = 0

        /// Mouse button right
        case right = 1

        /// Mouse button middle (pressed wheel)
        case middle = 2

        /// Mouse button side (advanced mouse device)
        case side = 3

        /// Mouse button extra (advanced mouse device)
        case extra = 4

        /// Mouse button forward (advanced mouse device)
        case forward = 5

        /// Mouse button back (advanced mouse device)
        case back = 6
    }

    /// Mouse cursor shapes
    public enum Cursor: Int32 {
        /// Default pointer shape
        case defaultCursor = 0

        /// Arrow shape
        case arrow = 1

        /// Text writing cursor shape
        case ibeam = 2

        /// Cross shape
        case crosshair = 3

        /// Pointing hand cursor
        case pointingHand = 4

        /// Horizontal resize/move arrow shape
        case resizeEW = 5

        /// Vertical resize/move arrow shape
        case resizeNS = 6

        /// Top-left to bottom-right diagonal resize/move arrow shape
        case resizeNWSE = 7

        /// Top-right to bottom-left diagonal resize/move arrow shape
        case resizeNESW = 8

        /// Omnidirectional resize/move cursor shape
        case resizeAll = 9

        /// Operation-not-allowed shape
        case notAllowed = 10
    }

    /// Check if a mouse button has been pressed once
    @inlinable
    public static func isPressed(button: Button) -> Bool {
        CRaylib.IsMouseButtonPressed(button.rawValue)
    }

    /// Check if a mouse button is being pressed
    @inlinable
    public static func isDown(button: Button) -> Bool {
        CRaylib.IsMouseButtonDown(button.rawValue)
    }

    /// Check if a mouse button has been released once
    @inlinable
    public static func isReleased(button: Button) -> Bool {
        CRaylib.IsMouseButtonReleased(button.rawValue)
    }

    /// Check if mouse button is NOT being pressed
    @inlinable
    public static func isUp(button: Button) -> Bool {
        CRaylib.IsMouseButtonUp(button.rawValue)
    }

    /// Get mouse position X
    @inlinable
    public static var x: Int32 {
        CRaylib.GetMouseX()
    }

    /// Get mouse position Y
    @inlinable
    public static var y: Int32 {
        CRaylib.GetMouseY()
    }

    /// Get mouse position XY
    @inlinable
    public static var position: Vector2 {
        get {
            CRaylib.GetMousePosition()
        }
        set {
            CRaylib.SetMousePosition(I(newValue.x.rounded()), I(newValue.y.rounded()))
        }
    }

    /// Get mouse delta between frames
    @inlinable
    public static var delta: Vector2 {
        CRaylib.GetMouseDelta()
    }

    /// Set mouse position between frames
    @inlinable
    public static func setPosition(x: Int32, y: Int32) {
        CRaylib.SetMousePosition(x, y)
    }

    /// Set mouse offset
    @inlinable
    public static func setOffset(offsetX: Int32, offsetY: Int32) {
        CRaylib.SetMouseOffset(offsetX, offsetY)
    }

    /// Set mouse scaling
    @inlinable
    public static func setScale(scaleX: Float, scaleY: Float) {
        CRaylib.SetMouseScale(scaleX, scaleY)
    }

    /// Get mouse wheel movement for X or Y, whichever is larger
    @inlinable
    public static var wheelMove: Float {
        CRaylib.GetMouseWheelMove()
    }

    /// Get mouse wheel movement for both X and Y
    @inlinable
    public static var wheelMoveVector: Vector2 {
        CRaylib.GetMouseWheelMoveV()
    }

    /// Set mouse cursor shape
    @inlinable
    public static func setCursor(to mouseCursor: Cursor) {
        CRaylib.SetMouseCursor(mouseCursor.rawValue)
    }

}
