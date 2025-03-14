import CRaylib

/// Drawing methods for textures
extension Texture {
    // MARK: - Basic drawing methods
    
    /// Draw this texture at the specified position with integer coordinates
    @inlinable
    public func draw(at position: (x: Int32, y: Int32), color: Color) {
        Draw.texture(self, at: position, color: color)
    }
    
    /// Draw this texture at the specified position
    @inlinable
    public func draw(at position: Vector2, color: Color) {
        Draw.texture(self, at: position, color: color)
    }
    
    /// Draw this texture with extended parameters
    @inlinable
    public func draw(at position: Vector2, rotation: Float, scale: Float, color: Color) {
        Draw.texture(self, at: position, rotation: rotation, scale: scale, color: color)
    }
    
    // MARK: - Region drawing methods
    
    /// Draw a part of this texture defined by a rectangle
    @inlinable
    public func drawRegion(source: Rectangle, at position: Vector2, color: Color) {
        Draw.textureRegion(self, source: source, at: position, color: color)
    }
    
    /// Draw a part of this texture defined by a rectangle with advanced parameters
    @inlinable
    public func drawRegion(
        source: Rectangle,
        destination: Rectangle,
        origin: Vector2,
        rotation: Float,
        color: Color
    ) {
        Draw.textureRegion(
            self,
            source: source,
            destination: destination, 
            origin: origin,
            rotation: rotation,
            color: color
        )
    }
    
    // MARK: - NPatch drawing
    
    /// Draw this texture (or part of it) that stretches or shrinks nicely
    @inlinable
    public func drawNPatch(
        nPatchInfo: NPatchInfo,
        destination: Rectangle,
        origin: Vector2,
        rotation: Float,
        color: Color
    ) {
        Draw.textureNPatch(
            self,
            nPatchInfo: nPatchInfo,
            destination: destination,
            origin: origin,
            rotation: rotation,
            color: color
        )
    }
}