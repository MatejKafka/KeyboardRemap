x_pos := A_ScreenWidth - 21
y_pos := A_ScreenHeight - 50

gui_switcher := Gui()
gui_switcher.Opt("+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
gui_switcher.BackColor := 0x900000
gui_switcher.Show("Hide x0 y" y_pos " w" A_ScreenWidth " h50")

gui_indicator := Gui()
gui_indicator.Opt("+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
gui_indicator.BackColor := 0x900000
gui_indicator.Show("x" x_pos " y" y_pos " w21 h50 NA") ; NA so that it doesn't draw focus

; hide mode indicator
^PrintScreen::gui_indicator.Hide()
; show mode indicator
+PrintScreen::gui_indicator.Show("NA")

; 0x7E = WM_DISPLAYCHANGE (display configuration changed, triggered when a monitor is (dis)connected)
OnMessage(0x007E, WM_DISPLAYCHANGE)
WM_DISPLAYCHANGE(wParam, lParam, msg, hwnd) {
	; need a delay before the Reload, since apparently AHK receives multiple events in quick succession,
	;  and without the delay, it creates ~3 new duplicate AHK processes instead of just one
	Sleep(1000)
	Reload()
}

UpdateGuiModeIndicator() {
	gui_indicator.BackColor := navMode ? "green" : 0x900000
	gui_switcher.BackColor := navMode ? "green" : 0x900000
	gui_switcher.Show("NA")
	DllCall("AnimateWindow", "UInt", gui_switcher.Hwnd, "Int", 200, "UInt", navMode ? 0x50004 : 0x50008)
}
