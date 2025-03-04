import Testing
import RaylibSwift

@Suite("Test Logging")
struct name {
    @Test func testSetTraceLogLevel() {
        System.setTraceLogLevel(.all)
    }
    @Test func testTraceLog() {
        System.traceLog(.all, "high five, %d", 5)
    }
}
