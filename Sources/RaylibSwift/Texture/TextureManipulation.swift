import CRaylib
import Foundation

/// Texture manipulation functions
public extension Texture {
    /// Update GPU texture with new data from a Data object
    @inlinable
    static func update(_ texture: Texture2D, with pixelData: Data) {
        pixelData.withUnsafeBytes { rawBufferPointer in
            CRaylib.UpdateTexture(texture, rawBufferPointer.baseAddress)
        }
    }
    
    /// Update GPU texture with new data from a raw pointer (advanced usage)
    @inlinable
    static func update(_ texture: Texture2D, with pixels: UnsafeRawPointer) {
        CRaylib.UpdateTexture(texture, pixels)
    }
    
    /// Update GPU texture rectangle with new data from a Data object
    @inlinable
    static func update(
        _ texture: Texture2D,
        rectangle: Rectangle,
        with pixelData: Data
    ) {
        pixelData.withUnsafeBytes { rawBufferPointer in
            CRaylib.UpdateTextureRec(texture, rectangle, rawBufferPointer.baseAddress)
        }
    }
    
    /// Update GPU texture rectangle with new data from a raw pointer (advanced usage)
    @inlinable
    static func update(
        _ texture: Texture2D,
        rectangle: Rectangle,
        with pixels: UnsafeRawPointer
    ) {
        CRaylib.UpdateTextureRec(texture, rectangle, pixels)
    }
    
    /// Generate GPU mipmaps for a texture
    @inlinable
    static func generateMipmaps(for texture: inout Texture2D) {
        CRaylib.GenTextureMipmaps(&texture)
    }
}