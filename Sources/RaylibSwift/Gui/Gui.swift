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
        maxValue: Float) -> Int32 {
            CRaygui.GuiSliderBar(bounds, textLeft, textRight, &value, minValue, maxValue)
        }
    
    /// Check Box control, returns true when active
    @discardableResult
    public static func checkBox(bounds: Rectangle, text: Text, checked: inout Bool) -> Int32 {
        GuiCheckBox(bounds, text, &checked)
    }
}