import CRaylib

/// Keyboard related types and functionality
public enum Keyboard {

    /// A Swift-friendly wrapper for keyboard key codes used in Raylib.
    public enum Key: Int32 {
        /// No key
        case null = 0
        /// '
        case apostrophe = 39
        /// ,
        case comma = 44
        /// -
        case minus = 45
        /// .
        case period = 46
        /// /
        case slash = 47
        /// 0
        case zero = 48
        /// 1
        case one = 49
        /// 2
        case two = 50
        /// 3
        case three = 51
        /// 4
        case four = 52
        /// 5
        case five = 53
        /// 6
        case six = 54
        /// 7
        case seven = 55
        /// 8
        case eight = 56
        /// 9
        case nine = 57
        /// ;
        case semicolon = 59
        /// =
        case equal = 61
        /// A
        case a = 65
        /// B
        case b = 66
        /// C
        case c = 67
        /// D
        case d = 68
        /// E
        case e = 69
        /// F
        case f = 70
        /// G
        case g = 71
        /// H
        case h = 72
        /// I
        case i = 73
        /// J
        case j = 74
        /// K
        case k = 75
        /// L
        case l = 76
        /// M
        case m = 77
        /// N
        case n = 78
        /// O
        case o = 79
        /// P
        case p = 80
        /// Q
        case q = 81
        /// R
        case r = 82
        /// S
        case s = 83
        /// T
        case t = 84
        /// U
        case u = 85
        /// V
        case v = 86
        /// W
        case w = 87
        /// X
        case x = 88
        /// Y
        case y = 89
        /// Z
        case z = 90
        /// [
        case leftBracket = 91
        /// \
        case backslash = 92
        /// ]
        case rightBracket = 93
        /// `
        case grave = 96

        // Function keys
        /// Space bar
        case space = 32
        /// ESC
        case escape = 256
        /// Enter
        case enter = 257
        /// Tab
        case tab = 258
        /// Backspace
        case backspace = 259
        /// INS
        case insert = 260
        /// DEL
        case delete = 261
        /// Right arrow
        case right = 262
        /// Left arrow
        case left = 263
        /// Down arrow
        case down = 264
        /// Up arrow
        case up = 265
        /// Page Up
        case pageUp = 266
        /// Page Down
        case pageDown = 267
        /// Home
        case home = 268
        /// End
        case end = 269
        /// Caps Lock
        case capsLock = 280
        /// Scroll Lock
        case scrollLock = 281
        /// Num Lock
        case numLock = 282
        /// Print Screen
        case printScreen = 283
        /// Pause
        case pause = 284
        /// F1
        case f1 = 290
        /// F2
        case f2 = 291
        /// F3
        case f3 = 292
        /// F4
        case f4 = 293
        /// F5
        case f5 = 294
        /// F6
        case f6 = 295
        /// F7
        case f7 = 296
        /// F8
        case f8 = 297
        /// F9
        case f9 = 298
        /// F10
        case f10 = 299
        /// F11
        case f11 = 300
        /// F12
        case f12 = 301
        /// Left Shift
        case leftShift = 340
        /// Left Control
        case leftControl = 341
        /// Left Alt
        case leftAlt = 342
        /// Left Super
        case leftSuper = 343
        /// Right Shift
        case rightShift = 344
        /// Right Control
        case rightControl = 345
        /// Right Alt
        case rightAlt = 346
        /// Right Super
        case rightSuper = 347
        /// Menu
        case kbMenu = 348

        // Keypad keys
        /// Keypad 0
        case keypadZero = 320
        /// Keypad 1
        case keypadOne = 321
        /// Keypad 2
        case keypadTwo = 322
        /// Keypad 3
        case keypadThree = 323
        /// Keypad 4
        case keypadFour = 324
        /// Keypad 5
        case keypadFive = 325
        /// Keypad 6
        case keypadSix = 326
        /// Keypad 7
        case keypadSeven = 327
        /// Keypad 8
        case keypadEight = 328
        /// Keypad 9
        case keypadNine = 329
        /// Keypad .
        case keypadDecimal = 330
        /// Keypad /
        case keypadDivide = 331
        /// Keypad *
        case keypadMultiply = 332
        /// Keypad -
        case keypadSubtract = 333
        /// Keypad +
        case keypadAdd = 334
        /// Keypad Enter
        case keypadEnter = 335
        /// Keypad =
        case keypadEqual = 336

        // Android key buttons
        /// Back (Android)
        case back = 4
        /// Menu (Android)
        case menu = 5
        /// Volume Up (Android)
        case volumeUp = 24
        /// Volume Down (Android)
        case volumeDown = 25
    }

    /// Check if a key has been pressed once
    @inlinable
    public static func isPressed(key: Key) -> Bool {
        CRaylib.IsKeyPressed(key.rawValue)
    }

    /// Check if a key has been pressed again
    @inlinable
    public static func isPressedRepeat(key: Key) -> Bool {
        CRaylib.IsKeyPressedRepeat(key.rawValue)
    }

    /// Check if a key is being pressed
    @inlinable
    public static func isDown(key: Key) -> Bool {
        CRaylib.IsKeyDown(key.rawValue)
    }

    /// Check if a key has been released once
    @inlinable
    public static func isReleased(key: Key) -> Bool {
        CRaylib.IsKeyReleased(key.rawValue)
    }

    /// Check if a key is NOT being pressed
    @inlinable
    public static func isUp(key: Key) -> Bool {
        CRaylib.IsKeyUp(key.rawValue)
    }

    /// Get key pressed (keycode), call it multiple times for keys queued,
    /// returns 0 when the queue is empty
    @inlinable
    public static func keyPressed() -> Key {
        let keyCode = CRaylib.GetKeyPressed()
        return Key(rawValue: keyCode) ?? Key.null
    }

    /// Get char pressed (unicode),
    /// call it multiple times for chars queued, returns 0 when the queue is empty
    @inlinable
    public static func charPressed() -> Character? {
        let charCode = CRaylib.GetCharPressed()

        guard let unicodeScalar = UnicodeScalar(Int(charCode)) else {
            return nil
        }

        return Character(unicodeScalar)
    }

    /// Set a custom key to exit program (default is ESC)
    @inlinable
    public static func setExitKey(to key: Key) {
        CRaylib.SetExitKey(key.rawValue)
    }

}
