import CRaylib

/**
 * Swift-friendly extensions for Raylib's Texture type
 *
 * These extensions provide type-safe Swift enums for texture settings
 * like filtering, wrapping modes, and cubemap layouts.
 */
public extension Texture {
    /**
     * Texture filter modes
     *
     * These filters determine how textures are sampled when rendered
     * at different sizes than their original dimensions.
     *
     * Maps to Raylib's C enum: TextureFilter
     * Replaces: TEXTURE_FILTER_POINT, TEXTURE_FILTER_BILINEAR, etc.
     *
     * Note 1: Filtering considers mipmaps if available in the texture
     * Note 2: Filter is applied for both minification and magnification
     *
     * Usage:
     * ```swift
     * // Instead of: SetTextureFilter(texture, TEXTURE_FILTER_BILINEAR)
     * SetTextureFilter(texture, Texture.Filter.bilinear.rawValue)
     * ```
     */
    enum Filter: Int32 {
        /// No filter, just pixel approximation
        /// Replaces: TEXTURE_FILTER_POINT
        case point = 0
        
        /// Linear filtering
        /// Replaces: TEXTURE_FILTER_BILINEAR
        case bilinear = 1
        
        /// Trilinear filtering (linear with mipmaps)
        /// Replaces: TEXTURE_FILTER_TRILINEAR
        case trilinear = 2
        
        /// Anisotropic filtering 4x
        /// Replaces: TEXTURE_FILTER_ANISOTROPIC_4X
        case anisotropic4x = 3
        
        /// Anisotropic filtering 8x
        /// Replaces: TEXTURE_FILTER_ANISOTROPIC_8X
        case anisotropic8x = 4
        
        /// Anisotropic filtering 16x
        /// Replaces: TEXTURE_FILTER_ANISOTROPIC_16X
        case anisotropic16x = 5
    }
    
    /**
     * Texture wrap modes
     *
     * These modes determine how texture coordinates outside the [0, 1] range are handled.
     *
     * Maps to Raylib's C enum: TextureWrap
     * Replaces: TEXTURE_WRAP_REPEAT, TEXTURE_WRAP_CLAMP, etc.
     *
     * Usage:
     * ```swift
     * // Instead of: SetTextureWrap(texture, TEXTURE_WRAP_CLAMP)
     * SetTextureWrap(texture, Texture.Wrap.clamp.rawValue)
     * ```
     */
    enum Wrap: Int32 {
        /// Repeats texture in tiled mode
        /// Replaces: TEXTURE_WRAP_REPEAT
        case repeatWrap = 0
        
        /// Clamps texture to edge pixel in tiled mode
        /// Replaces: TEXTURE_WRAP_CLAMP
        case clamp = 1
        
        /// Mirrors and repeats the texture in tiled mode
        /// Replaces: TEXTURE_WRAP_MIRROR_REPEAT
        case mirrorRepeat = 2
        
        /// Mirrors and clamps to border the texture in tiled mode
        /// Replaces: TEXTURE_WRAP_MIRROR_CLAMP
        case mirrorClamp = 3
    }

    /**
     * Cubemap layout configurations
     *
     * These layouts define how the cubemap faces are arranged in the source image.
     *
     * Maps to Raylib's C enum: CubemapLayout
     * Replaces: CUBEMAP_LAYOUT_AUTO_DETECT, CUBEMAP_LAYOUT_LINE_VERTICAL, etc.
     *
     * Usage:
     * ```swift
     * // Instead of: GenTextureCubemap(shader, map, size, CUBEMAP_LAYOUT_AUTO_DETECT)
     * GenTextureCubemap(shader, map, size, Texture.CubemapLayout.autoDetect.rawValue)
     * ```
     */
    enum CubemapLayout: Int32 {
        /// Automatically detect layout type
        /// Replaces: CUBEMAP_LAYOUT_AUTO_DETECT
        case autoDetect = 0
        
        /// Layout is defined by a vertical line with faces
        /// Replaces: CUBEMAP_LAYOUT_LINE_VERTICAL
        case lineVertical = 1
        
        /// Layout is defined by a horizontal line with faces
        /// Replaces: CUBEMAP_LAYOUT_LINE_HORIZONTAL
        case lineHorizontal = 2
        
        /// Layout is defined by a 3x4 cross with cubemap faces
        /// Replaces: CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR
        case crossThreeByFour = 3
        
        /// Layout is defined by a 4x3 cross with cubemap faces
        /// Replaces: CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE
        case crossFourByThree = 4
        
        /// Layout is defined by a panorama image (equirectangular map)
        /// Replaces: CUBEMAP_LAYOUT_PANORAMA
        case panorama = 5
    }
}