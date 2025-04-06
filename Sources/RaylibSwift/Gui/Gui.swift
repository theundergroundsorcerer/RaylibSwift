import CRaygui

public enum Gui {
    /// Slider Bar control
    public static func sliderBar(
        bounds: Rectangle,
        textLeft: Text,
        textRight: Text,
        value: inout Float,
        minValue: Float,
        maxValue: Float
    ) -> Int32 {
        textLeft.withCString { leftTextPtr in
            textRight.withCString { rightTextPtr in
                withUnsafeMutablePointer(to: &value) { valuePtr in
                    CRaygui.GuiSliderBar(
                        bounds, leftTextPtr, rightTextPtr, valuePtr, minValue, maxValue)
                }
            }
        }
    }

    /// Check Box control, returns true when active
    public static func checkBox(bounds: Rectangle, text: Text, checked: inout Bool) -> Int32 {
        text.withCString { textPtr in
            withUnsafeMutablePointer(to: &checked) { checkedPtr in
                CRaygui.GuiCheckBox(bounds, textPtr, checkedPtr)
            }
        }
    }
}
