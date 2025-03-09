import RaylibSwift
import CRaylib
import Testing

@Suite struct KeyboardTest {
    @Test func keyboardKeys() {
        #expect(IsKeyDown(Input.Keyboard.Key.space.rawValue) == false)
    }
}