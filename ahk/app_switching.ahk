; this is necessary, as otherwise windows on other virtual desktops are not detected
; however, each visible GUI window apparently also has multiple supporting invisible windows, running under the same process
; therefore, when searching for a window, we'll list all windows under the process, and find the visible one and activate it
DetectHiddenWindows True

TryFocusProgram(winNames) {
	for (winName in winNames) {
		Hwnds := WinGetList("ahk_exe " . winName)
		if (Hwnds.Length = 0) {
			continue ; no matching windows
		}
		; find a visible window running under the process
		for Hwnd in Hwnds {
			; 0x10000000 = WS_VISIBLE (the window is visible)
			if (WinGetStyle(Hwnd) & 0x10000000) {
				WinActivate(Hwnd)
				return true
			}
		}
	}
	return false
}

ActivateProgram(winNames, programPath) {
	winNames := IsObject(winNames) ? winNames : [winNames]
	if (TryFocusProgram(winNames)) {
		return ; found an existing window and focused it
	}
	; we did not find any matching window, run the program
	Run(programPath)
	WinWait("ahk_exe " . winNames[1])
	TryFocusProgram(winNames)
}

ActivatePkgShortcut(programWindowName, programLnkName) {
	ActivateProgram(programWindowName, A_StartMenu . "\Pog\" . programLnkName . ".lnk")
}
ActivateCustomShortcut(programWindowName, programLnkName) {
	ActivateProgram(programWindowName, A_ScriptDir . "\..\..\data\shortcuts\" . programLnkName . ".lnk")
}


\::LWin

#e::#e
\ & e::#e
#r::#r
\ & r::#r
;#v::#v
;\ & v::#v
#d::#d
\ & d::#d
#i::#i
\ & i::#i

\ & f::
#f::ActivatePkgShortcut("firefox.exe", "Firefox")
\ & w::
#w::ActivatePkgShortcut("Code.exe", "Visual Studio Code (VS Code)")
\ & z::
#z::ActivatePkgShortcut("Telegram.exe", "Telegram")
\ & k::
#k::ActivatePkgShortcut("ProcessHacker.exe", "ProcessHacker")
\ & t::
#t::ActivatePkgShortcut("clion64.exe", "CLion")
\ & o::
#o::ActivatePkgShortcut(["notepad++.exe", "idea64.exe"], "Notepad++")
\ & b::
#b::ActivatePkgShortcut(["Discord.exe", "Ripcord.exe"], "Discord")

\ & s::
#s::ActivateCustomShortcut("salamand.exe", "Altap Salamander (x64)")
\ & q::
#q::ActivateProgram("WindowsTerminal.exe", "wt.exe")
\ & a::
#a::ActivateCustomShortcut("VmConnect.exe", "Hyper-V Manager")
\ & j::
#j::ActivateCustomShortcut("Signal.exe", "Signal")
\ & c::
#c::ActivateCustomShortcut("Spotify.exe", "Spotify")
\ & m::
#m::ActivateCustomShortcut("msedge.exe", "Microsoft Edge")
\ & n::
#n::ActivateCustomShortcut("Typora.exe", "Typora")
\ & h::
#h::ActivateCustomShortcut("SandMan.exe", "Sandboxie-Plus")
