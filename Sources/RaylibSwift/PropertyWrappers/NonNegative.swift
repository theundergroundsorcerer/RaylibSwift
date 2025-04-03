/// A property wrapper that ensures a Float value is always non-negative.
///
/// This wrapper behaves like a regular Float but silently converts
/// negative values to zero. Use it for properties that represent
/// physical dimensions, distances, or sizes.
@propertyWrapper
public struct NonNegative {
    /// The internal storage for the wrapped value
    @usableFromInline
    internal var value: Float
    
    /// The wrapped value with non-negative constraint
    @inlinable
    public var wrappedValue: Float {
        get { value }
        set { value = max(newValue, 0) }
    }

    /// Creates a new Length wrapper
    /// - Parameter wrappedValue: The initial value (will be made non-negative)
    @inlinable
    public init(wrappedValue: Float) {
        self.value = max(wrappedValue, 0)
    }
}

// MARK: - Float Behavior Conformance
extension NonNegative: Equatable, Hashable, Comparable {
    @inlinable public static func == (lhs: NonNegative, rhs: NonNegative) -> Bool {
        lhs.value == rhs.value
    }
    
    @inlinable public static func < (lhs: NonNegative, rhs: NonNegative) -> Bool {
        lhs.value < rhs.value
    }
    
    @inlinable public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

// Make Length behave like a numeric type
extension NonNegative: CustomStringConvertible {
    @inlinable public var description: String {
        value.description
    }
}