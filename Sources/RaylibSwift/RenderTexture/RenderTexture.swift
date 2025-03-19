import CRaylib

public struct RenderTexture {
    @usableFromInline
    internal var cRenderTexture: CRaylib.RenderTexture

    @usableFromInline
    internal init(cRenderTexture: CRaylib.RenderTexture) {
        self.cRenderTexture = cRenderTexture
    }

    @usableFromInline
    internal init(_ cRenderTexture: CRaylib.RenderTexture) {
        self.cRenderTexture = cRenderTexture
    }

    /// OpenGL framebuffer object id
    @inlinable
    public var id: UInt32 {
        cRenderTexture.id
    }

    /// Color buffer attachment texture
    @inlinable
    public var texture: Texture {
        Texture(cRenderTexture.texture)
    }

    /// Depth buffer attachment texture
    @inlinable
    public var depth: Texture {
        Texture(cRenderTexture.depth)
    }
}

/// RenderTexture2D, same as RenderTexture
public typealias RenderTexture2D = RenderTexture

// Static functions
extension RenderTexture {
    /// Load texture for rendering (framebuffer)
    @inlinable
    public static func load(width: Int32, height: Int32) -> RenderTexture {
        RenderTexture(CRaylib.LoadRenderTexture(width, height))
    }

    /// Check if a render texture is valid (loaded in GPU)
    @inlinable
    public static func isValid(_ target: RenderTexture) -> Bool {
        CRaylib.IsRenderTextureValid(target.cRenderTexture)
    }

    /// Unload render texture from GPU memory (VRAM)
    @inlinable
    public static func unload(_ target: RenderTexture) {
        CRaylib.UnloadRenderTexture(target.cRenderTexture)
    }
}

// Instance methods
extension RenderTexture {
    /// Initialize render texture with given dimensions
    @inlinable
    public init(width: Int32, height: Int32) {
        self = RenderTexture.load(width: width, height: height)
    }

    /// Check if this render texture is valid (loaded in GPU)
    @inlinable
    public var isValid: Bool {
        RenderTexture.isValid(self)
    }

    /// Unload this render texture from GPU memory (VRAM)
    @inlinable
    public func unload() {
        RenderTexture.unload(self)
    }

    /// Begin drawing to this render texture
    @inlinable
    public func beginMode() {
        Graphics.Mode.beginTexture(using: self)
    }

    /// End drawing to this render texture
    @inlinable
    public func endMode() {
        Graphics.Mode.endTexture()
    }

    /// Execute drawing commands within this render texture's mode
    @inlinable
    public func withMode(_ context: () -> Void) {
        beginMode()
        context()
        endMode()
    }
}