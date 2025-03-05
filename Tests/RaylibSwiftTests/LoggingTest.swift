import Testing
import RaylibSwift

@Suite("Test Logging")
struct name {
    @Test func testSetTraceLogLevel() {
        Utils.setTraceLogLevel(.all)
    }
    @Test func testTraceLog() {
        Utils.traceLog(.all, "Logging message!")
    }
}
