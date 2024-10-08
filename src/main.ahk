#SingleInstance Force
#UseHook
SendMode "Input"

^-::ExitApp
^+-::Reload

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

; custom hotkeys, this file is ignored by Git
#Include *i custom.ahk

; add hotkey for remap in programs
; currently used in IDEA and OBS
`::F13
; another special hotkey, currently used as a trigger for Keypirinha
/::F14
`; & `::F15
sc056 & `::F15
CapsLock & `::F16

]::^#Right
[::^#Left

RAlt::AppsKey

RShift::WinMinimize "A"
`; & RShift::!F4
sc056 & RShift::!F4

; send clipboard as characters (useful in VirtualBox)
#+^v::SendText(A_Clipboard)

#HotIf WinActive("ahk_exe firefox.exe") or WinActive("ahk_exe msedge.exe")
	-:: {
		Send "{End}{Space}site:reddit.com"
		Sleep 200
		Send "{Enter}"
	}
	!-:: {
		Send "{End}{Space}site:news.ycombinator.com"
		Sleep 200
		Send "{Enter}"
	}
	!+=:: {
		Send "^l"
		Sleep 50
		Send "{Home}https://web.archive.org/web/*/{Enter}"
	}
	=:: {
		Send "/"
		Sleep 50
		Send "{End}{Space}{!}g{Enter}"
	}
	!=:: {
		Send "^l"
		Sleep 50
		Send "{Home}farside.link/_/{Enter}"
	}
#HotIf

#HotIf WinActive("ahk_exe explorer.exe")
	; simplest way I found to reliably create a new text file
	^q::Send "!hw{Up}{Up}{Enter}"
#HotIf

#HotIf WinActive("ahk_exe salamand.exe")
	; Altap Salamander needs NumpadDiv hotkey to open the terminal, I don't have numpad on my laptop, so we override
	;  the default / with NumPadDiv
    CapsLock & q::NumPadDiv
#HotIf

; toggle mic mute (triggered by Fn+b on my laptop)
Pause::{
    ; adapted from https://www.autohotkey.com/boards/viewtopic.php?t=15509
    MicID := 12
    SoundSetMute(-1,, MicID)

    ToolTip("Mic " (SoundGetMute(, MicID) ? "Off" : "On"))
    ; remove the tooltip after 600ms
    SetTimer(ToolTip, -600)
}