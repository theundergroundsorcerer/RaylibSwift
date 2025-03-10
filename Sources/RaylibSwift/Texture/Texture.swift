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



}