/**
 * Trace logging functionality
 *
 * This namespace contains types and functions for controlling logging output,
 * including log levels and message formatting. It provides a Swift-friendly
 * interface to raylib's tracing and debugging capabilities.
 *
 * Example usage:
 * ```swift
 * // Set the logging level
 * TraceLog.setLevel(.warning)
 *
 * // Log messages at different levels
 * TraceLog.log(.info, "Game initialized successfully")
 * TraceLog.log(.warning, "Resource loading failed, using fallback")
 * TraceLog.log(.error, "Could not save game state")
 * ```
 */
public enum TraceLog {
    /**
     * Trace log level types
     *
     * These levels determine what types of messages are logged
     * by the raylib trace system. They are organized by priority level.
     */
    public enum Level: Int32 {
        /// Display all logs
        case all = 0

        /// Trace logging, intended for internal use only
        case trace = 1

        /// Debug logging, used for internal debugging, it should be disabled on release builds
        case debug = 2

        /// Info logging, used for program execution info
        case info = 3

        /// Warning logging, used on recoverable failures
        case warning = 4

        /// Error logging, used on unrecoverable failures
        case error = 5

        /// Fatal logging, used to abort program: exit(EXIT_FAILURE)
        case fatal = 6

        /// Disable logging
        case none = 7
    }
}
