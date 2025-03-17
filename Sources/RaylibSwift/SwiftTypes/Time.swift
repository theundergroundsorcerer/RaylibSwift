import CRaylib

/// Time-related functions
    public enum Time {

        /// Set target FPS (maximum)
        @inlinable
        public static func setFps(_ fps: Int32) {
            CRaylib.SetTargetFPS(fps)
        }

        /// Get current FPS
        @inlinable
        public static var fps: Int32 {
            CRaylib.GetFPS()
        }

        /// Get time in seconds for last frame drawn (delta time)
        @inlinable
        public static var lastFrameDuration: Float {
            CRaylib.GetFrameTime()
        }

        /// Get elapsed time in seconds since InitWindow()
        @inlinable
        public static var elapsed: Double {
            CRaylib.GetTime()
        }

        /// Wait for some (halt program execution)
        @inlinable public static func wait(_ seconds: Double) {
            CRaylib.WaitTime(seconds)
        }
    }