#SingleInstance Force
#UseHook
SendMode "Input"

^F12::ExitApp
^!F12::Suspend
^+F12::Reload

; disable default function of CapsLock, toggle it with Ctrl-Alt-CapsLock instead
SetCapsLockState("AlwaysOff")
^!CapsLock::SetCapsLockState(GetKeyState("CapsLock", "T") = 1 ? "AlwaysOff" : "AlwaysOn")

#Include gui.ahk

navMode := false
SwitchMode(shouldActivateNavMode) {
	global navMode := shouldActivateNavMode
	UpdateGuiModeIndicator
}

#Include special_chars.ahk

#HotIf navMode
	#Include nav_mode.ahk
#HotIf

#HotIf !navMode
	#Include normal_mode.ahk
#HotIf

#Include app_switching.ahk


; add hotkey for remap in programs
; currently used in IDEA and OBS
`::F13
; another special hotkey, currently used as a trigger for Keypirinha
/::F14

]::^#Right
[::^#Left

RAlt::AppsKey

RShift::WinMinimize "A"
`; & RShift::!F4
sc056 & RShift::!F4

-:: {
	Send "{End}{Space}site:reddit.com"
	Sleep 100
	Send "{Enter}"
}
=:: {
	Send "/"
	Sleep 50
	Send "{End}{Space}{!}g{Enter}"
}

#HotIf WinActive("ahk_exe explorer.exe")
	; simplest way I found to reliably create a new text file
	^q::Send "!hw{Up}{Up}{Up}{Enter}"
#HotIf