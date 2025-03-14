import CRaylib

public struct Shader: ~Copyable {
    internal var cShader: CRaylib.Shader
    private var isLoaded: Bool

    internal init(_ cShader: CRaylib.Shader, _ isLoaded: Bool) {
        self.cShader = cShader
        self.isLoaded = isLoaded
    }

    public init() {
        self.cShader = CRaylib.Shader(id: 0, locs: nil)
        isLoaded = false
    }

    public init(vsFileName: String?, fsFileName: String?) {
        self = Shader.load(vsFileName, fsFileName)
    }

    public init(vsCode: String?, fsCode: String?) {
        self = Shader.loadFromMemory(vsCode, fsCode)
    }

    public mutating func load(vsFileName: String?, fsFileName: String?) {
        reset()
        self = Shader.load(vsFileName, fsFileName)
    }

    public mutating func loadFromMemory(vsCode: String?, fsCode: String?) {
        reset()
        self = Shader.loadFromMemory(vsCode, fsCode)
    }

    public func unload() {
        if self.isLoaded {
            CRaylib.UnloadShader(cShader)
        }
    }

    public mutating func reset() {
        unload()
        isLoaded = false
    }

    deinit {
        unload()
    }
}

/// Swift-friendly extensions for Raylib's Shader type
///
/// These extensions provide type-safe Swift enums for shader locations,
/// uniform data types, and attribute data types.
extension Shader {
    /**
     * Shader location indices
     *
     * These indices identify different attribute and uniform locations
     * that can be accessed in shader programs.
     *
     * Maps to Raylib's C enum: ShaderLocationIndex
     * Replaces: SHADER_LOC_VERTEX_POSITION, SHADER_LOC_VERTEX_TEXCOORD01, etc.
     *
     * Note: For compatibility with older terminology, `mapDiffuse` and `mapSpecular`
     * are provided as aliases for `mapAlbedo` and `mapMetalness` respectively.
     *
     * Usage:
     * ```swift
     * // Instead of: SetShaderValue(shader, SHADER_LOC_MAP_DIFFUSE, &value, SHADER_UNIFORM_INT)
     * SetShaderValue(shader, Shader.LocationIndex.mapAlbedo.rawValue, &value, Shader.UniformDataType.int.rawValue)
     * ```
     */
    public enum LocationIndex: Int32 {
        /// Shader location: vertex attribute: position
        /// Replaces: SHADER_LOC_VERTEX_POSITION
        case vertexPosition = 0

        /// Shader location: vertex attribute: texcoord01
        /// Replaces: SHADER_LOC_VERTEX_TEXCOORD01
        case vertexTexcoord01 = 1

        /// Shader location: vertex attribute: texcoord02
        /// Replaces: SHADER_LOC_VERTEX_TEXCOORD02
        case vertexTexcoord02 = 2

        /// Shader location: vertex attribute: normal
        /// Replaces: SHADER_LOC_VERTEX_NORMAL
        case vertexNormal = 3

        /// Shader location: vertex attribute: tangent
        /// Replaces: SHADER_LOC_VERTEX_TANGENT
        case vertexTangent = 4

        /// Shader location: vertex attribute: color
        /// Replaces: SHADER_LOC_VERTEX_COLOR
        case vertexColor = 5

        /// Shader location: matrix uniform: model-view-projection
        /// Replaces: SHADER_LOC_MATRIX_MVP
        case matrixMVP = 6

        /// Shader location: matrix uniform: view (camera transform)
        /// Replaces: SHADER_LOC_MATRIX_VIEW
        case matrixView = 7

        /// Shader location: matrix uniform: projection
        /// Replaces: SHADER_LOC_MATRIX_PROJECTION
        case matrixProjection = 8

        /// Shader location: matrix uniform: model (transform)
        /// Replaces: SHADER_LOC_MATRIX_MODEL
        case matrixModel = 9

        /// Shader location: matrix uniform: normal
        /// Replaces: SHADER_LOC_MATRIX_NORMAL
        case matrixNormal = 10

        /// Shader location: vector uniform: view
        /// Replaces: SHADER_LOC_VECTOR_VIEW
        case vectorView = 11

        /// Shader location: vector uniform: diffuse color
        /// Replaces: SHADER_LOC_COLOR_DIFFUSE
        case colorDiffuse = 12

        /// Shader location: vector uniform: specular color
        /// Replaces: SHADER_LOC_COLOR_SPECULAR
        case colorSpecular = 13

        /// Shader location: vector uniform: ambient color
        /// Replaces: SHADER_LOC_COLOR_AMBIENT
        case colorAmbient = 14

        /// Shader location: sampler2d texture: albedo (same as: mapDiffuse)
        /// Replaces: SHADER_LOC_MAP_ALBEDO
        case mapAlbedo = 15

        /// Shader location: sampler2d texture: metalness (same as: mapSpecular)
        /// Replaces: SHADER_LOC_MAP_METALNESS
        case mapMetalness = 16

        /// Shader location: sampler2d texture: normal
        /// Replaces: SHADER_LOC_MAP_NORMAL
        case mapNormal = 17

        /// Shader location: sampler2d texture: roughness
        /// Replaces: SHADER_LOC_MAP_ROUGHNESS
        case mapRoughness = 18

        /// Shader location: sampler2d texture: occlusion
        /// Replaces: SHADER_LOC_MAP_OCCLUSION
        case mapOcclusion = 19

        /// Shader location: sampler2d texture: emission
        /// Replaces: SHADER_LOC_MAP_EMISSION
        case mapEmission = 20

        /// Shader location: sampler2d texture: height
        /// Replaces: SHADER_LOC_MAP_HEIGHT
        case mapHeight = 21

        /// Shader location: samplerCube texture: cubemap
        /// Replaces: SHADER_LOC_MAP_CUBEMAP
        case mapCubemap = 22

        /// Shader location: samplerCube texture: irradiance
        /// Replaces: SHADER_LOC_MAP_IRRADIANCE
        case mapIrradiance = 23

        /// Shader location: samplerCube texture: prefilter
        /// Replaces: SHADER_LOC_MAP_PREFILTER
        case mapPrefilter = 24

        /// Shader location: sampler2d texture: brdf
        /// Replaces: SHADER_LOC_MAP_BRDF
        case mapBrdf = 25

        /// Shader location: vertex attribute: boneIds
        /// Replaces: SHADER_LOC_VERTEX_BONE_IDS
        case vertexBoneIds = 26

        /// Shader location: vertex attribute: boneWeights
        /// Replaces: SHADER_LOC_VERTEX_BONE_WEIGHTS
        case vertexBoneWeights = 27

        /// Shader location: array of matrices uniform: boneMatrices
        /// Replaces: SHADER_LOC_BONE_MATRICES
        case boneMatrices = 28

        /// Alias for mapAlbedo (traditional terminology)
        /// Replaces: SHADER_LOC_MAP_DIFFUSE
        public static var mapDiffuse: LocationIndex { .mapAlbedo }

        /// Alias for mapMetalness (traditional terminology)
        /// Replaces: SHADER_LOC_MAP_SPECULAR
        public static var mapSpecular: LocationIndex { .mapMetalness }
    }

    /**
     * Shader uniform data types
     *
     * These types define the format of uniform variables that can be passed to shaders.
     *
     * Maps to Raylib's C enum: ShaderUniformDataType
     * Replaces: SHADER_UNIFORM_FLOAT, SHADER_UNIFORM_VEC2, etc.
     *
     * Usage:
     * ```swift
     * // Instead of: SetShaderValue(shader, location, &value, SHADER_UNIFORM_FLOAT)
     * SetShaderValue(shader, location, &value, Shader.UniformDataType.float.rawValue)
     * ```
     */
    public enum UniformDataType: Int32 {
        /// Shader uniform type: float
        /// Replaces: SHADER_UNIFORM_FLOAT
        case float = 0

        /// Shader uniform type: vec2 (2 float)
        /// Replaces: SHADER_UNIFORM_VEC2
        case vec2 = 1

        /// Shader uniform type: vec3 (3 float)
        /// Replaces: SHADER_UNIFORM_VEC3
        case vec3 = 2

        /// Shader uniform type: vec4 (4 float)
        /// Replaces: SHADER_UNIFORM_VEC4
        case vec4 = 3

        /// Shader uniform type: int
        /// Replaces: SHADER_UNIFORM_INT
        case int = 4

        /// Shader uniform type: ivec2 (2 int)
        /// Replaces: SHADER_UNIFORM_IVEC2
        case ivec2 = 5

        /// Shader uniform type: ivec3 (3 int)
        /// Replaces: SHADER_UNIFORM_IVEC3
        case ivec3 = 6

        /// Shader uniform type: ivec4 (4 int)
        /// Replaces: SHADER_UNIFORM_IVEC4
        case ivec4 = 7

        /// Shader uniform type: sampler2d
        /// Replaces: SHADER_UNIFORM_SAMPLER2D
        case sampler2D = 8
    }

    /**
     * Shader attribute data types
     *
     * These types define the format of vertex attributes that can be used in shaders.
     *
     * Maps to Raylib's C enum: ShaderAttributeDataType
     * Replaces: SHADER_ATTRIB_FLOAT, SHADER_ATTRIB_VEC2, etc.
     *
     * Usage:
     * ```swift
     * // Instead of: SetShaderValueAttribute(shader, attribLoc, data, SHADER_ATTRIB_VEC3)
     * SetShaderValueAttribute(shader, attribLoc, data, Shader.AttributeDataType.vec3.rawValue)
     * ```
     */
    public enum AttributeDataType: Int32 {
        /// Shader attribute type: float
        /// Replaces: SHADER_ATTRIB_FLOAT
        case float = 0

        /// Shader attribute type: vec2 (2 float)
        /// Replaces: SHADER_ATTRIB_VEC2
        case vec2 = 1

        /// Shader attribute type: vec3 (3 float)
        /// Replaces: SHADER_ATTRIB_VEC3
        case vec3 = 2

        /// Shader attribute type: vec4 (4 float)
        /// Replaces: SHADER_ATTRIB_VEC4
        case vec4 = 3
    }
}

// Shader functions
extension Shader {
    /**
     * Load shader from files and bind default locations
     *
     * - Parameters:
     *   - vsFileName: Path to vertex shader file (can be nil for default vertex shader)
     *   - fsFileName: Path to fragment shader file (can be nil for default fragment shader)
     * - Returns: Shader loaded and ready to use
     */
    @inline(__always)
    public static func load(_ vsFileName: String?, _ fsFileName: String?) -> Shader {
        let shader: CRaylib.Shader =
            switch (vsFileName, fsFileName) {
            case (nil, nil):
                CRaylib.LoadShader(nil, nil)
            case (nil, let .some(fs)):
                fs.withCString { fsPtr in
                    CRaylib.LoadShader(nil, fsPtr)
                }
            case (let .some(vs), nil):
                vs.withCString { vsPtr in
                    CRaylib.LoadShader(vsPtr, nil)
                }
            case let (.some(vs), .some(fs)):
                vs.withCString { vsPtr in
                    fs.withCString { fsPtr in
                        CRaylib.LoadShader(vsPtr, fsPtr)
                    }
                }
            }
        return Shader(shader, true)
    }

    /**
     * Load shader from code strings and bind default locations
     *
     * - Parameters:
     *   - vsCode: Vertex shader code string (can be nil for default vertex shader)
     *   - fsCode: Fragment shader code string (can be nil for default fragment shader)
     * - Returns: Shader loaded and ready to use
     */
    @inline(__always)
    public static func loadFromMemory(_ vsCode: String?, _ fsCode: String?) -> Shader {
        switch (vsCode, fsCode) {
        case (nil, nil):
            Shader(CRaylib.LoadShaderFromMemory(nil, nil), true)
        case (nil, let .some(fs)):
            Shader(
                fs.withCString { fsCstring in
                    CRaylib.LoadShaderFromMemory(nil, fsCstring)
                }, true)
        case (let .some(vs), nil):
            Shader(
                vs.withCString { vsCString in
                    CRaylib.LoadShaderFromMemory(vsCString, nil)
                }, true)
        case let (.some(vs), .some(fs)):
            Shader(
                vs.withCString { vsCString in
                    fs.withCString { fsCString in
                        CRaylib.LoadShaderFromMemory(vsCString, fsCString)
                    }
                }, true)

        }
    }

    /**
     * Check if a shader is valid (loaded on GPU)
     *
     * - Returns: True if shader is valid
     */
    @inline(__always)
    public var isValid: Bool {
        CRaylib.IsShaderValid(self.cShader)
    }

    /**
     * Get shader uniform location
     *
     * - Parameter uniformName: Uniform variable name
     * - Returns: Uniform location (index) or -1 if not found
     */
    @inline(__always)
    public func getLocation(_ uniformName: String) -> LocationIndex? {
        LocationIndex(
            rawValue: uniformName.withCString { cString in
                CRaylib.GetShaderLocation(self.cShader, cString)
            })
    }

    /**
     * Get shader attribute location
     *
     * - Parameter attribName: Attribute variable name
     * - Returns: Attribute location (index) or -1 if not found
     */
    @inline(__always)
    public func getLocationAttrib(_ attribName: String) -> LocationIndex? {
        LocationIndex(
            rawValue: attribName.withCString { cString in
                CRaylib.GetShaderLocationAttrib(self.cShader, cString)
            })
    }

    /**
     * Set shader uniform value
     *
     * - Parameters:
     *   - locIndex: Shader uniform location index
     *   - value: Vector2er to uniform value
     *   - uniformType: Uniform data type
     */
    @inline(__always)
    public func setValue(
        _ locIndex: LocationIndex, _ value: UnsafeRawPointer,
        _ uniformType: UniformDataType
    ) {
        CRaylib.SetShaderValue(self.cShader, locIndex.rawValue, value, uniformType.rawValue)
    }

    /**
     * Set shader uniform value vector
     *
     * - Parameters:
     *   - locIndex: Shader uniform location index
     *   - value: Vector2er to uniform values array
     *   - uniformType: Uniform data type
     *   - count: Number of elements in the array
     */
    @inline(__always)
    public func setValueV(
        _ locIndex: LocationIndex, _ value: UnsafeRawPointer,
        _ uniformType: UniformDataType, _ count: Int32
    ) {
        CRaylib.SetShaderValueV(self.cShader, locIndex.rawValue, value, uniformType.rawValue, count)
    }

    /**
     * Set shader uniform value (matrix 4x4)
     *
     * - Parameters:
     *   - locIndex: Shader uniform location index
     *   - mat: Matrix to set
     */
    @inline(__always)
    public func setValueMatrix(_ locIndex: LocationIndex, _ mat: Matrix) {
        CRaylib.SetShaderValueMatrix(cShader, locIndex.rawValue, mat)
    }

    /**
     * Set shader uniform value for texture (sampler2d)
     *
     * - Parameters:
     *   - locIndex: Shader uniform location index
     *   - texture: Texture to set
     */
    @inline(__always)
    public func setValueTexture(_ locIndex: LocationIndex, _ texture: Texture2D) {
        CRaylib.SetShaderValueTexture(cShader, locIndex.rawValue, texture.cTexture)
    }

}
