import CRaylib

/// Drawing functionality
public enum Draw {
    /**
     * Color blending modes (pre-defined)
     *
     * These modes determine how source (new) colors blend with
     * destination (existing) colors during rendering.
     */
    public enum BlendMode: Int32 {
        /// Blend textures considering alpha (default)
        case alpha = 0
        
        /// Blend textures adding colors
        case additive = 1
        
        /// Blend textures multiplying colors
        case multiplied = 2
        
        /// Blend textures adding colors (alternative)
        case addColors = 3
        
        /// Blend textures subtracting colors (alternative)
        case subtractColors = 4
        
        /// Blend premultiplied textures considering alpha
        case alphaPremultiply = 5
        
        /// Blend textures using custom src/dst factors (use rlSetBlendFactors())
        case custom = 6
        
        /// Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())
        case customSeparate = 7
    }

    /// Set background color (framebuffer clear color)
    @inlinable
    public static func clear(background color: Color) {
        CRaylib.ClearBackground(color)
    }

    /// Setup canvas (framebuffer) to start drawing
    @inlinable
    public static func begin() {
        CRaylib.BeginDrawing()
    }

    /// End canvas drawing and swap buffers (double buffering)
    @inlinable
    public static func end() {
        CRaylib.EndDrawing()
    }

    /// Draws a frame
    @inlinable
    public static func frame(_ body: () -> Void ) {
        begin()
        body()
        end()
    }
    
    /// Namespace for rendering modes and contexts
    public enum Mode {
        /// Begin 2D mode with custom camera (2D)
        @inlinable
        public static func begin2D(using camera: Camera2D) {
            CRaylib.BeginMode2D(camera)
        }

        /// Ends 2D mode with custom camera
        @inlinable
        public static func end2D() {
            CRaylib.EndMode2D()
        }

        /// Begin 3D mode with custom camera (3D)
        @inlinable
        public static func begin3D(using camera: Camera3D) {
            CRaylib.BeginMode3D(camera)
        }

        /// Ends 3D mode and returns to default 2D orthographic mode
        @inlinable
        public static func end3D() {
            CRaylib.EndMode3D()
        }

        /// Begin drawing to render texture
        @inlinable
        public static func beginTexture(using texture: RenderTexture2D) {
            CRaylib.BeginTextureMode(texture)
        }

        /// Ends drawing to render texture
        @inlinable
        public static func endTexture() {
            CRaylib.EndTextureMode()
        }

        /// Begin custom shader drawing
        public static func beginShader(using shader: borrowing Shader) {
            CRaylib.BeginShaderMode(shader.cShader)
        }

        /// End custom shader drawing (use default shader)
        @inlinable
        public static func endShader() {
            CRaylib.EndShaderMode()
        }

        /// Begin blending mode (alpha, additive, multiplied, subtract, custom)
        @inlinable
        public static func beginBlend(using mode: BlendMode) {
            CRaylib.BeginBlendMode(mode.rawValue)
        }

        /// End blending mode (reset to default: alpha blending)
        @inlinable
        public static func endBlend() {
            CRaylib.EndBlendMode()
        }

        /// Begin scissor mode (define screen area for following drawing)
        @inlinable
        public static func beginScissor(using position: (x: Int32,  y: Int32),  width: Int32, height: Int32) {
            CRaylib.BeginScissorMode(position.x, position.y, width, height)
        }

        /// End scissor mode
        @inlinable
        public static func endScissor() {
            CRaylib.EndScissorMode()
        }

        /// Begin stereo rendering (requires VR simulator)
        @inlinable
        public static func beginVrStereo(using config: VrStereoConfig) {
            CRaylib.BeginVrStereoMode(config)
        }

        /// End stereo rendering (requires VR simulator)
        @inlinable
        public static func endVrStereo() {
            CRaylib.EndVrStereoMode()
        }

        /// Load VR stereo config for VR simulator device parameters
        @inlinable
        public static func loadVrStereo(using device: VrDeviceInfo) -> VrStereoConfig {
            CRaylib.LoadVrStereoConfig(device)
        }

        /// Unload VR stereo config
        @inlinable
        public static func unloadVrStereo(using config: VrStereoConfig) {
            CRaylib.UnloadVrStereoConfig(config)
        }
    }
}

