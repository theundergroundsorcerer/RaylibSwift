import CRaylib

/**
 * Window management functionality
 *
 * This namespace provides Swift-friendly access to Raylib's window management functions,
 * with properties for state queries and methods for operations that change window state.
 *
 * Example usage:
 * ```swift
 * // Initialize a window
 * Window.initialize(800, 600, "My Raylib App")
 *
 * // Game loop
 * while !Window.shouldClose {
 *     // Game logic and drawing
 * }
 *
 * // Clean up
 * Window.close()
 * ```
 */
public enum Window {
    

    /**
     * Initialize window and OpenGL context
     *
     * - Parameters:
     *   - width: Width of the window
     *   - height: Height of the window
     *   - title: Title of the window
     */
    @inlinable
    public static func initialize(_ width: Int32, _ height: Int32, _ title: String) {
        title.withCString { cString in
            CRaylib.InitWindow(width, height, cString)
        }
    }
    
    /// Close window and unload OpenGL context
    @inlinable
    public static func close() {
        CRaylib.CloseWindow()
    }

    /// Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
    @inlinable
    public static var shouldClose: Bool {
        CRaylib.WindowShouldClose()
    }

    /// Check if window has been initialized successfully
    @inlinable
    public static var isReady: Bool {
        CRaylib.IsWindowReady()
    }

    /// Check if window is currently fullscreen
    @inlinable
    public static var isFullscreen: Bool {
        CRaylib.IsWindowFullscreen()
    }

    /// Check if window is currently hidden
    @inlinable
    public static var isHidden: Bool {
        CRaylib.IsWindowHidden()
    }

    /// Check if window is currently minimized
    @inlinable
    public static var isMinimized: Bool {
        CRaylib.IsWindowMinimized()
    }

    /// Check if window is currently maximized
    @inlinable
    public static var isMaximized: Bool {
        CRaylib.IsWindowMaximized()
    }

    /// Check if window is currently focused
    @inlinable
    public static var isFocused: Bool {
        CRaylib.IsWindowFocused()
    }

    /// Check if window has been resized last frame
    @inlinable
    public static var isResized: Bool {
        CRaylib.IsWindowResized()
    }

    /**
     * Check if one specific window flag is enabled
     *
     * - Parameter flag: Flag to check
     * - Returns: True if the flag is enabled
     */
    @inlinable
    public static func isState(_ flag: Utils.ConfigFlags) -> Bool {
        CRaylib.IsWindowState(flag.rawValue)
    }

    /**
     * Set window configuration state using flags
     *
     * - Parameter flags: Configuration flags to set
     */
    @inlinable
    public static func setState(_ flags: Utils.ConfigFlags) {
        CRaylib.SetWindowState(flags.rawValue)
    }

    /**
     * Clear window configuration state flags
     *
     * - Parameter flags: Configuration flags to clear
     */
    @inlinable
    public static func clearState(_ flags: Utils.ConfigFlags) {
        CRaylib.ClearWindowState(flags.rawValue)
    }

    /// Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
    @inlinable
    public static func toggleFullScreen() {
        CRaylib.ToggleFullscreen()
    }

    /// Toggle window state: borderless windowed, resizes window to match monitor resolution
    @inlinable
    public static func toggleBorderlessWindowed() {
        CRaylib.ToggleBorderlessWindowed()
    }

    /// Set window state: maximized, if resizable
    @inlinable
    public static func maximize() {
        CRaylib.MaximizeWindow()
    }

    /// Set window state: minimized, if resizable
    @inlinable
    public static func minimize() {
        CRaylib.MinimizeWindow()
    }

    /// Set window state: not minimized/maximized
    @inlinable
    public static func restore() {
        CRaylib.RestoreWindow()
    }

    /**
     * Set icon for window (single image, RGBA 32bit)
     *
     * - Parameter image: Image to use as icon
     */
    @inlinable
    public static func setIcon(_ image: Image) {
        CRaylib.SetWindowIcon(image)
    }

    /**
     * Set icon for window (multiple images, RGBA 32bit)
     *
     * - Parameter images: Array of images to use as icons
     */
    @inlinable
    public static func setIcons(_ images: inout [Image]) {
        guard !images.isEmpty else { return }

        let count: Int32 = Int32(images.count)
        images.withUnsafeMutableBufferPointer { buffer in 
            guard let baseAddress = buffer.baseAddress else { return }
            CRaylib.SetWindowIcons(baseAddress, count)
        }
    }

    /**
     * Set title for window
     *
     * - Parameter title: New window title
     */
    @inlinable 
    public static func setTitle(_ title: String) {
        title.withCString { cString in
            CRaylib.SetWindowTitle(cString)
        }
    }

    /**
     * Set window position on screen
     *
     * - Parameters:
     *   - x: X position
     *   - y: Y position
     */
    @inlinable
    public static func setPosition(_ x: Int32, _ y: Int32) {
        CRaylib.SetWindowPosition(x, y)
    }

    /**
     * Set monitor for the current window
     *
     * - Parameter monitor: Monitor index
     */
    @inlinable
    public static func setMonitor(_ monitor: Int32) {
        CRaylib.SetWindowMonitor(monitor)
    }

    /**
     * Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
     *
     * - Parameters:
     *   - width: Minimum width
     *   - height: Minimum height
     */
    @inlinable
    public static func setMinSize(_ width: Int32, _ height: Int32) {
        CRaylib.SetWindowMinSize(width, height)
    }

    /**
     * Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
     *
     * - Parameters:
     *   - width: Maximum width
     *   - height: Maximum height
     */
    @inlinable
    public static func setMaxSize(_ width: Int32, _ height: Int32) {
        CRaylib.SetWindowMaxSize(width, height)
    }

    /**
     * Set window dimensions
     *
     * - Parameters:
     *   - width: New width
     *   - height: New height
     */
    @inlinable
    public static func setSize(_ width: Int32, _ height: Int32) {
        CRaylib.SetWindowSize(width, height)
    }

    /**
     * Set window opacity [0.0f..1.0f]
     *
     * - Parameter opacity: Opacity value between 0.0 and 1.0
     */
    @inlinable
    public static func setOpacity(_ opacity: Float) {
        CRaylib.SetWindowOpacity(opacity)
    }

    /// Set window focused
    @inlinable
    public static func setFocused() {
        CRaylib.SetWindowFocused()
    }

    /// Get native window handle
    @inlinable
    public static var handle: UnsafeMutableRawPointer {
        CRaylib.GetWindowHandle()
    }

    /// Get current screen width
    @inlinable
    public static var screenWidth: Int32 {
        CRaylib.GetScreenWidth()
    }

    /// Get current screen height
    @inlinable
    public static var screenHeight: Int32 {
        CRaylib.GetScreenHeight()
    }

    /// Get current render width (useful for high DPI screens when drawing to texture)
    @inlinable
    public static var renderWidth: Int32 {
        CRaylib.GetRenderWidth()
    }

    /// Get current render height (useful for high DPI screens when drawing to texture)
    @inlinable
    public static var renderHeight: Int32 {
        CRaylib.GetRenderHeight()
    }

    /// Get number of connected monitors
    @inlinable
    public static var monitorCount: Int32 {
        CRaylib.GetMonitorCount()
    }

    /// Get current monitor where window is placed
    @inlinable 
    public static var currentMonitor: Int32 {
        CRaylib.GetCurrentMonitor()
    }

    /**
     * Get specified monitor position
     *
     * - Parameter monitor: Monitor index
     * - Returns: Position as Vector2
     */
    @inlinable
    public static func monitorPosition(_ monitor: Int32) -> Vector2 {
        CRaylib.GetMonitorPosition(monitor)
    }

    /**
     * Get specified monitor width (current video mode used by monitor)
     *
     * - Parameter monitor: Monitor index
     * - Returns: Width in pixels
     */
    @inlinable
    public static func monitorWidth(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorWidth(monitor)
    }

    /**
     * Get specified monitor height (current video mode used by monitor)
     *
     * - Parameter monitor: Monitor index
     * - Returns: Height in pixels
     */
    @inlinable
    public static func monitorHeight(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorHeight(monitor)
    }

    /**
     * Get specified monitor physical width in millimetres
     *
     * - Parameter monitor: Monitor index
     * - Returns: Physical width in millimetres
     */
    @inlinable
    public static func monitorPhysicalWidth(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorPhysicalWidth(monitor)
    }

    /**
     * Get specified monitor physical height in millimetres
     *
     * - Parameter monitor: Monitor index
     * - Returns: Physical height in millimetres
     */
    @inlinable
    public static func monitorPhysicalHeight(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorPhysicalHeight(monitor)
    }

    /**
     * Get specified monitor refresh rate
     *
     * - Parameter monitor: Monitor index
     * - Returns: Refresh rate in Hz
     */
    @inlinable
    public static func monitorRefreshRate(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorRefreshRate(monitor)
    }

    /// Get window position XY on monitor
    @inlinable
    public static var position: Vector2 {
        CRaylib.GetWindowPosition()
    }

    /// Get window scale DPI factor
    @inlinable
    public static var scaleDPI: Vector2 {
        CRaylib.GetWindowScaleDPI()
    }

    /**
     * Get the human-readable, UTF-8 encoded name of the specified monitor
     *
     * - Parameter monitor: Monitor index
     * - Returns: Monitor name as string
     */
    @inlinable 
    public static func monitorName(_ monitor: Int32) -> String {
        String(cString: CRaylib.GetMonitorName(monitor))
    }

    /// Get/set clipboard text content
    @inlinable 
    public static var clipboardText: String {
        get {
            String(cString: CRaylib.GetClipboardText())
        }
        set {
            newValue.withCString { cString in
                CRaylib.SetClipboardText(cString)
            }
        }
    }

    /// Get clipboard image content
    @inlinable 
    public static var clipboardImage: Image {
        CRaylib.GetClipboardImage()
    }

    /// Enable waiting for events on EndDrawing(), no automatic event polling
    @inlinable
    public static func enableEventWaiting() {
        CRaylib.EnableEventWaiting()
    }

    /// Disable waiting for events on EndDrawing(), automatic events polling
    @inlinable 
    public static func disableEventWaiting() {
        CRaylib.DisableEventWaiting()
    }
}