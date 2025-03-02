/**
 * Mouse related types and functionality
 *
 * This namespace contains enumerations for working with mouse input,
 * providing a Swift-friendly interface to raylib's mouse functionality.
 *
 * Example usage:
 * ```
 * // Check if a mouse button is pressed
 * if IsMouseButtonPressed(Mouse.MouseButtons.mouseButtonLeft) {
 *     // Handle left mouse button press
 * }
 * 
 * // Change cursor appearance
 * SetMouseCursor(Mouse.MouseCursors.pointingHand)
 * 
 * // Get mouse position
 * let mousePos = GetMousePosition()
 * ```
 */
public enum Mouse {
    /**
     * Mouse buttons from Raylib library
     *
     * Example usage:
     * ```
     * if IsMouseButtonPressed(.mouseButtonLeft) {
     *     // Handle left mouse button press
     * }
     * ```
     */
    public enum MouseButtons: Int32 {
        /// Mouse button left
        case mouseButtonLeft = 0

        /// Mouse button right
        case mouseButtonRight = 1

        /// Mouse button middle (pressed wheel)
        case mouseButtonMiddle = 2

        /// Mouse button side (advanced mouse device)
        case mouseButtonSide = 3

        /// Mouse button extra (advanced mouse device)
        case mouseButtonExtra = 4

        /// Mouse button forward (advanced mouse device)
        case mouseButtonForward = 5

        /// Mouse button back (advanced mouse device)
        case mouseButtonBack = 6
    }

    /**
     * Mouse cursor shapes to be used with SetMouseCursor()
     *
     * Example usage:
     * ```swift
     * // Set the cursor to a pointing hand when hovering a button
     * if CheckCollisionPointRec(GetMousePosition(), buttonBounds) {
     *     SetMouseCursor(MouseCursors.pointingHand)
     * } else {
     *     SetMouseCursor(MouseCursors.defaultCursor)
     * }
     * ```
     */
    public enum MouseCursors: Int32 {
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

}
