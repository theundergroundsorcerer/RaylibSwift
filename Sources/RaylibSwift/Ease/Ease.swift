import Foundation

/// This is a port of rayeasings.h to swift
/// How to use:
/// The four inputs t, b, c, d are defined as follows:
/// t = current time (in any unit measure, but same unit as duration)
/// b = starting value to interpolate
/// c = the total change in value of b that needs to occur
/// d = total time it should take to complete (duration)
public enum Ease {
    @usableFromInline
    internal static func applyFormula(
        _ s: Float, _ e: Float, _ p: Progress, _ formula: (Float) -> Float
    ) -> Float {
        p.fraction > 0 ? s + (e - s) * formula(p.fraction) : e
    }

    // MARK: - Linear Easing functions
    /// Ease: Linear
    @inlinable
    public static func linear(from start: Float, to end: Float, progress: Progress) -> Float {
        progress.fraction > 0 ? start + progress.fraction * (end - start) : end
    }

    // MARK: - Sine easing functions
    /// Ease: Sine In
    @inlinable
    public static func sineIn(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            1 - cos(fraction * Float.pi / 2)
        }
    }

    /// Ease: Sine Out
    @inlinable
    public static func sineOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            sin(fraction * Float.pi / 2.0)
        }
    }

    /// Ease: Sine In Out
    @inlinable
    public static func sineInOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            (1.0 - cos(Float.pi * fraction)) / 2
        }
    }

    // MARK: - Circular Easing functions
    /// Ease: Circular In
    @inlinable
    public static func circularIn(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            let t = fraction
            return 1 - sqrt(1 - t * t)
        }
    }

    /// Ease: Circular Out
    @inlinable
    public static func circularOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            let t = 1 - fraction
            return sqrt(1 - t * t)
        }
    }

    /// Ease: Circular In Out
    @inlinable
    public static func circularInOut(from start: Float, to end: Float, progress: Progress) -> Float
    {
        applyFormula(start, end, progress) { fraction in
            let t = 2 * fraction
            return t < 1 ? (1 - sqrt(1 - t * t)) * 0.5 : (1 + sqrt(1 - (2 - t) * (2 - t)) ) * 0.5
        }
    }

    // MARK: - Cubic Easing Functions
    /// Ease: Cubic In
    @inlinable
    public static func cubicIn(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            return fraction * fraction * fraction
        }
    }

    /// Ease: Cubic Out
    @inlinable
    public static func cubicOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            let t: Float = 1 - fraction
            return 1 - t * t * t
        }
    }

    /// Ease: Cubic In Out
    @inlinable
    public static func cubicInOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            let t: Float = 2 * fraction < 1 ? 2 * fraction : 2 - 2 * fraction
            return 2 * fraction < 1 ? (t * t * t) * 0.5 : (2 - t * t * t) * 0.5
        }
    }

    // MARK: - Quadratic Easing Functions
    /// Ease: Quadratic In
    @inlinable
    public static func quadraticIn(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            fraction * fraction
        }
    }

    /// Ease: Quadratic Out
    @inlinable
    public static func quadraticOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            fraction * (2 - fraction)
        }
    }

    /// Ease: Quadratic In Out
    @inlinable
    public static func quadraticInOut(from start: Float, to end: Float, progress: Progress) -> Float
    {
        applyFormula(start, end, progress) { fraction in
            let t = 2 * fraction < 1 ? 2 * fraction : 2 - 2 * fraction
            return 2 * fraction < 1 ? (t * t) / 2 : (1 - (1 - t) * (3 - t)) / 2
        }
    }

    // MARK: - Exponential easing functions
    /// Ease: Exponential In
    @inlinable
    public static func exponentialIn(from start: Float, to end: Float, progress: Progress) -> Float
    {
        applyFormula(start, end, progress) { fraction in
            fraction == 0 ? 0 : pow(2, 10 * (fraction - 1))
        }
    }

    /// Ease: Exponential Out
    @inlinable
    public static func exponentialOut(from start: Float, to end: Float, progress: Progress) -> Float
    {
        applyFormula(start, end, progress) { fraction in
            fraction == 1 ? 1 : 1 - pow(2, 10 * (fraction - 1))
        }
    }
    /// Ease: Exponential In Out
    @inlinable
    public static func exponentialInOut(
        from start: Float,
        to end: Float,
        progress: Progress
    ) -> Float {
        applyFormula(start, end, progress) { fraction in
            guard fraction != 0 && fraction != 1 else { return fraction }
            let t: Float = fraction * 2
            return t < 1 ? pow(2, 10 * (t - 1)) / 2 : (2 - pow(2, -10 * (t - 1))) / 2
        }
    }

    // MARK: - Back Easing functions
    /// Overshoot factor
    @usableFromInline
    internal static let overshoot: Float = 1.70158
    /// Ease: Back In
    @inlinable
    public static func backIn(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            fraction * fraction * (overshoot + 1) * fraction - overshoot
        }
    }

    /// Ease: Back Out
    @inlinable
    public static func backOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            let t: Float = 1 - fraction
            return 1 - t * t * ((overshoot + 1) * t - overshoot)
        }
    }

    /// Ease: Back In Out
    @inlinable
    public static func backInOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            let scaledOvershoot = 1.525 * overshoot
            let t: Float = 2 * fraction > 1 ? 2 * fraction : 2 - 2 * fraction
            return 2 * fraction > 1
                ? (t * t * ((scaledOvershoot + 1) * t - scaledOvershoot)) / 2
                : (2 - t * t * ((scaledOvershoot + 1) * t - scaledOvershoot)) / 2
        }
    }

    // MARK: - Bounce Easing Functions
    @usableFromInline
    static let bounceScale: Float = 7.5625

    @usableFromInline
    static func bounceOutFormula(_ fraction: Float) -> Float {
        let (scaledFraction, bounceOffset): (Float, Float) =
            switch fraction {
            case ..<(1 / 2.75):
                (fraction, 0)
            case (1 / 2.75)..<(2 / 2.75):
                (fraction - 1.5 / 2.75, 0.75)
            case (2 / 2.75)..<(2.5 / 2.75):
                (fraction - 2.25 / 2.75, 0.9375)
            default:
                (fraction - 2.625 / 2.75, 0.984375)
            }
        return bounceScale * scaledFraction * scaledFraction + bounceOffset
    }

    /// Ease: Bounce Out
    @inlinable
    public static func bounceOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            bounceOutFormula(fraction)
        }
    }

    /// Bounce In
    @inlinable
    public static func bounceIn(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            1 - bounceOutFormula(1 - fraction)
        }
    }

    /// Bounce in out
    @inlinable
    public static func bounceInOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            let t: Float = 2 * fraction
            return t < 1 ? (1 - bounceOutFormula(1 - t)) / 2 : (bounceOutFormula(t - 1) + 1) / 2
        }
    }

    // MARK: - Elastic Easing Functions
    /// Ease Elastic In
    @inlinable
    public static func elasticIn(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            guard fraction != 0 && fraction != 1 else {
                return fraction
            }

            let p: Float = 0.3
            let s: Float = p / 4
            let t: Float = 1 - fraction
            let postFix: Float = pow(2, -10 * t)

            return postFix * sin((t + s) * 2 * Float.pi / p)
        }
    }

    /// Ease Elastic Out
    @inlinable
    public static func elasticOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            guard fraction != 0 && fraction != 1 else {
                return fraction
            }

            let p: Float = 0.3
            let s: Float = p / 4
            let t: Float = fraction

            return 1 + pow(2, -10 * t) * sin((t - s) * 2 * Float.pi / p)
        }
    }

    /// Ease Elastic In Out
    @inlinable
    public static func elasticInOut(from start: Float, to end: Float, progress: Progress) -> Float {
        applyFormula(start, end, progress) { fraction in
            guard fraction != 0 && fraction != 1 else {
                return fraction
            }

            let p: Float = 0.3 * 1.5 
            let s: Float = p / 4.0
            
            if fraction < 0.5 {
                let t: Float = 1 - 2 * fraction
                let postFix: Float = pow(2, -10 * t)
                return 0.5 * postFix * sin((t + s) * 2 * Float.pi / p)
            } else {
                let t: Float = 2 * fraction - 1
                let postFix: Float = pow(2, -10 * t)
                return 0.5 * (postFix * sin((t - s) * 2 * Float.pi / p)) + 1
            }
        }
    }
}
