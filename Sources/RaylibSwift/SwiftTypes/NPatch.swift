import CRaylib

/// N-Patch drawing related types and functionality
///
/// This namespace contains types for working with N-Patches (nine-patch textures),
/// which are used for efficiently drawing stretchable UI elements.
///
/// N-Patches divide a texture into stretchable and non-stretchable regions,
/// allowing for resizable UI elements that maintain their borders.
///
/// Example usage:
/// ```swift
/// // Create an N-Patch info with a 3x3 layout
/// let patchInfo = NPatch.Info(
///     source: Rectangle(x: 0, y: 0, width: 64, height: 64),
///     left: 10, top: 10, right: 10, bottom: 10,
///     layout: NPatch.Layout.ninePatch
/// )
///
/// // Draw the n-patch texture
/// DrawTextureNPatch(texture, patchInfo, destRect, Vector2.zero, 0, Color.white)
/// ```
public enum NPatch {
    /**
     * N-Patch layout configurations
     *
     * These define how an N-Patch texture is divided into tiles
     * and stretched when rendering.
     *
     * Maps to Raylib's C enum: NPatchLayout
     * Replaces: NPATCH_NINE_PATCH, NPATCH_THREE_PATCH_VERTICAL, NPATCH_THREE_PATCH_HORIZONTAL
     */
    public enum Layout: Int32 {
        /// 3x3 tiles layout (default)
        /// Replaces: NPATCH_NINE_PATCH
        case ninePatch = 0

        /// 1x3 tiles layout (vertical)
        /// Replaces: NPATCH_THREE_PATCH_VERTICAL
        case threePatchVertical = 1

        /// 3x1 tiles layout (horizontal)
        /// Replaces: NPATCH_THREE_PATCH_HORIZONTAL
        case threePatchHorizontal = 2
    }

    /**
     * N-Patch info for texture drawing
     *
     * This is a type alias to NPatchInfo, which defines how a texture should be split
     * and stretched when drawn as an N-Patch. The NPatchInfo type comes from the
     * Raylib C library and contains fields for source rectangle, border sizes, and layout.
     */
    public typealias Info = NPatchInfo
}

extension NPatchInfo {
    /**
     * Initialize a new NPatchInfo with a Layout enum
     *
     * This provides a more Swift-friendly way to create an NPatchInfo
     * using the Layout enum instead of raw integer values.
     *
     * - Parameters:
     *   - source: Texture source rectangle defining the complete n-patch
     *   - left: Width of the left border that stays fixed
     *   - top: Height of the top border that stays fixed
     *   - right: Width of the right border that stays fixed
     *   - bottom: Height of the bottom border that stays fixed
     *   - layout: Layout mode (Swift enum instead of raw integer)
     */
    public init(
        source: Rectangle, left: Int32, top: Int32, right: Int32, bottom: Int32,
        layout: NPatch.Layout
    ) {
        self.init(
            source: source, left: left, top: top, right: right, bottom: bottom,
            layout: layout.rawValue)
    }

    /**
     * The layout of this N-Patch as a Swift enum
     *
     * Provides access to the layout as a type-safe Swift enum instead of a raw integer.
     */
    public var layoutType: NPatch.Layout {
        get {
            return NPatch.Layout(rawValue: layout) ?? .ninePatch
        }
        set {
            layout = newValue.rawValue
        }
    }
}
