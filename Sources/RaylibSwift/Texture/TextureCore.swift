import CRaylib

/// Namespace for texture management functions
extension Texture {
    /// Load texture from file into GPU memory (VRAM)
    @inlinable
    public static func load(from fileName: String) -> Texture2D {
        fileName.withCString { cString in
            Texture2D(CRaylib.LoadTexture(cString) )
        }
    }
    
    /// Load texture from image data
    @inlinable
    public static func load(from image: Image) -> Texture2D {
        Texture2D(CRaylib.LoadTextureFromImage(image) )
    }
    
    /// Load cubemap from image, multiple image cubemap layouts supported
    @inlinable
    public static func loadCubemap(from image: Image, using layout: CubemapLayout) -> TextureCubemap {
        Texture2D(CRaylib.LoadTextureCubemap(image, layout.rawValue) )
    }
    
    /// Load texture for rendering (framebuffer)
    @inlinable
    public static func loadRenderTexture(width: Int32, height: Int32) -> RenderTexture2D {
        CRaylib.LoadRenderTexture(width, height)
    }
    
    /// Check if a texture is valid (loaded in GPU)
    @inlinable
    public static func isValid(_ texture: Texture2D) -> Bool {
        CRaylib.IsTextureValid(texture.cTexture)
    }
    
    /// Unload texture from GPU memory (VRAM)
    @inlinable
    public static func unload(_ texture: Texture2D) {
        CRaylib.UnloadTexture(texture.cTexture)
    }
    
    /// Check if a render texture is valid (loaded in GPU)
    @inlinable
    public static func isRenderTextureValid(_ target: RenderTexture2D) -> Bool {
        CRaylib.IsRenderTextureValid(target)
    }
    
    /// Unload render texture from GPU memory (VRAM)
    @inlinable
    public static func unloadRenderTexture(_ target: RenderTexture2D) {
        CRaylib.UnloadRenderTexture(target)
    }
}