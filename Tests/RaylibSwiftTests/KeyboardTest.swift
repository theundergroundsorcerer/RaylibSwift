import RaylibSwift
import CRaylib
import Testing

@Suite struct KeyboardTest {
    @Test func keyboardKeys() {
        #expect(IsKeyDown(Keyboard.Key.space.rawValue) == false)
    }
}