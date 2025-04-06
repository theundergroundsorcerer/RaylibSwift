import CRaylib

/**
 * Core Raylib types exported for Swift
 *
 * This file re-exports the fundamental types from the Raylib C API,
 * making them available to users of RaylibSwift without requiring
 * direct imports of the C module.
 */



/// Matrix, 4x4 components, column major, OpenGL style, right-handed
public typealias Matrix = CRaylib.Matrix

/// Image, pixel data stored in CPU memory (RAM)
public typealias Image = CRaylib.Image

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


/// Short Alias of Float type, mostly to be used with literals and type conversions
public typealias F = Float

/// Short Alias for Double type, mostly to be used with literals and type conversions
public typealias D = Double

/// Short Alias for UInt8 (Byte), commonly used for binary data
public typealias B = UInt8

/// Short Alias for Int8 (Signed Byte)
public typealias SB = Int8

/// Short Alias for Int16 (Short integer)
public typealias S = Int16

/// Short Alias for UInt16 (Unsigned Short)
public typealias US = UInt16

/// Short Alias for Int32, mostly to be used with literals and type conversions
/// It differs from Swift Int, since int is assumed to be Int32 in Raylib API
public typealias I = Int32

/// Short Alias for UInt32 (Unsigned Integer)
public typealias UI = UInt32

/// Short Alias for Int64 (Long integer), mostly to be used with literals and type conversions
public typealias L = Int64

/// Short Alias for UInt64 (Unsigned Long)
public typealias UL = UInt64
