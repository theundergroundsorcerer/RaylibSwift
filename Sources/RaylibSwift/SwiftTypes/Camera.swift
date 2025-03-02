import CRaylib

/**
 * Swift-friendly extensions to Raylib's Camera type
 *
 * Provides typed Swift enums that correspond to Raylib's C-style enums
 * for better type safety and documentation.
 */
public extension Camera {
    /**
     * Camera system modes
     *
     * These modes define how the camera behaves when updated
     * with the UpdateCamera() function.
     *
     * Maps to Raylib's C enum: CameraMode
     * Replaces: CAMERA_CUSTOM, CAMERA_FREE, CAMERA_ORBITAL, etc.
     *
     * Usage:
     * ```swift
     * // Instead of: SetCameraMode(camera, CAMERA_ORBITAL)
     * SetCameraMode(camera, Camera.Mode.orbital.rawValue)
     * ```
     */
    enum Mode: Int32 {
        /// Camera custom mode, controlled by user (UpdateCamera() does nothing)
        /// Replaces: CAMERA_CUSTOM
        case custom = 0   

        /// Camera free mode - moves freely
        /// Replaces: CAMERA_FREE          
        case free = 1    

        /// Camera orbital mode - rotates around target with zoom capability
        /// Replaces: CAMERA_ORBITAL              
        case orbital = 2 

        /// Camera first person mode - moves like in a first-person game
        /// Replaces: CAMERA_FIRST_PERSON               
        case firstPerson = 3

        /// Camera third person mode - follows a target from behind
        /// Replaces: CAMERA_THIRD_PERSON           
        case thirdPerson = 4             
    }

    /**
     * Camera projection types
     *
     * Defines how the 3D scene is projected onto the 2D screen.
     *
     * Maps to Raylib's C enum: CameraProjection
     * Replaces: CAMERA_PERSPECTIVE, CAMERA_ORTHOGRAPHIC
     *
     * Usage:
     * ```swift
     * // Instead of: camera.projection = CAMERA_ORTHOGRAPHIC
     * camera.projection = Camera.Projection.orthographic.rawValue
     * ```
     */
    enum Projection: Int32 {
        /// Perspective projection - objects further away appear smaller
        /// Replaces: CAMERA_PERSPECTIVE
        case perspective = 0 

        /// Orthographic projection - objects maintain their size regardless of distance
        /// Replaces: CAMERA_ORTHOGRAPHIC        
        case orthographic = 1             
    }
}