/**
 * System-related configurations and settings
 *
 * This namespace contains configurations and flags for system behavior,
 * particularly related to window management, display modes, and rendering options.
 *
 * Example usage:
 * ```swift
 * // Set window to be resizable and with vsync enabled
 * SetConfigFlags(System.Flags.windowResizable.rawValue | System.Flags.vsyncHint.rawValue)
 * 
 * // Initialize window with the configured settings
 * InitWindow(800, 600, "Raylib Swift Example")
 * ```
 */
public enum System {
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
     * SetConfigFlags(System.Flags.windowResizable.rawValue | System.Flags.vsyncHint.rawValue)
     * ```
     */
    public struct Flags: OptionSet {
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        /// Set to try enabling VSync on GPU
        /// Replaces: FLAG_VSYNC_HINT
        public static var vsyncHint: Flags { Flags(rawValue: 0x0000_0040) }
        
        /// Set to run program in fullscreen
        /// Replaces: FLAG_FULLSCREEN_MODE
        public static var fullscreenMode: Flags { Flags(rawValue: 0x0000_0002) }
        
        /// Set to allow resizable window
        /// Replaces: FLAG_WINDOW_RESIZABLE
        public static var windowResizable: Flags { Flags(rawValue: 0x0000_0004) }
        
        /// Set to disable window decoration (frame and buttons)
        /// Replaces: FLAG_WINDOW_UNDECORATED
        public static var windowUndecorated: Flags { Flags(rawValue: 0x0000_0008) }
        
        /// Set to hide window
        /// Replaces: FLAG_WINDOW_HIDDEN
        public static var windowHidden: Flags { Flags(rawValue: 0x0000_0080) }
        
        /// Set to minimize window (iconify)
        /// Replaces: FLAG_WINDOW_MINIMIZED
        public static var windowMinimized: Flags { Flags(rawValue: 0x0000_0200) }
        
        /// Set to maximize window (expanded to monitor)
        /// Replaces: FLAG_WINDOW_MAXIMIZED
        public static var windowMaximized: Flags { Flags(rawValue: 0x0000_0400) }
        
        /// Set to window non focused
        /// Replaces: FLAG_WINDOW_UNFOCUSED
        public static var windowUnfocused: Flags { Flags(rawValue: 0x0000_0800) }
        
        /// Set to window always on top
        /// Replaces: FLAG_WINDOW_TOPMOST
        public static var windowTopmost: Flags { Flags(rawValue: 0x0000_1000) }
        
        /// Set to allow windows running while minimized
        /// Replaces: FLAG_WINDOW_ALWAYS_RUN
        public static var windowAlwaysRun: Flags { Flags(rawValue: 0x0000_0100) }
        
        /// Set to allow transparent framebuffer
        /// Replaces: FLAG_WINDOW_TRANSPARENT
        public static var windowTransparent: Flags { Flags(rawValue: 0x0000_0010) }
        
        /// Set to support HighDPI
        /// Replaces: FLAG_WINDOW_HIGHDPI
        public static var windowHighDpi: Flags { Flags(rawValue: 0x0000_2000) }
        
        /// Set to support mouse passthrough, only supported when windowUndecorated
        /// Replaces: FLAG_WINDOW_MOUSE_PASSTHROUGH
        public static var windowMousePassthrough: Flags { Flags(rawValue: 0x0000_4000) }
        
        /// Set to run program in borderless windowed mode
        /// Replaces: FLAG_BORDERLESS_WINDOWED_MODE
        public static var borderlessWindowedMode: Flags { Flags(rawValue: 0x0000_8000) }
        
        /// Set to try enabling MSAA 4X
        /// Replaces: FLAG_MSAA_4X_HINT
        public static var msaa4xHint: Flags { Flags(rawValue: 0x0000_0020) }
        
        /// Set to try enabling interlaced video format (for V3D)
        /// Replaces: FLAG_INTERLACED_HINT
        public static var interlacedHint: Flags { Flags(rawValue: 0x0001_0000) }
    }
}