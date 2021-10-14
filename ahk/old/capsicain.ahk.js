const pathFromProgramName = (shortcutName) => {
	return "%A_StartMenu%\\Pkg\\" + shortcutName + ".lnk" 
}

const mapKeyToProgram = (hotkey, programExeName, programExePath) => {
	ahk.remap(hotkey, () => {
		ahk.if(() => ahk.win.exist('exe', programExeName),
			() => ahk.win.activate(),
			() => {
				ahk.runProgram(programExePath)
				ahk.win.wait('exe', programExeName)
				ahk.win.activate()
			}
		)
	})
}

const mapKeyToShortcut = (hotkey, programExeName, shortcutName) => {
	return mapKeyToProgram(hotkey, programExeName, pathFromProgramName(shortcutName))
}


let i = 0
const createBindableWindowHotkey = (recallKeys, bindKeys) => {
	const varName = "bindable_" + i
	ahk.remap(recallKeys, () => ahk.win.activate("id", "%" + varName + "%"))
	ahk.remap(bindKeys, () => {
		ahk.raw("WinGet, " + varName + ", ID, A")
		ahk.raw("WinGet, bind_tmp_title, ProcessName, A")
		ahk.raw("MsgBox, Window of [%bind_tmp_title%] now bound to key combination [" + recallKeys.join("+") +"].")
	})
}

const A_LTR = 1
const A_RTL = 2
const A_TTB = 4
const A_BTT = 8
const A_CENTER = 16
const A_HIDE = 65536
const A_SHOW = 131072
const A_SLIDE = 262144
const A_FADE = 524288

const animateWindow = (window, duration, flag) => {
	flagStr = "0x" + flag.toString(16)
	ahk.raw(`DllCall("AnimateWindow", "UInt", ${window}, "Int", ${duration}, "UInt", "${flagStr}")`)
}


// when relaunching, don't show prompt
ahk.raw("#SingleInstance Force")

ahk.raw("Gui, switcher:New")
ahk.raw("Gui, switcher:+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
ahk.raw("Gui, switcher:Color, 0x900000")
ahk.raw("Gui, switcher:Show, x0 y1030 w1920 h50 Hide")
ahk.raw("Gui, switcher:+LastFound")
ahk.raw("guiID := WinExist()")

ahk.raw("Gui, indicator:New")
ahk.raw("Gui, indicator:+AlwaysOnTop +ToolWindow -DPIScale -0xC00000 +E0x08000000")
ahk.raw("Gui, indicator:Color, 0x900000")
ahk.raw("Gui, indicator:Show, x1899 y1030 w21 h50 NA")

const switchConfigIndicator = (browserMode = true) => {
	ahk.raw("Gui, indicator:Color, " + (browserMode ? "green" : "0x900000"))
	ahk.raw("Gui, switcher:Color, " + (browserMode ? "green" : "0x900000"))
	
	ahk.raw("Gui, switcher:Show, NA")
	animateWindow("guiID", 200, A_HIDE | (browserMode ? A_TTB : A_BTT) | A_SLIDE)
}


ahk.remap(["Ctrl", "F12"], () => ahk.raw("ExitApp"))


ahk.remap(['Shift', 'F16'], ['Alt', 'F4'])
ahk.remap('F16', () => ahk.if(
	() => ahk.win.active('exe', 'VmConnect.exe'),
	// it seems we cannot minimize VmConnect, at least switch focus to Hyper-V Manager
	() => ahk.win.activate("exe", "mmc.exe"),
	() => ahk.win.minimize(null, 'A'),
))

// sent from Capsicain when switching between configs
ahk.remap(["Shift", "F14"], () => switchConfigIndicator(true))
ahk.remap(["Ctrl", "F14"], () => switchConfigIndicator(false))

// hide mode indicator
ahk.remap(['Ctrl', 'F15'], () => ahk.raw("Gui, indicator:Hide"))
ahk.remap(['Shift', 'F15'], () => ahk.raw("Gui, indicator:Show, NA"))



// remap / to NumPadDiv inside Altap Salamander
ahk.if(() => ahk.win.active('exe', 'salamand.exe'), () => ahk.remap("/", "NumPadDiv"))


// mapKeyToShortcut(['Win', 't'], 'idea64.exe', 'IntelliJ Idea')
mapKeyToShortcut(['Win', 'w'], 'notepad++.exe', 'Notepad++')
mapKeyToShortcut(['Win', 'f'], 'firefox.exe', 'Firefox')
mapKeyToShortcut(['Win', 'z'], 'Telegram.exe', 'Telegram')
mapKeyToShortcut(['Win', 'k'], 'ProcessHacker.exe', 'ProcessHacker')
mapKeyToShortcut(['Win', 't'], 'clion64.exe', 'CLion 2021.2.1')

const SHORTCUT_DIR = __dirname + "/../../data/shortcuts/"
mapKeyToProgram(['Win', 's'], 'salamand.exe', SHORTCUT_DIR + 'Altap Salamander (x64).lnk')
mapKeyToProgram(['Win', 'q'], 'WindowsTerminal.exe', 'wt.exe')
mapKeyToProgram(['Win', 'a'], 'VmConnect.exe', SHORTCUT_DIR + 'Hyper-V Manager.lnk')
mapKeyToProgram(['Win', 'j'], 'Signal.exe', SHORTCUT_DIR + 'Signal.lnk')
mapKeyToProgram(['Win', 'c'], 'Spotify.exe', SHORTCUT_DIR + 'Spotify.lnk')
mapKeyToProgram(['Win', 'm'], 'msedge.exe', SHORTCUT_DIR + 'Microsoft Edge.lnk')
mapKeyToProgram(['Win', 'n'], 'Typora.exe', SHORTCUT_DIR + 'Typora.lnk')

ahk.remap(['Win', 'b'], () => {
	ahk.if(() => ahk.win.exist('exe', 'Discord.exe'),
		() => ahk.win.activate(),
		() => {
			ahk.if(() => ahk.win.exist('exe', 'Ripcord.exe'),
				() => ahk.win.activate(),
				() => {
					ahk.runProgram(pathFromProgramName("Discord"))
					ahk.win.wait('exe', 'Discord.exe')
					ahk.win.activate()
				},
			)
		},
	)
})

ahk.remap(['Win', 'o'], () => {
	ahk.if(() => ahk.win.exist('exe', 'Code.exe'),
		() => ahk.win.activate(),
		() => {
			ahk.if(() => ahk.win.exist('exe', 'idea64.exe'),
				() => ahk.win.activate(),
				() => {
					ahk.runProgram(pathFromProgramName("IntelliJ IDEA"))
					ahk.win.wait('exe', 'idea64.exe')
					ahk.win.activate()
				},
			)
		},
	)
})

createBindableWindowHotkey(["Win", "1"], ["Win", "Shift", "1"])
createBindableWindowHotkey(["Win", "2"], ["Win", "Shift", "2"])
createBindableWindowHotkey(["Win", "3"], ["Win", "Shift", "3"])
