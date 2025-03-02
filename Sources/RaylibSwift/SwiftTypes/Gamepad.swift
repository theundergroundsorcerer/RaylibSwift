/**
 * Gamepad related types and functionality
 *
 * This namespace contains enumerations for working with gamepad input,
 * providing a Swift-friendly interface to raylib's gamepad functionality.
 *
 * Example usage:
 * ```swift
 * // Check if a gamepad is connected
 * if IsGamepadAvailable(0) {
 *     // Get button states
 *     if IsGamepadButtonPressed(0, Gamepad.Button.rightFaceDown.rawValue) {
 *         // A/Cross button pressed
 *     }
 *     
 *     // Get analog stick movement
 *     let leftX = GetGamepadAxisMovement(0, Gamepad.Axis.leftX.rawValue)
 *     let leftY = GetGamepadAxisMovement(0, Gamepad.Axis.leftY.rawValue)
 *     
 *     // Use analog values to control game elements
 *     playerPosition.x += leftX * playerSpeed
 *     playerPosition.y += leftY * playerSpeed
 * }
 * ```
 */
public enum Gamepad {
    /**
     * Gamepad axes
     *
     * This enum defines the different gamepad axes that can be detected.
     * Each axis represents a specific analog input from the controller.
     *
     * Maps to Raylib's C enum: GamepadAxis
     * Replaces: GAMEPAD_AXIS_LEFT_X, GAMEPAD_AXIS_LEFT_Y, etc.
     *
     * Example usage:
     * ```swift
     * // Instead of: GetGamepadAxisMovement(0, GAMEPAD_AXIS_LEFT_X)
     * let leftStickX = GetGamepadAxisMovement(0, Gamepad.Axis.leftX.rawValue)
     * if leftStickX > 0.5 {
     *     // Move character right
     * }
     * ```
     */
    public enum Axis: Int32 {
        /// Gamepad left stick X axis
        /// Replaces: GAMEPAD_AXIS_LEFT_X
        case leftX = 0

        /// Gamepad left stick Y axis
        /// Replaces: GAMEPAD_AXIS_LEFT_Y
        case leftY = 1

        /// Gamepad right stick X axis
        /// Replaces: GAMEPAD_AXIS_RIGHT_X
        case rightX = 2

        /// Gamepad right stick Y axis
        /// Replaces: GAMEPAD_AXIS_RIGHT_Y
        case rightY = 3

        /// Gamepad back trigger left, pressure level: [1..-1]
        /// Replaces: GAMEPAD_AXIS_LEFT_TRIGGER
        case leftTrigger = 4

        /// Gamepad back trigger right, pressure level: [1..-1]
        /// Replaces: GAMEPAD_AXIS_RIGHT_TRIGGER
        case rightTrigger = 5
    }

    /**
     * Gamepad buttons
     *
     * This enum defines the different gamepad buttons that can be detected.
     * These values are standardized across different controller types (Xbox, PlayStation, etc.)
     * to provide a consistent mapping.
     *
     * Maps to Raylib's C enum: GamepadButton
     * Replaces: GAMEPAD_BUTTON_UNKNOWN, GAMEPAD_BUTTON_LEFT_FACE_UP, etc.
     *
     * Example usage:
     * ```swift
     * // Instead of: IsGamepadButtonPressed(0, GAMEPAD_BUTTON_RIGHT_FACE_DOWN)
     * if IsGamepadButtonPressed(0, Gamepad.Button.rightFaceDown.rawValue) {
     *     // A/Cross button pressed on controller 0
     * }
     * ```
     */
    public enum Button: Int32 {
        /// Unknown button, just for error checking
        /// Replaces: GAMEPAD_BUTTON_UNKNOWN
        case unknown = 0

        /// Gamepad left DPAD up button
        /// Replaces: GAMEPAD_BUTTON_LEFT_FACE_UP
        case leftFaceUp = 1

        /// Gamepad left DPAD right button
        /// Replaces: GAMEPAD_BUTTON_LEFT_FACE_RIGHT
        case leftFaceRight = 2

        /// Gamepad left DPAD down button
        /// Replaces: GAMEPAD_BUTTON_LEFT_FACE_DOWN
        case leftFaceDown = 3

        /// Gamepad left DPAD left button
        /// Replaces: GAMEPAD_BUTTON_LEFT_FACE_LEFT
        case leftFaceLeft = 4

        /// Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
        /// Replaces: GAMEPAD_BUTTON_RIGHT_FACE_UP
        case rightFaceUp = 5

        /// Gamepad right button right (i.e. PS3: Circle, Xbox: B)
        /// Replaces: GAMEPAD_BUTTON_RIGHT_FACE_RIGHT
        case rightFaceRight = 6

        /// Gamepad right button down (i.e. PS3: Cross, Xbox: A)
        /// Replaces: GAMEPAD_BUTTON_RIGHT_FACE_DOWN
        case rightFaceDown = 7

        /// Gamepad right button left (i.e. PS3: Square, Xbox: X)
        /// Replaces: GAMEPAD_BUTTON_RIGHT_FACE_LEFT
        case rightFaceLeft = 8

        /// Gamepad top/back trigger left (first), it could be a trailing button
        /// Replaces: GAMEPAD_BUTTON_LEFT_TRIGGER_1
        case leftTrigger1 = 9

        /// Gamepad top/back trigger left (second), it could be a trailing button
        /// Replaces: GAMEPAD_BUTTON_LEFT_TRIGGER_2
        case leftTrigger2 = 10

        /// Gamepad top/back trigger right (first), it could be a trailing button
        /// Replaces: GAMEPAD_BUTTON_RIGHT_TRIGGER_1
        case rightTrigger1 = 11

        /// Gamepad top/back trigger right (second), it could be a trailing button
        /// Replaces: GAMEPAD_BUTTON_RIGHT_TRIGGER_2
        case rightTrigger2 = 12

        /// Gamepad center buttons, left one (i.e. PS3: Select)
        /// Replaces: GAMEPAD_BUTTON_MIDDLE_LEFT
        case middleLeft = 13

        /// Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
        /// Replaces: GAMEPAD_BUTTON_MIDDLE
        case middle = 14

        /// Gamepad center buttons, right one (i.e. PS3: Start)
        /// Replaces: GAMEPAD_BUTTON_MIDDLE_RIGHT
        case middleRight = 15

        /// Gamepad joystick pressed button left
        /// Replaces: GAMEPAD_BUTTON_LEFT_THUMB
        case leftThumb = 16

        /// Gamepad joystick pressed button right
        /// Replaces: GAMEPAD_BUTTON_RIGHT_THUMB
        case rightThumb = 17
    }
}