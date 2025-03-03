import CRaylib

public enum Window {
    @inlinable
    public static func initialize(_ width: Int32, _ height: Int32, _ title: String) {
        title.withCString { cString in
            CRaylib.InitWindow(width, height, cString)
        }
    }
    
    @inlinable
    public static func close() {
        CRaylib.CloseWindow()
    }

    @inlinable
    public static var shouldClose: Bool {
        CRaylib.WindowShouldClose()
    }

    @inlinable
    public static var isReady: Bool {
        CRaylib.IsWindowReady()
    }

    @inlinable
    public static var isFullscreen: Bool {
        CRaylib.IsWindowFullscreen()
    }

    @inlinable
    public static var isHidden: Bool {
        CRaylib.IsWindowHidden()
    }

    @inlinable
    public static var isMinimized: Bool {
        CRaylib.IsWindowMinimized()
    }

    @inlinable
    public static var isMaximized: Bool {
        CRaylib.IsWindowMaximized()
    }

    @inlinable
    public static var isFocused: Bool {
        CRaylib.IsWindowFocused()
    }

    @inlinable
    public static var isResized: Bool {
        CRaylib.IsWindowResized()
    }

    @inlinable
    public static func isState(_ flag: System.Flags) -> Bool {
        CRaylib.IsWindowState(flag.rawValue)
    }

    @inlinable
    public static func setState(_ flags: System.Flags) {
        CRaylib.SetWindowState(flags.rawValue)
    }

    @inlinable
    public static func clearState(_ flags: System.Flags) {
        CRaylib.ClearWindowState(flags.rawValue)
    }

    @inlinable
    public static func toggleFullScreen() {
        CRaylib.ToggleFullscreen()
    }

    @inlinable
    public static func toggleBorderlessWindowed() {
        CRaylib.ToggleBorderlessWindowed()
    }

    @inlinable
    public static func maximize() {
        CRaylib.MaximizeWindow()
    }

    @inlinable
    public static func minimize() {
        CRaylib.MinimizeWindow()
    }

    @inlinable
    public static func restore() {
        CRaylib.RestoreWindow()
    }

    @inlinable
    public static func setIcon(_ image: Image) {
        CRaylib.SetWindowIcon(image)
    }

    @inlinable
    public static func setIcons(_ images: inout [Image]) {
        guard !images.isEmpty else { return }

        let count: Int32 = Int32(images.count)
        images.withUnsafeMutableBufferPointer { buffer in 
            guard let baseAddress = buffer.baseAddress else { return }
            CRaylib.SetWindowIcons(baseAddress, count)
        }
    }

    @inlinable 
    public static func setTitle(_ title: String) {
        title.withCString { cString in
            CRaylib.SetWindowTitle(cString)
        }
    }

    @inlinable
    public static func setPosition(_ x: Int32, _ y: Int32) {
        CRaylib.SetWindowPosition(x, y)
    }

    @inlinable
    public static func setMonitor(_ monitor: Int32) {
        CRaylib.SetWindowMonitor(monitor)
    }

    @inlinable
    public static func setMinSize(_ width: Int32, _ height: Int32) {
        CRaylib.SetWindowMinSize(width, height)
    }

    @inlinable
    public static func setMaxSize(_ width: Int32, _ height: Int32) {
        CRaylib.SetWindowMaxSize(width, height)
    }

    @inlinable
    public static func setSize(_ width: Int32, _ height: Int32) {
        CRaylib.SetWindowSize(width, height)
    }

    @inlinable
    public static func setOpacity(_ opacity: Float) {
        CRaylib.SetWindowOpacity(opacity)
    }

    @inlinable
    public static func setFocused() {
        CRaylib.SetWindowFocused()
    }

    @inlinable
    public static var handle: UnsafeMutableRawPointer {
        CRaylib.GetWindowHandle()
    }

    @inlinable
    public static var screenWidth: Int32 {
        CRaylib.GetScreenWidth()
    }

    @inlinable
    public static var screenHeight: Int32 {
        CRaylib.GetScreenHeight()
    }

    @inlinable
    public static var renderWidth: Int32 {
        CRaylib.GetRenderWidth()
    }

    @inlinable
    public static var renderHeight: Int32 {
        CRaylib.GetRenderHeight()
    }

    @inlinable
    public static var monitorCount: Int32 {
        CRaylib.GetMonitorCount()
    }

    @inlinable 
    public static var currentMonitor: Int32 {
        CRaylib.GetCurrentMonitor()
    }

    @inlinable
    public static func monitorPosition(_ monitor: Int32) -> Vector2 {
        CRaylib.GetMonitorPosition(monitor)
    }

    @inlinable
    public static func monitorWidth(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorWidth(monitor)
    }

    @inlinable
    public static func monitorHeight(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorHeight(monitor)
    }

    @inlinable
    public static func monitorPhysicalWidth(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorPhysicalWidth(monitor)
    }

    @inlinable
    public static func monitorPhysicalHeight(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorPhysicalHeight(monitor)
    }

    @inlinable
    public static func monitorRefreshRate(_ monitor: Int32) -> Int32 {
        CRaylib.GetMonitorRefreshRate(monitor)
    }

    @inlinable
    public static var position: Vector2 {
        CRaylib.GetWindowPosition()
    }

    @inlinable
    public static var scaleDPI: Vector2 {
        CRaylib.GetWindowScaleDPI()
    }

    @inlinable 
    public static func monitorName(_ monitor: Int32) -> String {
        String(cString: CRaylib.GetMonitorName(monitor))
    }

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

    @inlinable 
    public static var clipboardImage: Image {
        CRaylib.GetClipboardImage()
    }

    @inlinable
    public static func enableEventWaiting() {
        CRaylib.EnableEventWaiting()
    }

    @inlinable 
    public static func disableEventWaiting() {
        CRaylib.DisableEventWaiting()
    }

}