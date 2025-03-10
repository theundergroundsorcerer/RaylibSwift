import CRaylib
import Foundation

/// Texture manipulation functions
extension Texture {
    /// Update GPU texture with new data from a Data object
    @inlinable
    public static func update(_ texture: Texture2D, with pixelData: Data) {
        pixelData.withUnsafeBytes { rawBufferPointer in
            CRaylib.UpdateTexture(texture.cTexture, rawBufferPointer.baseAddress)
        }
    }
    
    /// Update GPU texture with new data from a raw pointer (advanced usage)
    @inlinable
    public static func update(_ texture: Texture2D, with pixels: UnsafeRawPointer) {
        CRaylib.UpdateTexture(texture.cTexture, pixels)
    }
    
    /// Update GPU texture rectangle with new data from a Data object
    @inlinable
    public static func update(
        _ texture: Texture2D,
        rectangle: Rectangle,
        with pixelData: Data
    ) {
        pixelData.withUnsafeBytes { rawBufferPointer in
            CRaylib.UpdateTextureRec(texture.cTexture, rectangle, rawBufferPointer.baseAddress)
        }
    }
    
    /// Update GPU texture rectangle with new data from a raw pointer (advanced usage)
    @inlinable
    public static func update(
        _ texture: Texture2D,
        rectangle: Rectangle,
        with pixels: UnsafeRawPointer
    ) {
        CRaylib.UpdateTextureRec(texture.cTexture, rectangle, pixels)
    }
    
    /// Generate GPU mipmaps for a texture
    @inlinable
    public static func generateMipmaps(for texture: inout Texture2D) {
        CRaylib.GenTextureMipmaps(&texture.cTexture)
    }
}

/// Instance methods for texture manipulation
extension Texture {
    /// Update this texture with new data from a Data object
    @inlinable
    public func update(with pixelData: Data) {
        Texture.update(self, with: pixelData)
    }
    
    /// Update this texture with new data from a raw pointer (advanced usage)
    @inlinable
    public func update(with pixels: UnsafeRawPointer) {
        Texture.update(self, with: pixels)
    }
    
    /// Update a rectangular portion of this texture with new data from a Data object
    @inlinable
    public func update(rectangle: Rectangle, with pixelData: Data) {
        Texture.update(self, rectangle: rectangle, with: pixelData)
    }
    
    /// Update a rectangular portion of this texture with new data from a raw pointer (advanced usage)
    @inlinable
    public func update(rectangle: Rectangle, with pixels: UnsafeRawPointer) {
        Texture.update(self, rectangle: rectangle, with: pixels)
    }
    
    /// Generate GPU mipmaps for this texture
    @inlinable
    public mutating func generateMipmaps() {
        Texture.generateMipmaps(for: &self)
    }
}