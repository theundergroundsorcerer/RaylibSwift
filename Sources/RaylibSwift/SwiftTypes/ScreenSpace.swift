import CRaylib

/// Screen-space-related functions
public enum ScreenSpace {

    /// Get a ray trace from screen position (i.e mouse)
    @inlinable
    public static func getScreenToWorldRay(_ position: Point, _ camera: Camera) -> Ray {
        CRaylib.GetScreenToWorldRay(position, camera)
    }

    /// Get a ray trace from screen position (i.e mouse) in a viewport
    @inlinable
    public static func getScreenToWorldRayEx(
        _ position: Point, _ camera: Camera, _ width: Int32, _ height: Int32
    ) -> Ray {
        CRaylib.GetScreenToWorldRayEx(position, camera, width, height)
    }

    /// Get the screen space position for a 3d world space position
    @inlinable
    public static func getWorldToScreen(_ position: Vector3, _ camera: Camera) -> Point {
        CRaylib.GetWorldToScreen(position, camera)
    }

    /// Get size position for a 3d world space position
    @inlinable
    public static func getWorldToScreenEx(
        _ position: Vector3, _ camera: Camera, _ width: Int32, _ height: Int32
    ) -> Point {
        CRaylib.GetWorldToScreenEx(position, camera, width, height)
    }

    /// Get the screen space position for a 2d camera world space position
    @inlinable
    public static func getWorldToScreen2D(_ position: Point, _ camera: Camera2D) -> Point {
        CRaylib.GetWorldToScreen2D(position, camera)
    }

    /// Get the world space position for a 2d camera screen space position
    @inlinable
    public static func getScreenToWorld2D(_ position: Point, _ camera: Camera2D) -> Point {
        CRaylib.GetScreenToWorld2D(position, camera)
    }

    /// Get camera transform matrix (view matrix)
    @inlinable
    public static func getCameraMatrix(_ camera: Camera) -> Matrix {
        CRaylib.GetCameraMatrix(camera)
    }

    /// Get camera 2d transform matrix
    @inlinable
    public static func getCameraMatrix2D(_ camera: Camera2D) -> Matrix {
        CRaylib.GetCameraMatrix2D(camera)
    }

    /// Compatibility hack for previous raylib versions
    @inlinable
    public static func getMouseRay(_ position: Point, _ camera: Camera) -> Ray {
        getScreenToWorldRay(position, camera)
    }
}
