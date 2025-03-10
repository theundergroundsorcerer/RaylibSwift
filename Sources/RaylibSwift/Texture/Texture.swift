import CRaylib

public struct Texture {
    @usableFromInline
    internal var cTexture: CRaylib.Texture

    @usableFromInline
    internal init(cTexture: CRaylib.Texture) {
        self.cTexture = cTexture
    }

    @usableFromInline
    internal init(_ cTexture: CRaylib.Texture) {
        self.cTexture = cTexture
    }

    /// OpenGL texture id
    @inlinable
    public var id: UInt32 {
        cTexture.id
    }

    /// Texture base width
    @inlinable
    public var width: Int32 {
        cTexture.width
    }

    /// Texture base height
    @inlinable
    public var height: Int32 {
        cTexture.height
    }

    /// Mipmap levels, 1 by default
    @inlinable
    public var mipmaps: Int32 {
        cTexture.mipmaps
    }

    /// Data format
    @inlinable
    public var format: Pixel.Format? {
        Pixel.Format(rawValue: cTexture.format)
    }
}

extension Texture: Equatable {
    @inlinable
    public static func == (lhs: Texture, rhs: Texture) -> Bool {
        lhs.id == rhs.id &&
        lhs.width == rhs.width &&
        lhs.height == rhs.height &&
        lhs.mipmaps == rhs.mipmaps &&
        lhs.format == rhs.format
    }
}

extension Texture: Hashable {
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(width)
        hasher.combine(height)
        hasher.combine(mipmaps)
        hasher.combine(format)
    }
}

extension Texture: CustomStringConvertible {
    @inlinable
    public var description: String {
        "Texture(id: \(id), \(width)x\(height), mipmaps: \(mipmaps), format: \(format?.description ?? String(cTexture.format)))"
    }
}

