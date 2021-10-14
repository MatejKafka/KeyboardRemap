#SingleInstance Force

gui_switcher := Gui()
gui_switcher.Opt("+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
gui_switcher.BackColor := 0x900000
gui_switcher.Show("Hide x0 y1030 w1920 h50")

gui_indicator := Gui()
gui_indicator.Opt("+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
gui_indicator.BackColor := 0x900000
gui_indicator.Show("x1899 y1030 w21 h50")


^F12::ExitApp

+F16::!F4

F16::
	If WinActive("ahk_exe VmConnect.exe") {
		WinActivate("ahk_exe mmc.exe")
	} else {
		WinMinimize("A")
	}
return

+F14::
	Gui, indicator:Color, green
	Gui, switcher:Color, green
	Gui, switcher:Show, NA
	DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50004")
return

^F14::
	Gui, indicator:Color, 0x900000
	Gui, switcher:Color, 0x900000
	Gui, switcher:Show, NA
	DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50008")
return

^F15::Gui, indicator:Hide

+F15::
	Gui, indicator:Show, NA
return

If (WinActive("ahk_exe salamand.exe")) {
	; hotkey: /::NumPadDiv
		/::
			SendInput, {Blind}{NumPadDiv Down}
		return
		/ Up::
			SendInput, {Blind}{NumPadDiv Up}
		return
}

#w::
	If (WinExist("ahk_exe notepad++.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\Notepad++.lnk, C:/
		WinWait, ahk_exe notepad++.exe
		WinActivate
	}
return

#f::
	If (WinExist("ahk_exe firefox.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\Firefox.lnk, C:/
		WinWait, ahk_exe firefox.exe
		WinActivate
	}
return

#z::
	If (WinExist("ahk_exe Telegram.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\Telegram.lnk, C:/
		WinWait, ahk_exe Telegram.exe
		WinActivate
	}
return

#k::
	If (WinExist("ahk_exe ProcessHacker.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\ProcessHacker.lnk, C:/
		WinWait, ahk_exe ProcessHacker.exe
		WinActivate
	}
return

#t::
	If (WinExist("ahk_exe clion64.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\CLion 2021.2.lnk, C:/
		WinWait, ahk_exe clion64.exe
		WinActivate
	}
return

#s::
	If (WinExist("ahk_exe salamand.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/../../data/shortcuts/Altap Salamander (x64).lnk, C:/
		WinWait, ahk_exe salamand.exe
		WinActivate
	}
return

#q::
	If (WinExist("ahk_exe WindowsTerminal.exe")) {
		WinActivate
	} else {
		Run, wt.exe, C:/
		WinWait, ahk_exe WindowsTerminal.exe
		WinActivate
	}
return

#a::
	If (WinExist("ahk_exe VmConnect.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/../../data/shortcuts/Hyper-V Manager.lnk, C:/
		WinWait, ahk_exe VmConnect.exe
		WinActivate
	}
return

#j::
	If (WinExist("ahk_exe Signal.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/../../data/shortcuts/Signal.lnk, C:/
		WinWait, ahk_exe Signal.exe
		WinActivate
	}
return

#c::
	If (WinExist("ahk_exe Spotify.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/../../data/shortcuts/Spotify.lnk, C:/
		WinWait, ahk_exe Spotify.exe
		WinActivate
	}
return

#m::
	If (WinExist("ahk_exe msedge.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/../../data/shortcuts/Microsoft Edge.lnk, C:/
		WinWait, ahk_exe msedge.exe
		WinActivate
	}
return

#n::
	If (WinExist("ahk_exe Typora.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/../../data/shortcuts/Typora.lnk, C:/
		WinWait, ahk_exe Typora.exe
		WinActivate
	}
return

#b::
	If (WinExist("ahk_exe Discord.exe")) {
		WinActivate
	} else {
		If (WinExist("ahk_exe Ripcord.exe")) {
			WinActivate
		} else {
			Run, %A_StartMenu%\Pkg\Discord.lnk, C:/
			WinWait, ahk_exe Discord.exe
			WinActivate
		}
	}
return

#o::
	If (WinExist("ahk_exe Code.exe")) {
		WinActivate
	} else {
		If (WinExist("ahk_exe idea64.exe")) {
			WinActivate
		} else {
			Run, %A_StartMenu%\Pkg\IntelliJ IDEA.lnk, C:/
			WinWait, ahk_exe idea64.exe
			WinActivate
		}
	}
return

#1::
	WinActivate, ahk_id %bindable_0%
return

#+1::
	WinGet, bindable_0, ID, A
	WinGet, bind_tmp_title, ProcessName, A
	MsgBox, Window of [%bind_tmp_title%] now bound to key combination [Win+1].
return

#2::
	WinActivate, ahk_id %bindable_0%
return

#+2::
	WinGet, bindable_0, ID, A
	WinGet, bind_tmp_title, ProcessName, A
	MsgBox, Window of [%bind_tmp_title%] now bound to key combination [Win+2].
return

#3::
	WinActivate, ahk_id %bindable_0%
return

#+3::
	WinGet, bindable_0, ID, A
	WinGet, bind_tmp_title, ProcessName, A
	MsgBox, Window of [%bind_tmp_title%] now bound to key combination [Win+3].
return