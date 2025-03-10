import CRaylib

extension Input {
    /// Gamepad related types and functionality
    public enum Gamepad {

        /// Gamepad axes

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

        /// Gamepad buttons
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

        /// Check if a gamepad is available
        @inlinable
        public static func isAvailable(on gamepad: Int32) -> Bool {
            CRaylib.IsGamepadAvailable(gamepad)
        }

        /// Game gamepad internal name id
        @inlinable
        public static func name(_ gamepad: Int32) -> String {
            String(cString: CRaylib.GetGamepadName(gamepad))
        }

        /// Check if gamepad button has been pressed once
        @inlinable
        public static func isPressed(button: Gamepad.Button, on gamepad: Int32) -> Bool {
            CRaylib.IsGamepadButtonPressed(gamepad, button.rawValue)
        }

        /// Check if gamepad button is being pressed
        @inlinable
        public static func isDown(button: Gamepad.Button, on gamepad: Int32) -> Bool {
            CRaylib.IsGamepadButtonDown(gamepad, button.rawValue)
        }

        /// Check if a gamepad button has been released
        @inlinable
        public static func isReleased(button: Gamepad.Button, on gamepad: Int32) -> Bool {
            CRaylib.IsGamepadButtonReleased(gamepad, button.rawValue)
        }

        /// Check if Gamepad button is NOT being pressed
        @inlinable
        public static func isUp(button: Gamepad.Button, on gamepad: Int32) -> Bool {
            CRaylib.IsGamepadButtonUp(gamepad, button.rawValue)
        }

        /// Get the last gamepad button pressed
        @inlinable
        public static func lastPressedButton() -> Gamepad.Button {
            Gamepad.Button(rawValue: CRaylib.GetGamepadButtonPressed()) ?? .unknown
        }

        /// Get gamepad axis count for a gamepad
        @inlinable
        public static func axisCount(on gamepad: Int32) -> Int32 {
            CRaylib.GetGamepadAxisCount(gamepad)
        }

        /// Get axis movement value for a gamepad axis
        @inlinable
        public static func axisMovement(of axis: Gamepad.Axis, on gamepad: Int32) -> Float32 {
            CRaylib.GetGamepadAxisMovement(gamepad, axis.rawValue)
        }

        /// Set internal gamepad mappings (SDL_GameControllerDB)
        @inlinable
        public static func setMappings(_ mappings: String) -> Int32 {
            mappings.withCString { mappingsCStr in
                CRaylib.SetGamepadMappings(mappingsCStr)
            }
        }

        /// Set gamepad vibration for both motors (duration in seconds)
        @inlinable
        public static func setVibration(
            leftMotor: Float32, 
            rightMotor: Float32,
            for duration: Float32,
            on gamepad: Int32
        ) {
            CRaylib.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration)
        }
    }
}

public typealias Gamepad = Input.Gamepad
public typealias GamepadButton = Gamepad.Button
public typealias GamepadAxis = Gamepad.Axis

