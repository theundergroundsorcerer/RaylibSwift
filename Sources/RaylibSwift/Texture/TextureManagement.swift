import CRaylib

/// Namespace for texture management functions
extension Texture {
    /// Load texture from file into GPU memory (VRAM)
    @inlinable
    public static func load(from fileName: String) -> Texture2D {
        Texture2D(CRaylib.LoadTexture(fileName))
    }

    /// Load texture from image data
    @inlinable
    public static func load(from image: Image) -> Texture2D {
        Texture2D(CRaylib.LoadTextureFromImage(image))
    }

    /// Load cubemap from image, multiple image cubemap layouts supported
    @inlinable
    public static func loadCubemap(from image: Image, using layout: CubemapLayout) -> TextureCubemap
    {
        Texture2D(CRaylib.LoadTextureCubemap(image, layout.rawValue))
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

}

extension Texture {

    /// Check if this texture is valid (loaded in GPU)
    @inlinable
    public var isValid: Bool {
        Texture.isValid(self)
    }

    /// Unload this texture from GPU memory (VRAM)
    @inlinable
    public func unload() {
        Texture.unload(self)
    }

    /// Create a texture initializer from a file
    @inlinable
    public init(fromFile fileName: String) {
        self = Texture.load(from: fileName)
    }

    /// Create a texture initializer from an image
    @inlinable
    public init(fromImage image: Image) {
        self = Texture.load(from: image)
    }
}
