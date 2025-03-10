import CRaylib

/**
 * Swift-friendly extensions for Raylib's Texture type
 *
 * These extensions provide type-safe Swift enums for texture settings
 * like filtering, wrapping modes, and cubemap layouts.
 */
extension Texture {
    /**
     * Texture filter modes
     *
     * These filters determine how textures are sampled when rendered
     * at different sizes than their original dimensions.
     */
    public enum Filter: Int32 {
        /// No filter, just pixel approximation
        case point = 0
        
        /// Linear filtering
        case bilinear = 1
        
        /// Trilinear filtering (linear with mipmaps)
        case trilinear = 2
        
        /// Anisotropic filtering 4x
        case anisotropic4x = 3
        
        /// Anisotropic filtering 8x
        case anisotropic8x = 4
        
        /// Anisotropic filtering 16x
        case anisotropic16x = 5
    }
    
    /**
     * Texture wrap modes
     *
     * These modes determine how texture coordinates outside the [0, 1] range are handled.
     */
    public enum Wrap: Int32 {
        /// Repeats texture in tiled mode
        case repeatWrap = 0
        
        /// Clamps texture to edge pixel in tiled mode
        case clamp = 1
        
        /// Mirrors and repeats the texture in tiled mode
        case mirrorRepeat = 2
        
        /// Mirrors and clamps to border the texture in tiled mode
        case mirrorClamp = 3
    }

    /**
     * Cubemap layout configurations
     *
     * These layouts define how the cubemap faces are arranged in the source image.
     */
    public enum CubemapLayout: Int32 {
        /// Automatically detect layout type
        case autoDetect = 0
        
        /// Layout is defined by a vertical line with faces
        case lineVertical = 1
        
        /// Layout is defined by a horizontal line with faces
        case lineHorizontal = 2
        
        /// Layout is defined by a 3x4 cross with cubemap faces
        case crossThreeByFour = 3
        
        /// Layout is defined by a 4x3 cross with cubemap faces
        case crossFourByThree = 4
        
        /// Layout is defined by a panorama image (equirectangular map)
        case panorama = 5
    }
}