import CRaylib

/// Random values generation functions
public enum Random {
    /// Set the seed for the random number generator
    @inlinable public func setSeed(_ seed: UInt32) {
        CRaylib.SetRandomSeed(seed)
    }

    /// Get a random value between min and max (both included)
    @inlinable public func getNumber(_ min: Int32, _ max: Int32) -> Int32 {
        CRaylib.GetRandomValue(min, max)
    }

    /// Load random seuqnce, no values repeated
    @inlinable 
    public static func loadSequence(_ count: UInt32, _ min: Int32, _ max: Int32) -> [Int32]? {
        guard
            let loadedSeuqnce: UnsafeMutablePointer<Int32> = CRaylib.LoadRandomSequence(count, min, max)
        else {
            return nil
        }

        defer {
            CRaylib.UnloadRandomSequence(loadedSeuqnce)
        }

        return Array(UnsafeBufferPointer(start: loadedSeuqnce, count: Int(count)) )

    }

}
