/// Represents progress of time within a duration.
///
/// Used for animation, easing functions, and time-based calculations.
/// Ensures time never exceeds duration and provides convenient progress fractions.
///
/// Example:
/// ```swift
/// let progress = Progress(time: 0.5, duration: 2.0)
/// let position = Ease.quadOut(progress: progress, from: 0, change: 100)
/// ```
public struct Progress {
    /// Current elapsed time (clamped to not exceed duration)
    public let time: Float

    /// Total duration of the time period
    public let duration: Float
    
    /// Completion fraction from 0 to 1 (time/duration)
    @usableFromInline
    var fraction: Float { 
        duration > 0 ? time / duration : 1
    }
    
    /// Remaining fraction from 1 to 0 (1-fraction)
    @usableFromInline
    var remainingFraction: Float { 1 - fraction }
    
    /// Creates a new Progress instance
    public init(time: Float, duration: Float) {
        self.duration = max(0, duration)
        self.time = min(self.duration, max(0, time))
    }
}