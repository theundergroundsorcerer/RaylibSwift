import CRaylib

/// Drawing functions for textures
extension Draw {
    // MARK: - Basic texture drawing

    /// Draw a texture
    @inlinable
    public static func texture(
        _ texture: Texture2D,
        at position: (x: Int32, y: Int32),
        color: Color
    ) {
        CRaylib.DrawTexture(texture.cTexture, position.x, position.y, color)
    }
    
    /// Draw a texture with position defined as Vector2
    @inlinable
    public static func texture(
        _ texture: Texture2D,
        at position: Vector2,
        color: Color
    ) {
        CRaylib.DrawTextureV(texture.cTexture, position, color)
    }
    
    /// Draw a texture with extended parameters
    @inlinable
    public static func texture(
        _ texture: Texture2D,
        at position: Vector2,
        rotation: Float,
        scale: Float,
        color: Color
    ) {
        CRaylib.DrawTextureEx(texture.cTexture, position, rotation, scale, color)
    }
    
    // MARK: - Texture regions and transformations
    
    /// Draw a part of a texture defined by a rectangle
    @inlinable
    public static func textureRegion(
        _ texture: Texture2D,
        source: Rectangle,
        at position: Vector2,
        color: Color
    ) {
        CRaylib.DrawTextureRec(texture.cTexture, source, position, color)
    }
    
    /// Draw a part of a texture defined by a rectangle with advanced parameters
    @inlinable
    public static func textureRegion(
        _ texture: Texture2D,
        source: Rectangle,
        destination: Rectangle,
        origin: Vector2,
        rotation: Float,
        color: Color
    ) {
        CRaylib.DrawTexturePro(texture.cTexture, source, destination, origin, rotation, color)
    }
    
    /// Draw a texture (or part of it) that stretches or shrinks nicely
    @inlinable
    public static func textureNPatch(
        _ texture: Texture2D,
        nPatchInfo: NPatchInfo,
        destination: Rectangle,
        origin: Vector2,
        rotation: Float,
        color: Color
    ) {
        CRaylib.DrawTextureNPatch(texture.cTexture, nPatchInfo, destination, origin, rotation, color)
    }
}