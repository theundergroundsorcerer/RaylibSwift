import Testing
import RaylibSwift

@Suite struct ColorTests {
    @Test func redColorCorrectValues() {
        #expect(Color.red.r == 230)
        #expect(Color.red.g == 41)
        #expect(Color.red.b == 55)
        #expect(Color.red.a == 255)
    }

    @Test func blueColorCorrectValues() {
        #expect(Color.blue.r == 0)
        #expect(Color.blue.g == 121)
        #expect(Color.blue.b == 241)
        #expect(Color.blue.a == 255)
    }

    @Test func whiteColorCorrectValues() {
        #expect(Color.white.r == 255)
        #expect(Color.white.g == 255)
        #expect(Color.white.b == 255)
        #expect(Color.white.a == 255)
    }
}