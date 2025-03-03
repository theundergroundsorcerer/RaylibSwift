import CRaylib
/**
 * Material-related types and functionality
 *
 * This namespace contains enumerations for working with 3D materials,
 * providing a Swift-friendly interface to raylib's material system.
 *
 * Example usage:
 * ```swift
 * // Access a specific map from a material
 * let albedoMap = material.maps[Material.MapIndex.albedo.rawValue]
 * 
 * // Or using the compatibility aliases
 * let diffuseMap = material.maps[Material.MapIndex.diffuse.rawValue]
 * ```
 */
public extension Material {
    /**
     * Material texture map indices for physically based rendering (PBR)
     *
     * These indices identify different texture maps that can be
     * applied to a material for realistic rendering effects.
     *
     * Note: For compatibility with older terminology, `diffuse` and `specular`
     * are provided as aliases for `albedo` and `metalness` respectively.
     */
    @frozen
    enum MapIndex: Int32 {
        /// Albedo material (same as: diffuse)
        case albedo = 0
        
        /// Metalness material (same as: specular)
        case metalness = 1
        
        /// Normal material
        case normal = 2
        
        /// Roughness material
        case roughness = 3
        
        /// Ambient occlusion material
        case occlusion = 4
        
        /// Emission material
        case emission = 5
        
        /// Height material
        case height = 6
        
        /// Cubemap texture (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        case cubemap = 7
        
        /// Irradiance texture (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        case irradiance = 8
        
        /// Prefilter texture (NOTE: Uses GL_TEXTURE_CUBE_MAP)
        case prefilter = 9
        
        /// Brdf texture
        case brdf = 10

        /// Alias for albedo map (traditional terminology)
        public static var diffuse: MapIndex { .albedo }

        /// Alias for metalness map (traditional terminology)
        public static var specular: MapIndex { .metalness }
    }
}