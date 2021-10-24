gui_switcher := Gui()
gui_switcher.Opt("+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
gui_switcher.BackColor := 0x900000
gui_switcher.Show("Hide x0 y1030 w1920 h50")

gui_indicator := Gui()
gui_indicator.Opt("+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
gui_indicator.BackColor := 0x900000
gui_indicator.Show("x1899 y1030 w21 h50 NA") ; NA so that it doesn't draw focus

; hide mode indicator
^PrintScreen::gui_indicator.Hide()
; show mode indicator
+PrintScreen::gui_indicator.Show("NA")


UpdateGuiModeIndicator() {
	gui_indicator.BackColor := navMode ? "green" : 0x900000
	gui_switcher.BackColor := navMode ? "green" : 0x900000
	gui_switcher.Show("NA")
	DllCall("AnimateWindow", "UInt", gui_switcher.Hwnd, "Int", 200, "UInt", navMode ? 0x50004 : 0x50008)
}
