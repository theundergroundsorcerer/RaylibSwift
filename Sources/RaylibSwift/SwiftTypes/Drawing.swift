import CRaylib

/// Drawing functionality
///
/// This namespace provides Swift wrappers for Raylib's drawing functions,
/// including state management for various rendering modes and drawing contexts.
///
/// Example usage:
/// ```swift
/// // Basic drawing loop
/// Drawing.begin()
/// Drawing.clearBackground(.white)
/// // Draw your content here
/// Drawing.end()
///
/// // Using camera
/// Drawing.beginMode2D(camera)
/// // Draw 2D world elements
/// Drawing.endMode2D()
/// ```
public enum Drawing {
    /**
     * Set background color (framebuffer clear color)
     *
     * - Parameter color: Color to clear background with
     */
    @inlinable
    public static func clearBackground(_ color: Color) {
        CRaylib.ClearBackground(color)
    }

    /**
     * Setup canvas (framebuffer) to start drawing
     */
    @inlinable
    public static func begin() {
        CRaylib.BeginDrawing()
    }

    /**
     * End canvas drawing and swap buffers (double buffering)
     */
    @inlinable
    public static func end() {
        CRaylib.EndDrawing()
    }

    /**
     * Begin 2D mode with custom camera (2D)
     *
     * - Parameter camera: 2D camera to use
     */
    @inlinable
    public static func beginMode2D(_ camera: Camera2D) {
        CRaylib.BeginMode2D(camera)
    }

    /**
     * Ends 2D mode with custom camera
     */
    @inlinable
    public static func endMode2D() {
        CRaylib.EndMode2D()
    }

    /**
     * Begin 3D mode with custom camera (3D)
     *
     * - Parameter camera: 3D camera to use
     */
    @inlinable
    public static func beginMode3D(_ camera: Camera3D) {
        CRaylib.BeginMode3D(camera)
    }

    /**
     * Ends 3D mode and returns to default 2D orthographic mode
     */
    @inlinable
    public static func endMode3D() {
        CRaylib.EndMode3D()
    }

    /**
     * Begin drawing to render texture
     *
     * - Parameter target: Render texture target
     */
    @inlinable
    public static func beginTextureMode(_ target: RenderTexture2D) {
        CRaylib.BeginTextureMode(target)
    }

    /**
     * Ends drawing to render texture
     */
    @inlinable
    public static func endTextureMode() {
        CRaylib.EndTextureMode()
    }

    /**
     * Begin custom shader drawing
     *
     * - Parameter shader: Shader to use
     */
    @inline(__always)
    public static func beginShaderMode(_ shader: borrowing Shader) {
        CRaylib.BeginShaderMode(shader.cShader)
    }

    /**
     * End custom shader drawing (use default shader)
     */
    @inlinable
    public static func endShaderMode() {
        CRaylib.EndShaderMode()
    }

    /**
     * Begin blending mode (alpha, additive, multiplied, subtract, custom)
     *
     * - Parameter mode: Blend mode to use
     */
    @inlinable
    public static func beginBlendMode(_ mode: Int32) {
        CRaylib.BeginBlendMode(mode)
    }

    /**
     * End blending mode (reset to default: alpha blending)
     */
    @inlinable
    public static func endBlendMode() {
        CRaylib.EndBlendMode()
    }

    /**
     * Begin scissor mode (define screen area for following drawing)
     *
     * - Parameters:
     *   - x: X position of scissor area
     *   - y: Y position of scissor area
     *   - width: Width of scissor area
     *   - height: Height of scissor area
     */
    @inlinable
    public static func beginScissorMode(_ x: Int32, _ y: Int32, _ width: Int32, _ height: Int32) {
        CRaylib.BeginScissorMode(x, y, width, height)
    }

    /**
     * End scissor mode
     */
    @inlinable
    public static func endScissorMode() {
        CRaylib.EndScissorMode()
    }

    /**
     * Begin stereo rendering (requires VR simulator)
     *
     * - Parameter config: VR stereo configuration
     */
    @inlinable
    public static func beginVrStereoMode(_ config: VrStereoConfig) {
        CRaylib.BeginVrStereoMode(config)
    }

    /**
     * End stereo rendering (requires VR simulator)
     */
    @inlinable
    public static func endVrStereoMode() {
        CRaylib.EndVrStereoMode()
    }

    /**
     * Load VR stereo configuration for VR simulator device parameters
     *
     * - Parameter device: VR device information
     * - Returns: VR stereo configuration
     */
    @inlinable
    public static func loadVrStereoConfig(_ device: VrDeviceInfo) -> VrStereoConfig {
        CRaylib.LoadVrStereoConfig(device)
    }

    /**
     * Unload VR stereo configuration
     *
     * - Parameter config: VR configuration to unload
     */
    @inlinable
    public static func unloadVrStereoConfig(_ config: VrStereoConfig) {
        CRaylib.UnloadVrStereoConfig(config)
    }

    // Text Drawing functions

    /// Draw current FPS
    @inlinable
    public static func drawFPS(_ posX: Int32, posY: Int32) {
        CRaylib.DrawFPS(posX, posY)
    }

    /// Draw text (using default font)
    @inlinable
    public static func drawText(
        _ text: String, _ posX: Int32, _ posY: Int32, _ fontSize: Int32, _ color: Color
    ) {
        text.withCString { cText in
            CRaylib.DrawText(cText, posX, posY, fontSize, color)
        }
    }
}
