import CRaygui

public enum Gui {
    /// Slider Bar control
    @discardableResult
    public static func sliderBar(
        bounds: Rectangle,
        textLeft: Text,
        textRight: Text,
        value: inout Float,
        minValue: Float,
        maxValue: Float
    ) -> Int32 {
        CRaygui.GuiSliderBar(bounds, textLeft, textRight, &value, minValue, maxValue)
    }

    /// Check Box control, returns true when active
    @discardableResult
    public static func checkBox(bounds: Rectangle, text: Text, checked: inout Bool) -> Int32 {
        CRaygui.GuiCheckBox(bounds, text, &checked)
    }

    /// Label control
    @discardableResult
    public static func label(bounds: Rectangle, text: Text) -> Int32 {
        CRaygui.GuiLabel(bounds, text)
    }

    /// Dropdown Box control - returns true if mouse was clicked
    @discardableResult
    public static func dropdownBox(
        bounds: Rectangle,
        text: Text,
        active: inout Int32,
        editMode: Bool
    ) -> Bool {
        CRaygui.GuiDropdownBox(
            bounds, text, &active, editMode) == 1
    }
    /// int GuiDropdownBox(Rectangle bounds, const char *text, int *active, bool editMode);

    /// Lock gui controls (global state)
    public static func lock() {
        CRaygui.GuiLock()
    }

    /// Unlock gui controls (global state)
    public static func unlock() {
        CRaygui.GuiUnlock()
    }
}
