import CRaylib


public extension Font {

    /// Font type, defines generation method
    enum FontType: Int32 {
        /// Default font generation, anti-aliased
        case defaultFont = 0

        /// Bitmap font generation, no anti-aliasing 
        case  bitmap = 1                    
    
        /// SDF font generation, requires external shader
        case SDF = 2
 
    }
}
