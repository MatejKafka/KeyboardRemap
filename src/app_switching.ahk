; this is necessary, as otherwise windows on other virtual desktops are not detected (Win 10 21H1)
; however, each visible GUI window apparently also has multiple supporting invisible windows, running under the same process
; therefore, when searching for a window, we'll list all windows under the process, and find the visible one and activate it
DetectHiddenWindows(True)

TryFocusWindowSingle(winSpecifier) {
	Hwnds := WinGetList(winSpecifier)
	if (Hwnds.Length = 0) {
		return false ; no matching windows
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

TryFocusWindow(winSpecifiers) {
	winSpecifiers := IsObject(winSpecifiers) ? winSpecifiers : [winSpecifiers]
	for (winSpecifier in winSpecifiers) {
		if (TryFocusWindowSingle(winSpecifier)) {
			return true
		}
	}
	return false
}

RunProgram(winSpecifier, programCmdLine) {
	Run(programCmdLine)
	; we want to wait for a visible window, which will be on our virtual desktop, so this is ok
	CurrentDHWValue := A_DetectHiddenWindows
	DetectHiddenWindows(False)
	WinWait(winSpecifier)
	DetectHiddenWindows(CurrentDHWValue)
	TryFocusWindow(winSpecifier)
}

ActivateProgram(winSpecifiers, programCmdLine) {
	winSpecifiers := IsObject(winSpecifiers) ? winSpecifiers : [winSpecifiers]
	if (TryFocusWindow(winSpecifiers)) {
		return ; found an existing window and focused it
	}
	; we did not find any matching window, run the program
	RunProgram(winSpecifiers[1], programCmdLine)
}

ActivatePogShortcut(programWindowSpecifiers, programLnkName, arguments := "") {
	ActivateProgram(programWindowSpecifiers, A_StartMenu . "\Pog\" . programLnkName . ".lnk " . arguments)
}
ActivateCustomShortcut(programWindowSpecifiers, programLnkName, arguments := "") {
	ActivateProgram(programWindowSpecifiers, A_ScriptDir . "\..\..\data\shortcuts\" . programLnkName . ".lnk " . arguments)
}


\::LWin

;#e::#e
\ & e::#e
;#r::#r
\ & r::#r
;#v::#v
;\ & v::#v
#d::#d
\ & d::#d
#i::#i
\ & i::#i

\ & f::
#f::ActivatePogShortcut("ahk_exe firefox.exe", "Firefox")
\ & w::
#w::ActivatePogShortcut(["ahk_exe Code.exe", "ahk_exe WINWORD.EXE"], "Visual Studio Code (VS Code)")
\ & z::
#z::ActivatePogShortcut("ahk_exe Telegram.exe", "Telegram")
\ & k::
#k::ActivatePogShortcut("ahk_exe ProcessHacker.exe", "ProcessHacker")
\ & t::
#t::ActivatePogShortcut(["ahk_exe clion64.exe", "ahk_exe idea64.exe"], "CLion")
\ & o::
#o::ActivatePogShortcut("ahk_exe notepad++.exe", "Notepad++")
\ & b::
#b::ActivatePogShortcut(["ahk_exe Discord.exe", "ahk_exe Ripcord.exe"], "Discord")

\ & q::
#q::ActivateProgram("ahk_exe WindowsTerminal.exe", "wt.exe")
\ & s::
#s::ActivateCustomShortcut("ahk_exe salamand.exe", "Altap Salamander (x64)")
\ & a::
#a::ActivateCustomShortcut("ahk_exe VmConnect.exe", "Hyper-V Manager")
\ & j::
#j::ActivateCustomShortcut("ahk_exe Signal.exe", "Signal")
\ & c::
#c::ActivateCustomShortcut("ahk_exe Spotify.exe", "Spotify")
\ & m::
#m::ActivateCustomShortcut(["ahk_exe Typora.exe", "ahk_exe Acrobat.exe"], "Typora")
\ & h::
#h::ActivateCustomShortcut("ahk_exe SandMan.exe", "Sandboxie-Plus")

+#i::Run("explorer.exe ms-availablenetworks:")

\ & n::
#n:: {
	; for Edge, I only want to find windows on the same virtual desktop
	DetectHiddenWindows False
	ActivateCustomShortcut("ahk_exe msedge.exe", "Microsoft Edge")
	DetectHiddenWindows True
}

+#n:: {
	; for Edge, I want to only find windows on the same virtual desktop
	DetectHiddenWindows False
	ActivateCustomShortcut("[InPrivate] ahk_exe msedge.exe", "Microsoft Edge",
			"--profile-directory=`"Profile 1`" --inprivate")
	DetectHiddenWindows True
}

+#f:: {
	ActivatePogShortcut("(Private Browsing) ahk_exe firefox.exe", "Firefox", "-private-window")
}