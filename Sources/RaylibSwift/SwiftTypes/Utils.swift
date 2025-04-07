import CRaylib
import CRaylibExtensions

public enum Utils {
    /**
     * System/Window configuration flags
     *
     * These flags can be used to customize system behavior, such as:
     * - Display settings (fullscreen, resizable window, etc.)
     * - Rendering options (vsync, MSAA, etc.)
     * - Window states and behavior
     *
     * Maps to Raylib's C enum: ConfigFlags
     * Replaces: FLAG_VSYNC_HINT, FLAG_FULLSCREEN_MODE, FLAG_WINDOW_RESIZABLE, etc.
     *
     * NOTE: Every bit registers one state (use with bit masks)
     * By default all flags are set to 0
     *
     * Usage:
     * ```swift
     * // Instead of: SetConfigFlags(FLAG_WINDOW_RESIZABLE | FLAG_VSYNC_HINT)
     * Utility.setConfigFlags([.windowResizable, .vsyncHint])
     * ```
     */
    public struct ConfigFlags: OptionSet {
        public let rawValue: UInt32

        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        /// Set to try enabling VSync on GPU
        /// Replaces: FLAG_VSYNC_HINT
        public static var vsyncHint: ConfigFlags { ConfigFlags(rawValue: 0x0000_0040) }

        /// Set to run program in fullscreen
        /// Replaces: FLAG_FULLSCREEN_MODE
        public static var fullscreenMode: ConfigFlags { ConfigFlags(rawValue: 0x0000_0002) }

        /// Set to allow resizable window
        /// Replaces: FLAG_WINDOW_RESIZABLE
        public static var windowResizable: ConfigFlags { ConfigFlags(rawValue: 0x0000_0004) }

        /// Set to disable window decoration (frame and buttons)
        /// Replaces: FLAG_WINDOW_UNDECORATED
        public static var windowUndecorated: ConfigFlags { ConfigFlags(rawValue: 0x0000_0008) }

        /// Set to hide window
        /// Replaces: FLAG_WINDOW_HIDDEN
        public static var windowHidden: ConfigFlags { ConfigFlags(rawValue: 0x0000_0080) }

        /// Set to minimize window (iconify)
        /// Replaces: FLAG_WINDOW_MINIMIZED
        public static var windowMinimized: ConfigFlags { ConfigFlags(rawValue: 0x0000_0200) }

        /// Set to maximize window (expanded to monitor)
        /// Replaces: FLAG_WINDOW_MAXIMIZED
        public static var windowMaximized: ConfigFlags { ConfigFlags(rawValue: 0x0000_0400) }

        /// Set to window non focused
        /// Replaces: FLAG_WINDOW_UNFOCUSED
        public static var windowUnfocused: ConfigFlags { ConfigFlags(rawValue: 0x0000_0800) }

        /// Set to window always on top
        /// Replaces: FLAG_WINDOW_TOPMOST
        public static var windowTopmost: ConfigFlags { ConfigFlags(rawValue: 0x0000_1000) }

        /// Set to allow windows running while minimized
        /// Replaces: FLAG_WINDOW_ALWAYS_RUN
        public static var windowAlwaysRun: ConfigFlags { ConfigFlags(rawValue: 0x0000_0100) }

        /// Set to allow transparent framebuffer
        /// Replaces: FLAG_WINDOW_TRANSPARENT
        public static var windowTransparent: ConfigFlags { ConfigFlags(rawValue: 0x0000_0010) }

        /// Set to support HighDPI
        /// Replaces: FLAG_WINDOW_HIGHDPI
        public static var windowHighDpi: ConfigFlags { ConfigFlags(rawValue: 0x0000_2000) }

        /// Set to support mouse passthrough, only supported when windowUndecorated
        /// Replaces: FLAG_WINDOW_MOUSE_PASSTHROUGH
        public static var windowMousePassthrough: ConfigFlags { ConfigFlags(rawValue: 0x0000_4000) }

        /// Set to run program in borderless windowed mode
        /// Replaces: FLAG_BORDERLESS_WINDOWED_MODE
        public static var borderlessWindowedMode: ConfigFlags { ConfigFlags(rawValue: 0x0000_8000) }

        /// Set to try enabling MSAA 4X
        /// Replaces: FLAG_MSAA_4X_HINT
        public static var msaa4xHint: ConfigFlags { ConfigFlags(rawValue: 0x0000_0020) }

        /// Set to try enabling interlaced video format (for V3D)
        /// Replaces: FLAG_INTERLACED_HINT
        public static var interlacedHint: ConfigFlags { ConfigFlags(rawValue: 0x0001_0000) }
    }

}

extension Utils {
    typealias TraceLogCallback = ()

}

extension Utils {
    /**
     * Set configuration flags
     *
     * These flags control various system behaviors including window properties,
     * rendering options, and hardware configuration hints.
     *
     * - Parameter flags: One or more configuration flags to enable
     */
    @inlinable
    public static func setConfigFlags(_ flags: ConfigFlags) {
        CRaylib.SetConfigFlags(flags.rawValue)
    }

    /// Swap back buffer with front buffer (screen drawing)
    @inlinable
    public static func swapScreenBuffer() {
        CRaylib.SwapScreenBuffer()
    }

    /// Wait for some time (halt program execution)
    @inlinable
    public static func pollInputEvents() {
        CRaylib.PollInputEvents()
    }

    /// Takes a screenshot of current screen (filename extension defines format)
    @inlinable
    public static func takeScreenshot(fileName: String) {
        CRaylib.TakeScreenshot(fileName)
    }

    /// Open URL with default system browser (if available)
    public static func OpenURL(url: String) {
        CRaylib.OpenURL(url)
    }
}

extension Utils {
    public enum TraceLogLevel: Int32 {
        /// Display all logs
        case all = 0

        /// Trace logging, intended for internal use only
        case trace = 1

        /// Debug logging, used for internal debugging, it should be disabled on release builds
        case debug = 2

        /// Info logging, used for program execution info
        case info = 3

        /// Warning logging, used on recoverable failures
        case warning = 4

        /// Error logging, used on unrecoverable failures
        case error = 5

        /// Fatal logging, used to abort program: exit(EXIT_FAILURE)
        case fatal = 6

        /// Disable logging
        case none = 7
    }

    /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
    @inlinable
    public static func traceLog(_ logLevel: TraceLogLevel, _ message: String) {
        CRaylibExtensions.TraceLogSwift(logLevel.rawValue, message)
    }

    /// Set the current threshold (minimum) log level
    @inlinable
    public static func setTraceLogLevel(_ logLevel: Utils.TraceLogLevel) {
        CRaylib.SetTraceLogLevel(logLevel.rawValue)
    }

    /// Internal memory allocator
    @available(
        *, deprecated,
        message:
            "Allocates memory manually, which is a rare usage pattern in Swift. May be removed in future versions."
    )
    @inlinable
    public static func memAlloc(_ size: UInt32) -> UnsafeMutableRawPointer {
        CRaylib.MemAlloc(size)
    }

    /// Internal memory reallocator
    @available(
        *, deprecated,
        message:
            "Reallocates memory manually, which is a rare usage pattern in Swift. May be removed in future versions."
    )
    @inlinable
    public static func memRealloc(_ ptr: UnsafeMutableRawPointer, _ size: UInt32) {
        CRaylib.MemRealloc(ptr, size)
    }

    /// Internal memory free
    @available(
        *, deprecated,
        message:
            "Frees memory manually, which is a rare usage patterin in Swift. May be removed in future"
    )
    @inlinable
    public static func memFree(_ ptr: UnsafeMutableRawPointer) {
        CRaylib.MemFree(ptr)
    }

}
