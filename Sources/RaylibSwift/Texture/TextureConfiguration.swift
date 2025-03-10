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

extension Texture {
    /// Set texture scaling filter mode for the texture
    @inlinable
    public func setFilter(using filter: Filter) {
        Texture.setFilter(for: self, using: filter)
    }

    /// Set texture wrapping mode for the texture
    @inlinable
    public func setWrapMode(using wrap: Wrap) {
        Texture.setWrapMode(for: self, using: wrap)
    }
}
