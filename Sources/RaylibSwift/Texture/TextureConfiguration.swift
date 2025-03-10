import CRaylib

/// Texture configuration functions
extension Texture {
    /// Set texture scaling filter mode
    @inlinable
    public static func setFilter(for texture: Texture2D, using filter: Filter) {
        CRaylib.SetTextureFilter(texture.cTexture, filter.rawValue)
    }
    
    /// Set texture wrapping mode
    @inlinable
    public static func setWrapMode(for texture: Texture2D, using wrap: Wrap) {
        CRaylib.SetTextureWrap(texture.cTexture, wrap.rawValue)
    }
}