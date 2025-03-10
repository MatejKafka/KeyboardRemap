#SingleInstance Force
#UseHook

; see the following link for explanation of why we're using SendEvent instead of SendInput (the default):
;  https://www.autohotkey.com/boards/viewtopic.php?f=96&t=127074
SendMode "Event"
SetKeyDelay(-1, 0)

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
		SendInput "{End}{Space}site:reddit.com"
		Sleep 200
		SendInput "{Enter}"
	}
	!-:: {
		SendInput "{End}{Space}site:news.ycombinator.com"
		Sleep 200
		SendInput "{Enter}"
	}
	!+=:: {
		SendInput "^l"
		Sleep 50
		SendInput "{Home}https://web.archive.org/web/*/{Enter}"
	}
	=:: {
		SendInput "/"
		Sleep 50
		SendInput "{End}{Space}{!}g{Enter}"
	}
	!=:: {
		SendInput "^l"
		Sleep 50
		SendInput "{Home}farside.link/_/{Enter}"
	}
#HotIf

#HotIf WinActive("ahk_exe explorer.exe")
	; simplest way I found to reliably create a new text file
	^q::SendInput "!hw{Up}{Up}{Enter}"
#HotIf

#HotIf WinActive("ahk_exe salamand.exe")
	; Altap Salamander needs NumpadDiv hotkey to open the terminal, I don't have numpad on my laptop, so we override
	;  the default / with NumPadDiv
    CapsLock & q::NumPadDiv
#HotIf

; toggle mic mute (triggered by Fn+b on my laptop)
Pause::{
    ; adapted from https://www.autohotkey.com/boards/viewtopic.php?t=15509
    MicID := 3
    SoundSetMute(-1,, MicID)

    ToolTip("Mic " (SoundGetMute(, MicID) ? "Off" : "On"))
    ; remove the tooltip after 600ms
    SetTimer(ToolTip, -600)
}

; list audio input devices
#Pause::{
	scGui := Gui(, "Sound Components")
	scLV := scGui.Add('ListView', "w600 h400"
	    , ["Component", "#", "Device", "Volume", "Mute"])

	devMap := Map()

	loop {
	    ; For each loop iteration, try to get the corresponding device.
	    try
	        devName := SoundGetName(, dev := A_Index)
	    catch  ; No more devices.
	        break

	    ; Qualify names with ":index" where needed.
	    devName := Qualify(devName, devMap, dev)

	    ; Retrieve master volume and mute setting, if possible.
	    vol := mute := ""
	    try vol := Round(SoundGetVolume( , dev), 2)
	    try mute := SoundGetMute( , dev)

	    ; Display the master settings only if at least one was retrieved.
	    if vol != "" || mute != ""
	        scLV.Add("", "", dev, devName, vol, mute)

	    ; For each component, first query its name.
	    cmpMap := Map()

	    loop
	    {
	        try
	            cmpName := SoundGetName(cmp := A_Index, dev)
	        catch
	            break
	        ; Retrieve this component's volume and mute setting, if possible.
	        vol := mute := ""
	        try vol := Round(SoundGetVolume(cmp, dev), 2)
	        try mute := SoundGetMute(cmp, dev)
	        ; Display this component even if it does not support volume or mute,
	        ; since it likely supports other controls via SoundGetInterface().
	        scLV.Add("", Qualify(cmpName, cmpMap, A_Index), dev, devName, vol, mute)
	    }
	}

	scGui.Show()

	; Qualifies full names with ":index" when needed.
	Qualify(name, names, overallIndex) {
	    if name = ''
	        return overallIndex
	    key := StrLower(name)
	    index := names.Has(key) ? ++names[key] : (names[key] := 1)
	    return (index > 1 || InStr(name, ':') || IsInteger(name)) ? name ':' index : name
	}
}