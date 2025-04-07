import CRaylib

/// Window management functionality
///
/// This namespace provides Swift-friendly access to Raylib's window management functions,
/// with properties for state queries and methods for operations that change window state.
///
/// Example usage:
/// ```swift
/// // Initialize a window
/// Window.initialize(800, 600, "My Raylib App")
///
/// // Game loop
/// while !Window.shouldClose {
///     // Game logic and drawing
/// }
///
/// // Clean up
/// Window.close()
/// ```
public enum Window {
    /// Initialize window and OpenGL context
    /// Maps to: InitWindow
    @inlinable
    public static func initialize(width: Int32, height: Int32, title: String) {
        CRaylib.InitWindow(width, height, title)

    }

    /// Run game loop in the window
    @inlinable
    public static func loop(initialTargetFps: Int32, _ body: () -> Void) {
        Time.setFps(initialTargetFps)
        while !shouldClose {
            body()
        }
        close()
    }

    /// Close window and unload OpenGL context
    /// Maps to: CloseWindow
    @inlinable
    public static func close() {
        CRaylib.CloseWindow()
    }

    /// Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
    /// Maps to: WindowShouldClose
    @inlinable
    public static var shouldClose: Bool {
        CRaylib.WindowShouldClose()
    }

    /// Check if window has been initialized successfully
    /// Maps to: IsWindowReady
    @inlinable
    public static var isReady: Bool {
        CRaylib.IsWindowReady()
    }

    /// Check if window is currently fullscreen
    /// Maps to: IsWindowFullscreen
    @inlinable
    public static var isFullscreen: Bool {
        CRaylib.IsWindowFullscreen()
    }

    /// Check if window is currently hidden
    /// Maps to: IsWindowHidden
    @inlinable
    public static var isHidden: Bool {
        CRaylib.IsWindowHidden()
    }

    /// Check if window is currently minimized
    /// Maps to: IsWindowMinimized
    @inlinable
    public static var isMinimized: Bool {
        CRaylib.IsWindowMinimized()
    }

    /// Check if window is currently maximized
    /// Maps to: IsWindowMaximized
    @inlinable
    public static var isMaximized: Bool {
        CRaylib.IsWindowMaximized()
    }

    /// Check if window is currently focused
    /// Maps to: IsWindowFocused
    @inlinable
    public static var isFocused: Bool {
        CRaylib.IsWindowFocused()
    }

    /// Check if window has been resized last frame
    /// Maps to: IsWindowResized
    @inlinable
    public static var isResized: Bool {
        CRaylib.IsWindowResized()
    }

    /// Check if one specific window flag is enabled
    /// Maps to: IsWindowState
    @inlinable
    public static func isStateEnabled(flag: Utils.ConfigFlags) -> Bool {
        CRaylib.IsWindowState(flag.rawValue)
    }

    /// Set window configuration state using flags
    /// Maps to: SetWindowState
    @inlinable
    public static func setState(flags: Utils.ConfigFlags) {
        CRaylib.SetWindowState(flags.rawValue)
    }

    /// Clear window configuration state flags
    /// Maps to: ClearWindowState
    @inlinable
    public static func clearState(flags: Utils.ConfigFlags) {
        CRaylib.ClearWindowState(flags.rawValue)
    }

    /// Toggle window state: fullscreen/windowed
    /// Maps to: ToggleFullscreen
    @inlinable
    public static func toggleFullscreen() {
        CRaylib.ToggleFullscreen()
    }

    /// Toggle window state: borderless windowed
    /// Maps to: ToggleBorderlessWindowed
    @inlinable
    public static func toggleBorderlessWindowed() {
        CRaylib.ToggleBorderlessWindowed()
    }

    /// Set window state: maximized, if resizable
    /// Maps to: MaximizeWindow
    @inlinable
    public static func maximize() {
        CRaylib.MaximizeWindow()
    }

    /// Set window state: minimized, if resizable
    /// Maps to: MinimizeWindow
    @inlinable
    public static func minimize() {
        CRaylib.MinimizeWindow()
    }

    /// Set window state: not minimized/maximized
    /// Maps to: RestoreWindow
    @inlinable
    public static func restore() {
        CRaylib.RestoreWindow()
    }

    /// Set icon for window (single image, RGBA 32bit)
    /// Maps to: SetWindowIcon
    @inlinable
    public static func setIcon(_ image: Image) {
        CRaylib.SetWindowIcon(image)
    }

    /// Set icon for window (multiple images, RGBA 32bit)
    /// Maps to: SetWindowIcons
    @inlinable
    public static func setIcons(_ images: inout [Image]) {
        guard !images.isEmpty else { return }

        let count: Int32 = I(images.count)
        images.withUnsafeMutableBufferPointer { buffer in
            guard let baseAddress = buffer.baseAddress else { return }
            CRaylib.SetWindowIcons(baseAddress, count)
        }
    }

    /// Set title for window
    /// Maps to: SetWindowTitle
    @inlinable
    public static func setTitle(_ title: String) {
        CRaylib.SetWindowTitle(title)
    }

    /// Set window position on screen
    /// Maps to: SetWindowPosition
    @inlinable
    public static func setPosition(x: Int32, y: Int32) {
        CRaylib.SetWindowPosition(x, y)
    }

    /// Set monitor for the current window
    /// Maps to: SetWindowMonitor
    @inlinable
    public static func setMonitor(withIndex index: Int32) {
        CRaylib.SetWindowMonitor(index)
    }

    /// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
    /// Maps to: SetWindowMinSize
    @inlinable
    public static func setMinSize(width: Int32, height: Int32) {
        CRaylib.SetWindowMinSize(width, height)
    }

    /// Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
    /// Maps to: SetWindowMaxSize
    @inlinable
    public static func setMaxSize(width: Int32, height: Int32) {
        CRaylib.SetWindowMaxSize(width, height)
    }

    /// Set window dimensions
    /// Maps to: SetWindowSize
    @inlinable
    public static func setSize(width: Int32, height: Int32) {
        CRaylib.SetWindowSize(width, height)
    }

    /// Set window opacity [0.0f..1.0f]
    /// Maps to: SetWindowOpacity
    @inlinable
    public static func setOpacity(_ opacity: Float) {
        CRaylib.SetWindowOpacity(opacity)
    }

    /// Set window focused
    /// Maps to: SetWindowFocused
    @inlinable
    public static func setFocused() {
        CRaylib.SetWindowFocused()
    }

    /// Get native window handle
    /// Maps to: GetWindowHandle
    @inlinable
    public static var handle: UnsafeMutableRawPointer {
        CRaylib.GetWindowHandle()
    }

    /// Get current screen width
    /// Maps to: GetScreenWidth
    @inlinable
    public static var screenWidth: Int32 {
        CRaylib.GetScreenWidth()
    }

    /// Get current screen height
    /// Maps to: GetScreenHeight
    @inlinable
    public static var screenHeight: Int32 {
        CRaylib.GetScreenHeight()
    }

    /// Get current render width
    /// Maps to: GetRenderWidth
    @inlinable
    public static var renderWidth: Int32 {
        CRaylib.GetRenderWidth()
    }

    /// Get current render height
    /// Maps to: GetRenderHeight
    @inlinable
    public static var renderHeight: Int32 {
        CRaylib.GetRenderHeight()
    }

    /// Get number of connected monitors
    /// Maps to: GetMonitorCount
    @inlinable
    public static var monitorCount: Int32 {
        CRaylib.GetMonitorCount()
    }

    /// Get current monitor
    /// Maps to: GetCurrentMonitor
    @inlinable
    public static var currentMonitor: Int32 {
        CRaylib.GetCurrentMonitor()
    }

    /// Get specified monitor position
    /// Maps to: GetMonitorPosition
    @inlinable
    public static func monitorPosition(withIndex index: Int32) -> Vector2 {
        CRaylib.GetMonitorPosition(index)
    }

    /// Get specified monitor width
    /// Maps to: GetMonitorWidth
    @inlinable
    public static func monitorWidth(withIndex index: Int32) -> Int32 {
        CRaylib.GetMonitorWidth(index)
    }

    /// Get specified monitor height
    /// Maps to: GetMonitorHeight
    @inlinable
    public static func monitorHeight(withIndex index: Int32) -> Int32 {
        CRaylib.GetMonitorHeight(index)
    }

    /// Get specified monitor physical width in millimetres
    /// Maps to: GetMonitorPhysicalWidth
    @inlinable
    public static func monitorPhysicalWidth(withIndex index: Int32) -> Int32 {
        CRaylib.GetMonitorPhysicalWidth(index)
    }

    /// Get specified monitor physical height in millimetres
    /// Maps to: GetMonitorPhysicalHeight
    @inlinable
    public static func monitorPhysicalHeight(withIndex index: Int32) -> Int32 {
        CRaylib.GetMonitorPhysicalHeight(index)
    }

    /// Get specified monitor refresh rate
    /// Maps to: GetMonitorRefreshRate
    @inlinable
    public static func monitorRefreshRate(withIndex index: Int32) -> Int32 {
        CRaylib.GetMonitorRefreshRate(index)
    }

    /// Get window position XY on monitor
    /// Maps to: GetWindowPosition
    @inlinable
    public static var position: Vector2 {
        CRaylib.GetWindowPosition()
    }

    /// Get window scale DPI factor
    /// Maps to: GetWindowScaleDPI
    @inlinable
    public static var scaleDPI: Vector2 {
        CRaylib.GetWindowScaleDPI()
    }

    /// Get the human-readable, UTF-8 encoded name of the specified monitor
    /// Maps to: GetMonitorName
    @inlinable
    public static func monitorName(withIndex index: Int32) -> String {
        String(cString: CRaylib.GetMonitorName(index))
    }

    /// Get/set clipboard text content
    /// Maps to: GetClipboardText/SetClipboardText
    @inlinable
    public static var clipboardText: String {
        get {
            String(cString: CRaylib.GetClipboardText())
        }
        set {
            CRaylib.SetClipboardText(newValue)
        }
    }

    /// Get clipboard image content
    /// Maps to: GetClipboardImage
    @inlinable
    public static var clipboardImage: Image {
        CRaylib.GetClipboardImage()
    }

    /// Enable waiting for events on EndDrawing()
    /// Maps to: EnableEventWaiting
    @inlinable
    public static func enableEventWaiting() {
        CRaylib.EnableEventWaiting()
    }

    /// Disable waiting for events on EndDrawing()
    /// Maps to: DisableEventWaiting
    @inlinable
    public static func disableEventWaiting() {
        CRaylib.DisableEventWaiting()
    }
}
