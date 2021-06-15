#SingleInstance Force

BrowserMode := false

Gui, switcher:New

Gui, switcher:+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000

Gui, switcher:Color, 0x900000

Gui, switcher:Show, x0 y1030 w1920 h50 Hide

Gui, switcher:+LastFound

guiID := WinExist()

Gui, indicator:New

Gui, indicator:+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000

Gui, indicator:Color, 0x900000

Gui, indicator:Show, x1899 y1030 w21 h50 NA

SetCapsLockState, AlwaysOff

^!CapsLock::
	If (GetKeyState("CapsLock", "T") = 1) {
		SetCapsLockState, AlwaysOff
	} else {
		SetCapsLockState, AlwaysOn
	}
return

^f12::
	ExitApp
return

; hotkey: /::NumpadDiv
	/::
		SendInput, {Blind}{NumpadDiv Down}
	return
	/ Up::
		SendInput, {Blind}{NumpadDiv Up}
	return

; hotkey: \::LWin
	\::
		SendInput, {Blind}{LWin Down}
	return
	\ Up::
		SendInput, {Blind}{LWin Up}
	return

CapsLock & =::
	SendInput {Space}site:reddit.com
	Sleep 100
	SendInput {Enter}
return

CapsLock & -::
	SendInput /
	Sleep 50
	SendInput {End}{Space}{!}g{Enter}
return

; hotkey: \ & e::LWin & e
	\ & e::
		SendInput, {Blind}{LWin Down}{e Down}
	return
	\ & e Up::
		SendInput, {Blind}{LWin Up}{e Up}
	return

; hotkey: \ & r::LWin & r
	\ & r::
		SendInput, {Blind}{LWin Down}{r Down}
	return
	\ & r Up::
		SendInput, {Blind}{LWin Up}{r Up}
	return

; hotkey: \ & g::LWin & g
	\ & g::
		SendInput, {Blind}{LWin Down}{g Down}
	return
	\ & g Up::
		SendInput, {Blind}{LWin Up}{g Up}
	return

; hotkey: \ & v::LWin & v
	\ & v::
		SendInput, {Blind}{LWin Down}{v Down}
	return
	\ & v Up::
		SendInput, {Blind}{LWin Up}{v Up}
	return

; hotkey: \ & x::LWin & x
	\ & x::
		SendInput, {Blind}{LWin Down}{x Down}
	return
	\ & x Up::
		SendInput, {Blind}{LWin Up}{x Up}
	return

\ & w::
	If (WinExist("ahk_exe notepad++.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\Notepad++.lnk, C:/
		WinWait, ahk_exe notepad++.exe
		WinActivate
	}
return

\ & f::
	If (WinExist("ahk_exe firefox.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\Firefox.lnk, C:/
		WinWait, ahk_exe firefox.exe
		WinActivate
	}
return

\ & z::
	If (WinExist("ahk_exe Telegram.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\Telegram.lnk, C:/
		WinWait, ahk_exe Telegram.exe
		WinActivate
	}
return

\ & k::
	If (WinExist("ahk_exe ProcessHacker.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\ProcessHacker.lnk, C:/
		WinWait, ahk_exe ProcessHacker.exe
		WinActivate
	}
return

\ & t::
	If (WinExist("ahk_exe clion64.exe")) {
		WinActivate
	} else {
		Run, %A_StartMenu%\Pkg\CLion 2020.3.3.lnk, C:/
		WinWait, ahk_exe clion64.exe
		WinActivate
	}
return

\ & s::
	If (WinExist("ahk_exe salamand.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Altap Salamander (x64).lnk, C:/
		WinWait, ahk_exe salamand.exe
		WinActivate
	}
return

\ & q::
	If (WinExist("ahk_exe WindowsTerminal.exe")) {
		WinActivate
	} else {
		Run, wt.exe, C:/
		WinWait, ahk_exe WindowsTerminal.exe
		WinActivate
	}
return

\ & a::
	If (WinExist("ahk_exe VmConnect.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Hyper-V Manager.lnk, C:/
		WinWait, ahk_exe VmConnect.exe
		WinActivate
	}
return

\ & j::
	If (WinExist("ahk_exe Signal.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Signal.lnk, C:/
		WinWait, ahk_exe Signal.exe
		WinActivate
	}
return

\ & c::
	If (WinExist("ahk_exe Spotify.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Spotify.lnk, C:/
		WinWait, ahk_exe Spotify.exe
		WinActivate
	}
return

\ & m::
	If (WinExist("ahk_exe msedge.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Microsoft Edge.lnk, C:/
		WinWait, ahk_exe msedge.exe
		WinActivate
	}
return

\ & n::
	If (WinExist("ahk_exe Typora.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Typora.lnk, C:/
		WinWait, ahk_exe Typora.exe
		WinActivate
	}
return

\ & b::
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

\ & o::
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
		Run, %A_StartMenu%\Pkg\CLion 2020.3.3.lnk, C:/
		WinWait, ahk_exe clion64.exe
		WinActivate
	}
return

#s::
	If (WinExist("ahk_exe salamand.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Altap Salamander (x64).lnk, C:/
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
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Hyper-V Manager.lnk, C:/
		WinWait, ahk_exe VmConnect.exe
		WinActivate
	}
return

#j::
	If (WinExist("ahk_exe Signal.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Signal.lnk, C:/
		WinWait, ahk_exe Signal.exe
		WinActivate
	}
return

#c::
	If (WinExist("ahk_exe Spotify.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Spotify.lnk, C:/
		WinWait, ahk_exe Spotify.exe
		WinActivate
	}
return

#m::
	If (WinExist("ahk_exe msedge.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Microsoft Edge.lnk, C:/
		WinWait, ahk_exe msedge.exe
		WinActivate
	}
return

#n::
	If (WinExist("ahk_exe Typora.exe")) {
		WinActivate
	} else {
		Run, D:\_custom\keyboard_remap\app\ahk/shortcuts/Typora.lnk, C:/
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

#If BrowserMode
	'::
		BrowserMode := false
		Gui, indicator:Color, 0x900000
		Gui, switcher:Color, 0x900000
		Gui, switcher:Show, NA
		DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50008")
	return
	CapsLock & Escape::
		BrowserMode := false
		Gui, indicator:Color, 0x900000
		Gui, switcher:Color, 0x900000
		Gui, switcher:Show, NA
		DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50008")
	return
	1::
		BrowserMode := false
		Gui, indicator:Color, 0x900000
		Gui, switcher:Color, 0x900000
		Gui, switcher:Show, NA
		DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50008")
	return
	2::^#Left
	4::^#Right
	; hotkey: sc056 & q::q
		sc056 & q::
			SendInput, {Blind}{q Down}
		return
		sc056 & q Up::
			SendInput, {Blind}{q Up}
		return
	; hotkey: sc056 & w::w
		sc056 & w::
			SendInput, {Blind}{w Down}
		return
		sc056 & w Up::
			SendInput, {Blind}{w Up}
		return
	; hotkey: sc056 & e::e
		sc056 & e::
			SendInput, {Blind}{e Down}
		return
		sc056 & e Up::
			SendInput, {Blind}{e Up}
		return
	; hotkey: sc056 & r::r
		sc056 & r::
			SendInput, {Blind}{r Down}
		return
		sc056 & r Up::
			SendInput, {Blind}{r Up}
		return
	; hotkey: sc056 & t::t
		sc056 & t::
			SendInput, {Blind}{t Down}
		return
		sc056 & t Up::
			SendInput, {Blind}{t Up}
		return
	; hotkey: sc056 & y::y
		sc056 & y::
			SendInput, {Blind}{y Down}
		return
		sc056 & y Up::
			SendInput, {Blind}{y Up}
		return
	; hotkey: sc056 & u::u
		sc056 & u::
			SendInput, {Blind}{u Down}
		return
		sc056 & u Up::
			SendInput, {Blind}{u Up}
		return
	; hotkey: sc056 & i::i
		sc056 & i::
			SendInput, {Blind}{i Down}
		return
		sc056 & i Up::
			SendInput, {Blind}{i Up}
		return
	; hotkey: sc056 & o::o
		sc056 & o::
			SendInput, {Blind}{o Down}
		return
		sc056 & o Up::
			SendInput, {Blind}{o Up}
		return
	; hotkey: sc056 & p::p
		sc056 & p::
			SendInput, {Blind}{p Down}
		return
		sc056 & p Up::
			SendInput, {Blind}{p Up}
		return
	; hotkey: sc056 & a::a
		sc056 & a::
			SendInput, {Blind}{a Down}
		return
		sc056 & a Up::
			SendInput, {Blind}{a Up}
		return
	; hotkey: sc056 & s::s
		sc056 & s::
			SendInput, {Blind}{s Down}
		return
		sc056 & s Up::
			SendInput, {Blind}{s Up}
		return
	; hotkey: sc056 & d::d
		sc056 & d::
			SendInput, {Blind}{d Down}
		return
		sc056 & d Up::
			SendInput, {Blind}{d Up}
		return
	; hotkey: sc056 & f::f
		sc056 & f::
			SendInput, {Blind}{f Down}
		return
		sc056 & f Up::
			SendInput, {Blind}{f Up}
		return
	; hotkey: sc056 & g::g
		sc056 & g::
			SendInput, {Blind}{g Down}
		return
		sc056 & g Up::
			SendInput, {Blind}{g Up}
		return
	; hotkey: sc056 & h::h
		sc056 & h::
			SendInput, {Blind}{h Down}
		return
		sc056 & h Up::
			SendInput, {Blind}{h Up}
		return
	; hotkey: sc056 & j::j
		sc056 & j::
			SendInput, {Blind}{j Down}
		return
		sc056 & j Up::
			SendInput, {Blind}{j Up}
		return
	; hotkey: sc056 & k::k
		sc056 & k::
			SendInput, {Blind}{k Down}
		return
		sc056 & k Up::
			SendInput, {Blind}{k Up}
		return
	; hotkey: sc056 & l::l
		sc056 & l::
			SendInput, {Blind}{l Down}
		return
		sc056 & l Up::
			SendInput, {Blind}{l Up}
		return
	; hotkey: sc056 & z::z
		sc056 & z::
			SendInput, {Blind}{z Down}
		return
		sc056 & z Up::
			SendInput, {Blind}{z Up}
		return
	; hotkey: sc056 & x::x
		sc056 & x::
			SendInput, {Blind}{x Down}
		return
		sc056 & x Up::
			SendInput, {Blind}{x Up}
		return
	; hotkey: sc056 & c::c
		sc056 & c::
			SendInput, {Blind}{c Down}
		return
		sc056 & c Up::
			SendInput, {Blind}{c Up}
		return
	; hotkey: sc056 & v::v
		sc056 & v::
			SendInput, {Blind}{v Down}
		return
		sc056 & v Up::
			SendInput, {Blind}{v Up}
		return
	; hotkey: sc056 & b::b
		sc056 & b::
			SendInput, {Blind}{b Down}
		return
		sc056 & b Up::
			SendInput, {Blind}{b Up}
		return
	; hotkey: sc056 & n::n
		sc056 & n::
			SendInput, {Blind}{n Down}
		return
		sc056 & n Up::
			SendInput, {Blind}{n Up}
		return
	; hotkey: sc056 & m::m
		sc056 & m::
			SendInput, {Blind}{m Down}
		return
		sc056 & m Up::
			SendInput, {Blind}{m Up}
		return
	; hotkey: sc056 & Space::Space
		sc056 & Space::
			SendInput, {Blind}{Space Down}
		return
		sc056 & Space Up::
			SendInput, {Blind}{Space Up}
		return
	; hotkey: sc056 & 0::0
		sc056 & 0::
			SendInput, {Blind}{0 Down}
		return
		sc056 & 0 Up::
			SendInput, {Blind}{0 Up}
		return
	; hotkey: sc056 & 1::1
		sc056 & 1::
			SendInput, {Blind}{1 Down}
		return
		sc056 & 1 Up::
			SendInput, {Blind}{1 Up}
		return
	; hotkey: sc056 & 2::2
		sc056 & 2::
			SendInput, {Blind}{2 Down}
		return
		sc056 & 2 Up::
			SendInput, {Blind}{2 Up}
		return
	; hotkey: sc056 & 3::3
		sc056 & 3::
			SendInput, {Blind}{3 Down}
		return
		sc056 & 3 Up::
			SendInput, {Blind}{3 Up}
		return
	; hotkey: sc056 & 4::4
		sc056 & 4::
			SendInput, {Blind}{4 Down}
		return
		sc056 & 4 Up::
			SendInput, {Blind}{4 Up}
		return
	; hotkey: sc056 & 5::5
		sc056 & 5::
			SendInput, {Blind}{5 Down}
		return
		sc056 & 5 Up::
			SendInput, {Blind}{5 Up}
		return
	; hotkey: sc056 & 6::6
		sc056 & 6::
			SendInput, {Blind}{6 Down}
		return
		sc056 & 6 Up::
			SendInput, {Blind}{6 Up}
		return
	; hotkey: sc056 & 7::7
		sc056 & 7::
			SendInput, {Blind}{7 Down}
		return
		sc056 & 7 Up::
			SendInput, {Blind}{7 Up}
		return
	; hotkey: sc056 & 8::8
		sc056 & 8::
			SendInput, {Blind}{8 Down}
		return
		sc056 & 8 Up::
			SendInput, {Blind}{8 Up}
		return
	; hotkey: sc056 & 9::9
		sc056 & 9::
			SendInput, {Blind}{9 Down}
		return
		sc056 & 9 Up::
			SendInput, {Blind}{9 Up}
		return
	; hotkey: `; & q::q
		`; & q::
			SendInput, {Blind}{q Down}
		return
		`; & q Up::
			SendInput, {Blind}{q Up}
		return
	; hotkey: `; & w::w
		`; & w::
			SendInput, {Blind}{w Down}
		return
		`; & w Up::
			SendInput, {Blind}{w Up}
		return
	; hotkey: `; & e::e
		`; & e::
			SendInput, {Blind}{e Down}
		return
		`; & e Up::
			SendInput, {Blind}{e Up}
		return
	; hotkey: `; & r::r
		`; & r::
			SendInput, {Blind}{r Down}
		return
		`; & r Up::
			SendInput, {Blind}{r Up}
		return
	; hotkey: `; & t::t
		`; & t::
			SendInput, {Blind}{t Down}
		return
		`; & t Up::
			SendInput, {Blind}{t Up}
		return
	; hotkey: `; & y::y
		`; & y::
			SendInput, {Blind}{y Down}
		return
		`; & y Up::
			SendInput, {Blind}{y Up}
		return
	; hotkey: `; & u::u
		`; & u::
			SendInput, {Blind}{u Down}
		return
		`; & u Up::
			SendInput, {Blind}{u Up}
		return
	; hotkey: `; & i::i
		`; & i::
			SendInput, {Blind}{i Down}
		return
		`; & i Up::
			SendInput, {Blind}{i Up}
		return
	; hotkey: `; & o::o
		`; & o::
			SendInput, {Blind}{o Down}
		return
		`; & o Up::
			SendInput, {Blind}{o Up}
		return
	; hotkey: `; & p::p
		`; & p::
			SendInput, {Blind}{p Down}
		return
		`; & p Up::
			SendInput, {Blind}{p Up}
		return
	; hotkey: `; & a::a
		`; & a::
			SendInput, {Blind}{a Down}
		return
		`; & a Up::
			SendInput, {Blind}{a Up}
		return
	; hotkey: `; & s::s
		`; & s::
			SendInput, {Blind}{s Down}
		return
		`; & s Up::
			SendInput, {Blind}{s Up}
		return
	; hotkey: `; & d::d
		`; & d::
			SendInput, {Blind}{d Down}
		return
		`; & d Up::
			SendInput, {Blind}{d Up}
		return
	; hotkey: `; & f::f
		`; & f::
			SendInput, {Blind}{f Down}
		return
		`; & f Up::
			SendInput, {Blind}{f Up}
		return
	; hotkey: `; & g::g
		`; & g::
			SendInput, {Blind}{g Down}
		return
		`; & g Up::
			SendInput, {Blind}{g Up}
		return
	; hotkey: `; & h::h
		`; & h::
			SendInput, {Blind}{h Down}
		return
		`; & h Up::
			SendInput, {Blind}{h Up}
		return
	; hotkey: `; & j::j
		`; & j::
			SendInput, {Blind}{j Down}
		return
		`; & j Up::
			SendInput, {Blind}{j Up}
		return
	; hotkey: `; & k::k
		`; & k::
			SendInput, {Blind}{k Down}
		return
		`; & k Up::
			SendInput, {Blind}{k Up}
		return
	; hotkey: `; & l::l
		`; & l::
			SendInput, {Blind}{l Down}
		return
		`; & l Up::
			SendInput, {Blind}{l Up}
		return
	; hotkey: `; & z::z
		`; & z::
			SendInput, {Blind}{z Down}
		return
		`; & z Up::
			SendInput, {Blind}{z Up}
		return
	; hotkey: `; & x::x
		`; & x::
			SendInput, {Blind}{x Down}
		return
		`; & x Up::
			SendInput, {Blind}{x Up}
		return
	; hotkey: `; & c::c
		`; & c::
			SendInput, {Blind}{c Down}
		return
		`; & c Up::
			SendInput, {Blind}{c Up}
		return
	; hotkey: `; & v::v
		`; & v::
			SendInput, {Blind}{v Down}
		return
		`; & v Up::
			SendInput, {Blind}{v Up}
		return
	; hotkey: `; & b::b
		`; & b::
			SendInput, {Blind}{b Down}
		return
		`; & b Up::
			SendInput, {Blind}{b Up}
		return
	; hotkey: `; & n::n
		`; & n::
			SendInput, {Blind}{n Down}
		return
		`; & n Up::
			SendInput, {Blind}{n Up}
		return
	; hotkey: `; & m::m
		`; & m::
			SendInput, {Blind}{m Down}
		return
		`; & m Up::
			SendInput, {Blind}{m Up}
		return
	; hotkey: `; & Space::Space
		`; & Space::
			SendInput, {Blind}{Space Down}
		return
		`; & Space Up::
			SendInput, {Blind}{Space Up}
		return
	; hotkey: `; & 0::0
		`; & 0::
			SendInput, {Blind}{0 Down}
		return
		`; & 0 Up::
			SendInput, {Blind}{0 Up}
		return
	; hotkey: `; & 1::1
		`; & 1::
			SendInput, {Blind}{1 Down}
		return
		`; & 1 Up::
			SendInput, {Blind}{1 Up}
		return
	; hotkey: `; & 2::2
		`; & 2::
			SendInput, {Blind}{2 Down}
		return
		`; & 2 Up::
			SendInput, {Blind}{2 Up}
		return
	; hotkey: `; & 3::3
		`; & 3::
			SendInput, {Blind}{3 Down}
		return
		`; & 3 Up::
			SendInput, {Blind}{3 Up}
		return
	; hotkey: `; & 4::4
		`; & 4::
			SendInput, {Blind}{4 Down}
		return
		`; & 4 Up::
			SendInput, {Blind}{4 Up}
		return
	; hotkey: `; & 5::5
		`; & 5::
			SendInput, {Blind}{5 Down}
		return
		`; & 5 Up::
			SendInput, {Blind}{5 Up}
		return
	; hotkey: `; & 6::6
		`; & 6::
			SendInput, {Blind}{6 Down}
		return
		`; & 6 Up::
			SendInput, {Blind}{6 Up}
		return
	; hotkey: `; & 7::7
		`; & 7::
			SendInput, {Blind}{7 Down}
		return
		`; & 7 Up::
			SendInput, {Blind}{7 Up}
		return
	; hotkey: `; & 8::8
		`; & 8::
			SendInput, {Blind}{8 Down}
		return
		`; & 8 Up::
			SendInput, {Blind}{8 Up}
		return
	; hotkey: `; & 9::9
		`; & 9::
			SendInput, {Blind}{9 Down}
		return
		`; & 9 Up::
			SendInput, {Blind}{9 Up}
		return
	7::
		MsgBox nope
	return
	8::
		MsgBox nope
	return
	; hotkey: *0::^Tab
		*0::
			SendInput, {Blind}{Ctrl Down}{Tab Down}
		return
		*0 Up::
			SendInput, {Blind}{Ctrl Up}{Tab Up}
		return
	; hotkey: *3::^l
		*3::
			SendInput, {Blind}{Ctrl Down}{l Down}
		return
		*3 Up::
			SendInput, {Blind}{Ctrl Up}{l Up}
		return
	; hotkey: *5::!Tab
		*5::
			SendInput, {Blind}{Alt Down}{Tab Down}
		return
		*5 Up::
			SendInput, {Blind}{Alt Up}{Tab Up}
		return
	; hotkey: *9::^+Tab
		*9::
			SendInput, {Blind}{Ctrl Down}{Shift Down}{Tab Down}
		return
		*9 Up::
			SendInput, {Blind}{Ctrl Up}{Shift Up}{Tab Up}
		return
	; hotkey: *a::Escape
		*a::
			SendInput, {Blind}{Escape Down}
		return
		*a Up::
			SendInput, {Blind}{Escape Up}
		return
	; hotkey: *d::Up
		*d::
			SendInput, {Blind}{Up Down}
		return
		*d Up::
			SendInput, {Blind}{Up Up}
		return
	; hotkey: *f::Down
		*f::
			SendInput, {Blind}{Down Down}
		return
		*f Up::
			SendInput, {Blind}{Down Up}
		return
	; hotkey: *w::Left
		*w::
			SendInput, {Blind}{Left Down}
		return
		*w Up::
			SendInput, {Blind}{Left Up}
		return
	; hotkey: *r::Right
		*r::
			SendInput, {Blind}{Right Down}
		return
		*r Up::
			SendInput, {Blind}{Right Up}
		return
	; hotkey: *e::PgUp
		*e::
			SendInput, {Blind}{PgUp Down}
		return
		*e Up::
			SendInput, {Blind}{PgUp Up}
		return
	; hotkey: *s::PgDn
		*s::
			SendInput, {Blind}{PgDn Down}
		return
		*s Up::
			SendInput, {Blind}{PgDn Up}
		return
	; hotkey: *i::Left
		*i::
			SendInput, {Blind}{Left Down}
		return
		*i Up::
			SendInput, {Blind}{Left Up}
		return
	; hotkey: *k::Up
		*k::
			SendInput, {Blind}{Up Down}
		return
		*k Up::
			SendInput, {Blind}{Up Up}
		return
	; hotkey: *j::Down
		*j::
			SendInput, {Blind}{Down Down}
		return
		*j Up::
			SendInput, {Blind}{Down Up}
		return
	; hotkey: *l::Right
		*l::
			SendInput, {Blind}{Right Down}
		return
		*l Up::
			SendInput, {Blind}{Right Up}
		return
	; hotkey: *q::^r
		*q::
			SendInput, {Blind}{Ctrl Down}{r Down}
		return
		*q Up::
			SendInput, {Blind}{Ctrl Up}{r Up}
		return
	; hotkey: *t::^+Tab
		*t::
			SendInput, {Blind}{Ctrl Down}{Shift Down}{Tab Down}
		return
		*t Up::
			SendInput, {Blind}{Ctrl Up}{Shift Up}{Tab Up}
		return
	; hotkey: *g::^Tab
		*g::
			SendInput, {Blind}{Ctrl Down}{Tab Down}
		return
		*g Up::
			SendInput, {Blind}{Ctrl Up}{Tab Up}
		return
	; hotkey: *z::^z
		*z::
			SendInput, {Blind}{Ctrl Down}{z Down}
		return
		*z Up::
			SendInput, {Blind}{Ctrl Up}{z Up}
		return
	; hotkey: *x::^Enter
		*x::
			SendInput, {Blind}{Ctrl Down}{Enter Down}
		return
		*x Up::
			SendInput, {Blind}{Ctrl Up}{Enter Up}
		return
	; hotkey: *c::^c
		*c::
			SendInput, {Blind}{Ctrl Down}{c Down}
		return
		*c Up::
			SendInput, {Blind}{Ctrl Up}{c Up}
		return
	; hotkey: *v::^v
		*v::
			SendInput, {Blind}{Ctrl Down}{v Down}
		return
		*v Up::
			SendInput, {Blind}{Ctrl Up}{v Up}
		return
	; hotkey: *h::^t
		*h::
			SendInput, {Blind}{Ctrl Down}{t Down}
		return
		*h Up::
			SendInput, {Blind}{Ctrl Up}{t Up}
		return
	; hotkey: *m::^t
		*m::
			SendInput, {Blind}{Ctrl Down}{t Down}
		return
		*m Up::
			SendInput, {Blind}{Ctrl Up}{t Up}
		return
	; hotkey: *y::Space
		*y::
			SendInput, {Blind}{Space Down}
		return
		*y Up::
			SendInput, {Blind}{Space Up}
		return
	; hotkey: *o::f
		*o::
			SendInput, {Blind}{f Down}
		return
		*o Up::
			SendInput, {Blind}{f Up}
		return
	; hotkey: *b::^w
		*b::
			SendInput, {Blind}{Ctrl Down}{w Down}
		return
		*b Up::
			SendInput, {Blind}{Ctrl Up}{w Up}
		return
	; hotkey: *Space::Enter
		*Space::
			SendInput, {Blind}{Enter Down}
		return
		*Space Up::
			SendInput, {Blind}{Enter Up}
		return
	; hotkey: *n::^n
		*n::
			SendInput, {Blind}{Ctrl Down}{n Down}
		return
		*n Up::
			SendInput, {Blind}{Ctrl Up}{n Up}
		return
	; hotkey: *p::^+p
		*p::
			SendInput, {Blind}{Ctrl Down}{Shift Down}{p Down}
		return
		*p Up::
			SendInput, {Blind}{Ctrl Up}{Shift Up}{p Up}
		return
	; hotkey: *u::^+l
		*u::
			SendInput, {Blind}{Ctrl Down}{Shift Down}{l Down}
		return
		*u Up::
			SendInput, {Blind}{Ctrl Up}{Shift Up}{l Up}
		return
	; hotkey: *-::LButton
		*-::
			SendInput, {Blind}{LButton Down}
		return
		*- Up::
			SendInput, {Blind}{LButton Up}
		return
	; hotkey: *=::RButton
		*=::
			SendInput, {Blind}{RButton Down}
		return
		*= Up::
			SendInput, {Blind}{RButton Up}
		return
#If

#If not BrowserMode
	'::
		BrowserMode := true
		Gui, indicator:Color, green
		Gui, switcher:Color, green
		Gui, switcher:Show, NA
		DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50004")
	return
	CapsLock & Escape::
		BrowserMode := true
		Gui, indicator:Color, green
		Gui, switcher:Color, green
		Gui, switcher:Show, NA
		DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50004")
	return
	sc056 & q::
		BrowserMode := true
		Gui, indicator:Color, green
		Gui, switcher:Color, green
		Gui, switcher:Show, NA
		DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50004")
	return
	sc056::
		
	return
	+sc056::
		
	return
	sc056 & w::
		MsgBox nope
	return
	sc056 & r::
		MsgBox nope
	return
	sc056 & t::
		MsgBox nope
	return
	sc056 & y::
		MsgBox nope
	return
	sc056 & u::
		MsgBox nope
	return
	sc056 & o::
		MsgBox nope
	return
	sc056 & p::
		MsgBox nope
	return
	sc056 & g::
		MsgBox nope
	return
	sc056 & h::
		MsgBox nope
	return
	sc056 & b::
		MsgBox nope
	return
	sc056 & n::
		MsgBox nope
	return
	sc056 & m::
		MsgBox nope
	return
	; hotkey: sc056 & d::Home
		sc056 & d::
			SendInput, {Blind}{Home Down}
		return
		sc056 & d Up::
			SendInput, {Blind}{Home Up}
		return
	; hotkey: sc056 & f::End
		sc056 & f::
			SendInput, {Blind}{End Down}
		return
		sc056 & f Up::
			SendInput, {Blind}{End Up}
		return
	; hotkey: sc056 & e::PgUp
		sc056 & e::
			SendInput, {Blind}{PgUp Down}
		return
		sc056 & e Up::
			SendInput, {Blind}{PgUp Up}
		return
	; hotkey: sc056 & s::PgDn
		sc056 & s::
			SendInput, {Blind}{PgDn Down}
		return
		sc056 & s Up::
			SendInput, {Blind}{PgDn Up}
		return
	; hotkey: sc056 & i::Left
		sc056 & i::
			SendInput, {Blind}{Left Down}
		return
		sc056 & i Up::
			SendInput, {Blind}{Left Up}
		return
	; hotkey: sc056 & k::Up
		sc056 & k::
			SendInput, {Blind}{Up Down}
		return
		sc056 & k Up::
			SendInput, {Blind}{Up Up}
		return
	; hotkey: sc056 & j::Down
		sc056 & j::
			SendInput, {Blind}{Down Down}
		return
		sc056 & j Up::
			SendInput, {Blind}{Down Up}
		return
	; hotkey: sc056 & l::Right
		sc056 & l::
			SendInput, {Blind}{Right Down}
		return
		sc056 & l Up::
			SendInput, {Blind}{Right Up}
		return
	; hotkey: sc056 & x::Up
		sc056 & x::
			SendInput, {Blind}{Up Down}
		return
		sc056 & x Up::
			SendInput, {Blind}{Up Up}
		return
	; hotkey: sc056 & c::Down
		sc056 & c::
			SendInput, {Blind}{Down Down}
		return
		sc056 & c Up::
			SendInput, {Blind}{Down Up}
		return
	; hotkey: sc056 & z::Left
		sc056 & z::
			SendInput, {Blind}{Left Down}
		return
		sc056 & z Up::
			SendInput, {Blind}{Left Up}
		return
	; hotkey: sc056 & v::Right
		sc056 & v::
			SendInput, {Blind}{Right Down}
		return
		sc056 & v Up::
			SendInput, {Blind}{Right Up}
		return
	; hotkey: sc056 & a::Escape
		sc056 & a::
			SendInput, {Blind}{Escape Down}
		return
		sc056 & a Up::
			SendInput, {Blind}{Escape Up}
		return
	; hotkey: sc056 & Space::Enter
		sc056 & Space::
			SendInput, {Blind}{Enter Down}
		return
		sc056 & Space Up::
			SendInput, {Blind}{Enter Up}
		return
	`; & q::
		BrowserMode := true
		Gui, indicator:Color, green
		Gui, switcher:Color, green
		Gui, switcher:Show, NA
		DllCall("AnimateWindow", "UInt", guiID, "Int", 200, "UInt", "0x50004")
	return
	`;::
		
	return
	+`;::
		
	return
	`; & w::
		MsgBox nope
	return
	`; & r::
		MsgBox nope
	return
	`; & t::
		MsgBox nope
	return
	`; & y::
		MsgBox nope
	return
	`; & u::
		MsgBox nope
	return
	`; & o::
		MsgBox nope
	return
	`; & p::
		MsgBox nope
	return
	`; & g::
		MsgBox nope
	return
	`; & h::
		MsgBox nope
	return
	`; & b::
		MsgBox nope
	return
	`; & n::
		MsgBox nope
	return
	`; & m::
		MsgBox nope
	return
	; hotkey: `; & d::Home
		`; & d::
			SendInput, {Blind}{Home Down}
		return
		`; & d Up::
			SendInput, {Blind}{Home Up}
		return
	; hotkey: `; & f::End
		`; & f::
			SendInput, {Blind}{End Down}
		return
		`; & f Up::
			SendInput, {Blind}{End Up}
		return
	; hotkey: `; & e::PgUp
		`; & e::
			SendInput, {Blind}{PgUp Down}
		return
		`; & e Up::
			SendInput, {Blind}{PgUp Up}
		return
	; hotkey: `; & s::PgDn
		`; & s::
			SendInput, {Blind}{PgDn Down}
		return
		`; & s Up::
			SendInput, {Blind}{PgDn Up}
		return
	; hotkey: `; & i::Left
		`; & i::
			SendInput, {Blind}{Left Down}
		return
		`; & i Up::
			SendInput, {Blind}{Left Up}
		return
	; hotkey: `; & k::Up
		`; & k::
			SendInput, {Blind}{Up Down}
		return
		`; & k Up::
			SendInput, {Blind}{Up Up}
		return
	; hotkey: `; & j::Down
		`; & j::
			SendInput, {Blind}{Down Down}
		return
		`; & j Up::
			SendInput, {Blind}{Down Up}
		return
	; hotkey: `; & l::Right
		`; & l::
			SendInput, {Blind}{Right Down}
		return
		`; & l Up::
			SendInput, {Blind}{Right Up}
		return
	; hotkey: `; & x::Up
		`; & x::
			SendInput, {Blind}{Up Down}
		return
		`; & x Up::
			SendInput, {Blind}{Up Up}
		return
	; hotkey: `; & c::Down
		`; & c::
			SendInput, {Blind}{Down Down}
		return
		`; & c Up::
			SendInput, {Blind}{Down Up}
		return
	; hotkey: `; & z::Left
		`; & z::
			SendInput, {Blind}{Left Down}
		return
		`; & z Up::
			SendInput, {Blind}{Left Up}
		return
	; hotkey: `; & v::Right
		`; & v::
			SendInput, {Blind}{Right Down}
		return
		`; & v Up::
			SendInput, {Blind}{Right Up}
		return
	; hotkey: `; & a::Escape
		`; & a::
			SendInput, {Blind}{Escape Down}
		return
		`; & a Up::
			SendInput, {Blind}{Escape Up}
		return
	; hotkey: `; & Space::Enter
		`; & Space::
			SendInput, {Blind}{Enter Down}
		return
		`; & Space Up::
			SendInput, {Blind}{Enter Up}
		return
#If

CapsLock & p::
	MsgBox nope
return

; hotkey: CapsLock & 1::!
	CapsLock & 1::
		SendInput, {Blind}{! Down}
	return
	CapsLock & 1 Up::
		SendInput, {Blind}{! Up}
	return

; hotkey: CapsLock & 2::@
	CapsLock & 2::
		SendInput, {Blind}{@ Down}
	return
	CapsLock & 2 Up::
		SendInput, {Blind}{@ Up}
	return

; hotkey: CapsLock & 3::#
	CapsLock & 3::
		SendInput, {Blind}{# Down}
	return
	CapsLock & 3 Up::
		SendInput, {Blind}{# Up}
	return

; hotkey: CapsLock & 4::$
	CapsLock & 4::
		SendInput, {Blind}{$ Down}
	return
	CapsLock & 4 Up::
		SendInput, {Blind}{$ Up}
	return

; hotkey: CapsLock & f::)
	CapsLock & f::
		SendInput, {Blind}{) Down}
	return
	CapsLock & f Up::
		SendInput, {Blind}{) Up}
	return

; hotkey: CapsLock & d::(
	CapsLock & d::
		SendInput, {Blind}{( Down}
	return
	CapsLock & d Up::
		SendInput, {Blind}{( Up}
	return

; hotkey: CapsLock & e::[
	CapsLock & e::
		SendInput, {Blind}{[ Down}
	return
	CapsLock & e Up::
		SendInput, {Blind}{[ Up}
	return

; hotkey: CapsLock & r::]
	CapsLock & r::
		SendInput, {Blind}{] Down}
	return
	CapsLock & r Up::
		SendInput, {Blind}{] Up}
	return

; hotkey: CapsLock & c::{
	CapsLock & c::
		SendInput, {Blind}{{ Down}
	return
	CapsLock & c Up::
		SendInput, {Blind}{{ Up}
	return

; hotkey: CapsLock & v::}
	CapsLock & v::
		SendInput, {Blind}{} Down}
	return
	CapsLock & v Up::
		SendInput, {Blind}{} Up}
	return

; hotkey: CapsLock & ,::<
	CapsLock & ,::
		SendInput, {Blind}{< Down}
	return
	CapsLock & , Up::
		SendInput, {Blind}{< Up}
	return

; hotkey: CapsLock & .::>
	CapsLock & .::
		SendInput, {Blind}{> Down}
	return
	CapsLock & . Up::
		SendInput, {Blind}{> Up}
	return

; hotkey: CapsLock & j::'
	CapsLock & j::
		SendInput, {Blind}{' Down}
	return
	CapsLock & j Up::
		SendInput, {Blind}{' Up}
	return

; hotkey: CapsLock & k::"
	CapsLock & k::
		SendInput, {Blind}{" Down}
	return
	CapsLock & k Up::
		SendInput, {Blind}{" Up}
	return

; hotkey: CapsLock & n::-
	CapsLock & n::
		SendInput, {Blind}{- Down}
	return
	CapsLock & n Up::
		SendInput, {Blind}{- Up}
	return

; hotkey: CapsLock & m::=
	CapsLock & m::
		SendInput, {Blind}{= Down}
	return
	CapsLock & m Up::
		SendInput, {Blind}{= Up}
	return

; hotkey: CapsLock & l::+
	CapsLock & l::
		SendInput, {Blind}{+ Down}
	return
	CapsLock & l Up::
		SendInput, {Blind}{+ Up}
	return

; hotkey: CapsLock & b::`%
	CapsLock & b::
		SendInput, {Blind}{`% Down}
	return
	CapsLock & b Up::
		SendInput, {Blind}{`% Up}
	return

; hotkey: CapsLock & u::&
	CapsLock & u::
		SendInput, {Blind}{& Down}
	return
	CapsLock & u Up::
		SendInput, {Blind}{& Up}
	return

; hotkey: CapsLock & i::*
	CapsLock & i::
		SendInput, {Blind}{* Down}
	return
	CapsLock & i Up::
		SendInput, {Blind}{* Up}
	return

; hotkey: CapsLock & o::^
	CapsLock & o::
		SendInput, {Blind}{^ Down}
	return
	CapsLock & o Up::
		SendInput, {Blind}{^ Up}
	return

; hotkey: CapsLock & t::_
	CapsLock & t::
		SendInput, {Blind}{_ Down}
	return
	CapsLock & t Up::
		SendInput, {Blind}{_ Up}
	return

; hotkey: CapsLock & a::`
	CapsLock & a::
		SendInput, {Blind}{`` Down}
	return
	CapsLock & a Up::
		SendInput, {Blind}{`` Up}
	return

; hotkey: CapsLock & q::/
	CapsLock & q::
		SendInput, {Blind}{/ Down}
	return
	CapsLock & q Up::
		SendInput, {Blind}{/ Up}
	return

; hotkey: CapsLock & z::~
	CapsLock & z::
		SendInput, {Blind}{~ Down}
	return
	CapsLock & z Up::
		SendInput, {Blind}{~ Up}
	return

; hotkey: CapsLock & h:::
	CapsLock & h::
		SendInput, {Blind}{: Down}
	return
	CapsLock & h Up::
		SendInput, {Blind}{: Up}
	return

; hotkey: CapsLock & g::|
	CapsLock & g::
		SendInput, {Blind}{| Down}
	return
	CapsLock & g Up::
		SendInput, {Blind}{| Up}
	return

; hotkey: CapsLock & w::`;
	CapsLock & w::
		SendInput, {Blind}{`; Down}
	return
	CapsLock & w Up::
		SendInput, {Blind}{`; Up}
	return

; hotkey: CapsLock & x::?
	CapsLock & x::
		SendInput, {Blind}{? Down}
	return
	CapsLock & x Up::
		SendInput, {Blind}{? Up}
	return

; hotkey: CapsLock & s::\
	CapsLock & s::
		SendInput, {Blind}{\ Down}
	return
	CapsLock & s Up::
		SendInput, {Blind}{\ Up}
	return

; hotkey: CapsLock & Space::Backspace
	CapsLock & Space::
		SendInput, {Blind}{Backspace Down}
	return
	CapsLock & Space Up::
		SendInput, {Blind}{Backspace Up}
	return

; hotkey: CapsLock & Tab::Delete
	CapsLock & Tab::
		SendInput, {Blind}{Delete Down}
	return
	CapsLock & Tab Up::
		SendInput, {Blind}{Delete Up}
	return

; hotkey: CapsLock & y::μ
	CapsLock & y::
		SendInput, {Blind}{μ Down}
	return
	CapsLock & y Up::
		SendInput, {Blind}{μ Up}
	return

; hotkey: +1::ů
	+1::
		SendInput, {Blind}{ů Down}
	return
	+1 Up::
		SendInput, {Blind}{ů Up}
	return

; hotkey: +2::ě
	+2::
		SendInput, {Blind}{ě Down}
	return
	+2 Up::
		SendInput, {Blind}{ě Up}
	return

; hotkey: +3::š
	+3::
		SendInput, {Blind}{š Down}
	return
	+3 Up::
		SendInput, {Blind}{š Up}
	return

; hotkey: +4::č
	+4::
		SendInput, {Blind}{č Down}
	return
	+4 Up::
		SendInput, {Blind}{č Up}
	return

; hotkey: +5::ř
	+5::
		SendInput, {Blind}{ř Down}
	return
	+5 Up::
		SendInput, {Blind}{ř Up}
	return

; hotkey: +6::ž
	+6::
		SendInput, {Blind}{ž Down}
	return
	+6 Up::
		SendInput, {Blind}{ž Up}
	return

; hotkey: +7::ý
	+7::
		SendInput, {Blind}{ý Down}
	return
	+7 Up::
		SendInput, {Blind}{ý Up}
	return

; hotkey: +8::á
	+8::
		SendInput, {Blind}{á Down}
	return
	+8 Up::
		SendInput, {Blind}{á Up}
	return

; hotkey: +9::í
	+9::
		SendInput, {Blind}{í Down}
	return
	+9 Up::
		SendInput, {Blind}{í Up}
	return

; hotkey: +0::é
	+0::
		SendInput, {Blind}{é Down}
	return
	+0 Up::
		SendInput, {Blind}{é Up}
	return

; hotkey: +-::ú
	+-::
		SendInput, {Blind}{ú Down}
	return
	+- Up::
		SendInput, {Blind}{ú Up}
	return

; hotkey: +=::ň
	+=::
		SendInput, {Blind}{ň Down}
	return
	+= Up::
		SendInput, {Blind}{ň Up}
	return

; hotkey: *`::F13
	*`::
		SendInput, {Blind}{F13 Down}
	return
	*` Up::
		SendInput, {Blind}{F13 Up}
	return

]::^#Right

[::^#Left

; hotkey: RAlt::AppsKey
	RAlt::
		SendInput, {Blind}{AppsKey Down}
	return
	RAlt Up::
		SendInput, {Blind}{AppsKey Up}
	return

RShift::
	If (WinActive("ahk_exe VmConnect.exe")) {
		WinActivate, ahk_exe mmc.exe
	} else {
		WinMinimize, A
	}
return

; hotkey: >+sc056::!F4
	>+sc056::
		SendInput, {Blind}{Alt Down}{F4 Down}
	return
	>+sc056 Up::
		SendInput, {Blind}{Alt Up}{F4 Up}
	return

; hotkey: >+`;::!F4
	>+`;::
		SendInput, {Blind}{Alt Down}{F4 Down}
	return
	>+`; Up::
		SendInput, {Blind}{Alt Up}{F4 Up}
	return

Ctrl & RShift::
	WinGet, active_id, ProcessName, A
	MsgBox, %active_id%
return

^PrintScreen::
	Gui, indicator:Hide
return

+PrintScreen::
	Gui, indicator:Show, NA
return