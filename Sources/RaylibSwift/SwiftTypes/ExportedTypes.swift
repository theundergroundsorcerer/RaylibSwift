import CRaylib

/**
 * Core Raylib types exported for Swift
 *
 * This file re-exports the fundamental types from the Raylib C API,
 * making them available to users of RaylibSwift without requiring
 * direct imports of the C module.
 */

/// Vector2, 2 components
public typealias Vector2 = CRaylib.Vector2

/// Vector3, 3 components
public typealias Vector3 = CRaylib.Vector3

/// Vector4, 4 components
public typealias Vector4 = CRaylib.Vector4

/// Quaternion, 4 components (Vector4 alias)
public typealias Quaternion = Vector4

/// Matrix, 4x4 components, column major, OpenGL style, right-handed
public typealias Matrix = CRaylib.Matrix

/// Color, 4 components, R8G8B8A8 (32bit)
public typealias Color = CRaylib.Color

/// Rectangle, 4 components
public typealias Rectangle = CRaylib.Rectangle

/// Image, pixel data stored in CPU memory (RAM)
public typealias Image = CRaylib.Image



/// Texture2D, same as Texture
public typealias Texture2D = Texture

/// TextureCubemap, same as Texture
public typealias TextureCubemap = Texture

/// RenderTexture, fbo for texture rendering
public typealias RenderTexture = CRaylib.RenderTexture

/// RenderTexture2D, same as RenderTexture
public typealias RenderTexture2D = RenderTexture

/// NPatchInfo, n-patch layout info
public typealias NPatchInfo = CRaylib.NPatchInfo

/// GlyphInfo, font characters glyphs info
public typealias GlyphInfo = CRaylib.GlyphInfo

/// Font, font texture and GlyphInfo array data
public typealias Font = CRaylib.Font

/// Camera, defines position/orientation in 3d space
public typealias Camera3D = CRaylib.Camera3D

/// Camera3D, same as Camera
public typealias Camera = Camera3D

/// Camera2D, defines position/orientation in 2d space
public typealias Camera2D = CRaylib.Camera2D

/// Mesh, vertex data and vao/vbo
public typealias Mesh = CRaylib.Mesh

/// MaterialMap, material texture map
public typealias MaterialMap = CRaylib.MaterialMap

/// Material, material for a 3d model
public typealias Material = CRaylib.Material

/// Transform, vertex transformation data
public typealias Transform = CRaylib.Transform

/// BoneInfo, bone information
public typealias BoneInfo = CRaylib.BoneInfo

/// Model, 3d model with multiple meshes
public typealias Model = CRaylib.Model

/// ModelAnimation, skeletal animation data
public typealias ModelAnimation = CRaylib.ModelAnimation

/// Ray, ray for raycasting
public typealias Ray = CRaylib.Ray

/// RayCollision, ray collision information
public typealias RayCollision = CRaylib.RayCollision

/// BoundingBox, bounding box for collision detection
public typealias BoundingBox = CRaylib.BoundingBox

/// Wave, audio wave data
public typealias Wave = CRaylib.Wave

/// AudioStream, audio stream
public typealias AudioStream = CRaylib.AudioStream

/// Sound, basic sound source and buffer
public typealias Sound = CRaylib.Sound

/// Music, music stream, audio stream with additional features
public typealias Music = CRaylib.Music

/// VrDeviceInfo, Head-Mounted-Display device parameters
public typealias VrDeviceInfo = CRaylib.VrDeviceInfo

/// VrStereoConfig, VR stereo rendering configuration
public typealias VrStereoConfig = CRaylib.VrStereoConfig

/// FilePathList, file path list
public typealias FilePathList = CRaylib.FilePathList

/// AutomationEvent, automation event
public typealias AutomationEvent = CRaylib.AutomationEvent

/// AutomationEventList, automation event list
public typealias AutomationEventList = CRaylib.AutomationEventList
