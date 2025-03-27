import Foundation

/// This is a port of rayeasings.h to swift
/// How to use:
/// The four inputs t, b, c, d are defined as follows:
/// t = current time (in any unit measure, but same unit as duration)
/// b = starting value to interpolate
/// c = the total change in value of b that needs to occur
/// d = total time it should take to complete (duration)
public enum Ease {
    // MARK: - Linear Easing functions
    /// Ease: Linear
    @inlinable
    public static func linearNone(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * t / d + b
    }

    /// Ease: Linear In
    @inlinable
    public static func linearIn(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * t / d + b
    }

    /// Ease: Linear Out
    @inlinable
    public static func linearOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * t / d + b
    }

    /// Ease: Linear In Out
    @inlinable
    public static func linearInOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * t / d + b
    }

    // MARK: - Sine easing functions
    /// Ease: Sine In
    @inlinable
    public static func sineIn(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * (1 - cos(t / d * Float.pi / 2.0)) + b
    }

    /// Ease: Sine Out
    @inlinable
    public static func sineOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * sin(t / d * Float.pi / 2.0) + b
    }

    /// Ease: Sine In Out
    @inlinable
    public static func sineInOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c / 2.0 * (1.0 - cos(Float.pi * t / d)) + b
    }

    // MARK: - Circular Easing functions
    /// Ease: Circular In
    @inlinable
    public static func circularIn(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * (1.0 - (1.0 - square(of: 1 - t / d)).squareRoot()) + b
    }

    /// Ease: Circular Out
    @inlinable
    public static func circularOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * (1 - square(of: 1 - t / d)).squareRoot() + b
    }

    /// Ease: Circular In Out
    @inlinable
    public static func circularInOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        2 * t / d < 1
            ? c / 2 * (1 - sqrt(1 - square(of: 2 * t / d))) + b
            : c / 2.0 * (1 + sqrt(1 - square(of: 2 - t / d))) + b
    }

    // MARK: - Cubic Easing Functions
    /// Ease: Cubic In
    @inlinable
    public static func cubicIn(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * cube(of: t / d) + b
    }

    /// Ease: Cubic Out
    @inlinable
    public static func cubicOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * (1 - cube(of: 1 - t / d)) + b
    }

    /// Ease: Cubic In Out
    @inlinable
    public static func cubicInOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        2 * t / d < 1.0
            ? c / 2.0 * cube(of: 2 * t / d) + b
            : c / 2.0 * (2 - cube(of: 2 - t / d)) + b
    }

    // MARK: - Quadratic Easing Functions
    /// Ease: Quadratic In
    @inlinable
    public static func quadraticIn(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        c * square(of: t / d) + b
    }

    /// Ease: Quadratic Out
    @inlinable
    public static func quadraticOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        let timeRatio = t / d
        return -c * timeRatio * (timeRatio - 2.0) + b
    }

    /// Ease: Quadratic In Out
    @inlinable
    public static func quadraticInOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        2 * t / d < 1
            ? c / 2 * square(of: (2 * t / d)) + b
            : c / 2 * ((2 * t / d - 1) * (3 - 2 * t / d) - 1) + b
    }

    // MARK: - Exponential easing functions
    /// Ease: Exponential In
    @inlinable
    public static func exponentialIn(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        t == 0 ? b : c * pow(Float(2), 10 * (t / d - 1)) + b
    }

    /// Ease: Exponential Out
    @inlinable
    public static func exponentialOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        t == d ? b + c : c * (-pow(2.0, -10.0 * t / d) + 1) + b
    }

    /// Ease: Exponential In Out
    @inlinable
    public static func exponentialInOut(
        time t: Float, beginningValue b: Float, change c: Float, duration d: Float
    ) -> Float {
        if t == 0 {
            b
        } else if t == d {
            b + c
        } else if 2 * t / d < 1 {
            c / 2 * pow(2, 10 * (2 * t / d - 1)) + b
        } else {
            c / 2.0 * (-pow(2.0, -10.0*(2 * t / d - 1.0)) + 2.0) + b
        }
    }

}
