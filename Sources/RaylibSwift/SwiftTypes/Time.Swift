import CRaylib

/// Time-related functions
    public enum Time {

        /// Set target FPS (maximum)
        @inlinable
        public static func setTargetFPS(_ fps: Int32) {
            CRaylib.SetTargetFPS(fps)
        }

        /// Get current FPS
        @inlinable
        public static var getFPS: Int32 {
            CRaylib.GetFPS()
        }

        /// Get time in seconds for last frame drawn (delta time)
        @inlinable
        public static var frameTime: Float {
            CRaylib.GetFrameTime()
        }

        /// Get elapsed time in seconds since InitWindow()
        @inlinable
        public static func getTime() -> Double {
            CRaylib.GetTime()
        }

        /// Wait for some (halt program execution)
        @inlinable public static func waitTime(_ seconds: Double) {
            CRaylib.WaitTime(seconds)
        }
    }