DetectHiddenWindows "On"

ActivateProgram(programWindowName, programPath) {
	winNames := IsObject(programWindowName) ? programWindowName : [programWindowName]
	for (winName in winNames) {
		if (!WinExist("ahk_exe " . winName)) {
			continue
		}
		WinActivate
		return
	}
	Run(programPath)
	WinWait("ahk_exe " . winNames[1])
	WinActivate
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
