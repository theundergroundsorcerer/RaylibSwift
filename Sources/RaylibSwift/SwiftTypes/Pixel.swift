/// Pixel-related types and functionality
///
/// This namespace contains enumerations for working with pixel formats
/// and related image operations.
///   * Example usage:
/// ```swift
/// // Create an image with a specific format
/// let img = GenImageColor(800, 600, RED, Pixel.Format.uncompressedR8G8B8A8.rawValue)
///
/// // Check if an image uses a compressed format
/// func isCompressedFormat(_ format: Pixel.Format) -> Bool {
///     switch format {
///     case .compressedDXT1RGB, .compressedDXT1RGBA, .compressedDXT3RGBA,
///          .compressedDXT5RGBA, .compressedETC1RGB, .compressedETC2RGB,
///          .compressedETC2EACRGBA, .compressedPVRTRGB, .compressedPVRTRGBA,
///          .compressedASTC4x4RGBA, .compressedASTC8x8RGBA:
///         return true
///     default:
///         return false
///     }
/// }
///
/// // Get the format of an existing image
/// let format = Pixel.Format(rawValue: GetImageFormat(image))
/// ```
public enum Pixel {
    /**
     * Pixel format types for image representation
     *
     * These formats define how pixel data is stored in memory,
     * including color depth, channels, and compression methods.
     *
     * Note: Support depends on the underlying graphics API and platform
     */
    public enum Format: Int32 {
        /// 8 bit per pixel (no alpha)
        case uncompressedGrayscale = 1

        /// 8*2 bpp (2 channels)
        case uncompressedGrayAlpha = 2

        /// 16 bpp
        case uncompressedR5G6B5 = 3

        /// 24 bpp
        case uncompressedR8G8B8 = 4

        /// 16 bpp (1 bit alpha)
        case uncompressedR5G5B5A1 = 5

        /// 16 bpp (4 bit alpha)
        case uncompressedR4G4B4A4 = 6

        /// 32 bpp
        case uncompressedR8G8B8A8 = 7

        /// 32 bpp (1 channel - float)
        case uncompressedR32 = 8

        /// 32*3 bpp (3 channels - float)
        case uncompressedR32G32B32 = 9

        /// 32*4 bpp (4 channels - float)
        case uncompressedR32G32B32A32 = 10

        /// 16 bpp (1 channel - half float)
        case uncompressedR16 = 11

        /// 16*3 bpp (3 channels - half float)
        case uncompressedR16G16B16 = 12

        /// 16*4 bpp (4 channels - half float)
        case uncompressedR16G16B16A16 = 13

        /// 4 bpp (no alpha)
        case compressedDXT1RGB = 14

        /// 4 bpp (1 bit alpha)
        case compressedDXT1RGBA = 15

        /// 8 bpp
        case compressedDXT3RGBA = 16

        /// 8 bpp
        case compressedDXT5RGBA = 17

        /// 4 bpp
        case compressedETC1RGB = 18

        /// 4 bpp
        case compressedETC2RGB = 19

        /// 8 bpp
        case compressedETC2EACRGBA = 20

        /// 4 bpp
        case compressedPVRTRGB = 21

        /// 4 bpp
        case compressedPVRTRGBA = 22

        /// 8 bpp
        case compressedASTC4x4RGBA = 23

        /// 2 bpp
        case compressedASTC8x8RGBA = 24
    }
}

extension Pixel.Format: CustomStringConvertible {
    public var description: String {
        // Get the case name as a string
        let caseName = String(describing: self)

        // Format the string by adding spaces before capital letters
        // For example: "uncompressedR8G8B8" becomes "uncompressed R8G8B8"
        let formatted = caseName.replacingOccurrences(
            of: "([a-z])([A-Z])",
            with: "$1 $2",
            options: .regularExpression)

        // Add bit depth information
        let bitDepth: String
        switch self {
        case .uncompressedGrayscale:
            bitDepth = "(8-bit)"
        case .uncompressedGrayAlpha:
            bitDepth = "(8-bit x 2)"
        case .uncompressedR5G6B5, .uncompressedR5G5B5A1, .uncompressedR4G4B4A4:
            bitDepth = "(16-bit)"
        case .uncompressedR8G8B8:
            bitDepth = "(24-bit)"
        case .uncompressedR8G8B8A8:
            bitDepth = "(32-bit)"
        case .uncompressedR32:
            bitDepth = "(32-bit float)"
        case .uncompressedR32G32B32:
            bitDepth = "(32-bit x 3 float)"
        case .uncompressedR32G32B32A32:
            bitDepth = "(32-bit x 4 float)"
        case .uncompressedR16:
            bitDepth = "(16-bit half float)"
        case .uncompressedR16G16B16:
            bitDepth = "(16-bit x 3 half float)"
        case .uncompressedR16G16B16A16:
            bitDepth = "(16-bit x 4 half float)"
        case .compressedDXT1RGB, .compressedDXT1RGBA,
            .compressedETC1RGB, .compressedETC2RGB,
            .compressedPVRTRGB, .compressedPVRTRGBA:
            bitDepth = "(compressed, 4 bpp)"
        case .compressedDXT3RGBA, .compressedDXT5RGBA,
            .compressedETC2EACRGBA, .compressedASTC4x4RGBA:
            bitDepth = "(compressed, 8 bpp)"
        case .compressedASTC8x8RGBA:
            bitDepth = "(compressed, 2 bpp)"
        }

        return "\(formatted) \(bitDepth)"
    }
}
