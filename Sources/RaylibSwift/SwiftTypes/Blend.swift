/**
 * Blending related types and functionality
 *
 * This namespace contains enumerations for working with color blending modes,
 * which determine how colors are combined during rendering operations.
 *
 * Example usage:
 * ```swift
 * // Use additive blending for particle effects
 * BeginBlendMode(Blend.Mode.additive.rawValue)
 * DrawParticles()
 * EndBlendMode()
 * 
 * // Use alpha blending for UI elements
 * BeginBlendMode(Blend.Mode.alpha.rawValue)
 * DrawUI()
 * EndBlendMode()
 * ```
 */
public enum Blend {
    /**
     * Color blending modes (pre-defined)
     *
     * These modes determine how source (new) colors blend with
     * destination (existing) colors during rendering.
     */
    public enum Mode: Int32 {
        /// Blend textures considering alpha (default)
        case alpha = 0
        
        /// Blend textures adding colors
        case additive = 1
        
        /// Blend textures multiplying colors
        case multiplied = 2
        
        /// Blend textures adding colors (alternative)
        case addColors = 3
        
        /// Blend textures subtracting colors (alternative)
        case subtractColors = 4
        
        /// Blend premultiplied textures considering alpha
        case alphaPremultiply = 5
        
        /// Blend textures using custom src/dst factors (use rlSetBlendFactors())
        case custom = 6
        
        /// Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())
        case customSeparate = 7
    }
}