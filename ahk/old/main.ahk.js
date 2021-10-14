const LOWERCASE = 'qwertyuiopasdfghjklzxcvbnm'.split('')


const pathFromProgramName = (shortcutName) => {
	//return "D:/_/" + shortcutName + "/" + shortcutName + ".lnk" 
	return "%A_StartMenu%\\Pkg\\" + shortcutName + ".lnk" 
}

const mapKeyToProgram = (hotkey, programExeName, programExePath) => {
	ahk.remap(hotkey, () => {
		ahk.if(() => ahk.win.exist('exe', programExeName),
			() => {
				ahk.win.activate()
			},
			() => {
				ahk.runProgram(programExePath)
				ahk.win.wait('exe', programExeName)
				ahk.win.activate()
			}
		)
	})
}

const mapKeyToShortcut = (hotkey, programExeName, shortcutName) => {
	return mapKeyToProgram(
		hotkey, programExeName,
		pathFromProgramName(shortcutName)
	)
}


const disableKey = (keyName) => ahk.remap(keyName, () => {})
		
const applyRemap = (modKey, map, recursive = false) => {
	if (!Array.isArray(map)) map = Object.entries(map)
	map.map(([k, r]) => [Array.isArray(k) ? k : [k], r])
		.map(([k, r]) => [modKey == null ? k : [modKey, ...k], r])
		.forEach(([key, remap]) => ahk.remap(key, remap, recursive))
}

const relearnKeys = (modKey, keyArr) => {
	const actions = keyArr.map(k => [k, () => ahk.raw("MsgBox nope")])
	applyRemap(modKey, actions, false)
}

const relearnRemaining = (modKey, map) => relearnKeys(modKey, LOWERCASE.filter(k => !(k in map)))

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
// use the lower-level keyboard hook which shouldn't ocassionally forget modifiers
ahk.raw("#UseHook")

// must be in the auto-execute section
ahk.raw("BrowserMode := false")

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

const flashScreen = (activating = true) => {
	ahk.raw("Gui, indicator:Color, " + (activating ? "green" : "0x900000"))
	ahk.raw("Gui, switcher:Color, " + (activating ? "green" : "0x900000"))
	
	ahk.raw("Gui, switcher:Show, NA")
	animateWindow("guiID", 200, A_HIDE | (activating ? A_TTB : A_BTT) | A_SLIDE)
}


ahk.raw('SetCapsLockState, AlwaysOff')
ahk.remap(['Ctrl', 'Alt', 'CapsLock'], () => {
	ahk.if(
		() => ahk.raw('GetKeyState("CapsLock", "T") = 1'),
		() => ahk.raw('SetCapsLockState, AlwaysOff'),
		() => ahk.raw('SetCapsLockState, AlwaysOn')
	)
})


ahk.remap(["Ctrl", "f12"], () => ahk.raw("ExitApp"))
ahk.remap(["Ctrl", "Alt", "f12"], () => ahk.raw("Suspend"))
ahk.remap(["Ctrl", "Shift", "f12"], () => ahk.raw("Reload"))

ahk.remap(["-"], () => {
	ahk.raw("SendInput {End}{Space}site:reddit.com")
	ahk.raw("Sleep 100")
	ahk.raw("SendInput {Enter}")
})
ahk.remap(["="], () => {
	ahk.raw("SendInput /")
	ahk.raw("Sleep 50")
	ahk.raw("SendInput {End}{Space}{!}g{Enter}")
})


ahk.remap(["\\", "e"], ["LWin", "e"])
ahk.remap(["\\", "r"], ["LWin", "r"])
ahk.remap(["\\", "g"], ["LWin", "g"])
ahk.remap(["\\", "v"], ["LWin", "v"])
ahk.remap(["\\", "x"], ["LWin", "x"])

;['\\', 'Win'].forEach(mod => {
	// mapKeyToShortcut(['Win', 't'], 'idea64.exe', 'IntelliJ Idea')
	mapKeyToShortcut([mod, 'w'], 'notepad++.exe', 'Notepad++')
	mapKeyToShortcut([mod, 'f'], 'firefox.exe', 'Firefox')
	mapKeyToShortcut([mod, 'z'], 'Telegram.exe', 'Telegram')
	mapKeyToShortcut([mod, 'k'], 'ProcessHacker.exe', 'ProcessHacker')
	mapKeyToShortcut([mod, 't'], 'clion64.exe', 'CLion 2021.2.2')

	const SHORTCUT_DIR = __dirname + "/../../data/shortcuts/"
	mapKeyToProgram([mod, 's'], 'salamand.exe', SHORTCUT_DIR + 'Altap Salamander (x64).lnk')
	mapKeyToProgram([mod, 'q'], 'WindowsTerminal.exe', 'wt.exe')
	mapKeyToProgram([mod, 'a'], 'VmConnect.exe', SHORTCUT_DIR + 'Hyper-V Manager.lnk')
	mapKeyToProgram([mod, 'j'], 'Signal.exe', SHORTCUT_DIR + 'Signal.lnk')
	mapKeyToProgram([mod, 'c'], 'Spotify.exe', SHORTCUT_DIR + 'Spotify.lnk')
	mapKeyToProgram([mod, 'm'], 'msedge.exe', SHORTCUT_DIR + 'Microsoft Edge.lnk')
	mapKeyToProgram([mod, 'n'], 'Typora.exe', SHORTCUT_DIR + 'Typora.lnk')
	
	ahk.remap([mod, 'b'], () => {
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
	
	ahk.remap([mod, 'o'], () => {
		ahk.if(() => ahk.win.exist('exe', 'Code.exe'),
			() => ahk.win.activate(),
			() => {
				ahk.if(() => ahk.win.exist('exe', 'idea64.exe'),
					() => ahk.win.activate(),
					() => {
						ahk.runProgram(pathFromProgramName("Visual Studio Code (VS Code)"))
						ahk.win.wait('exe', 'Code.exe')
						ahk.win.activate()
					},
				)
			},
		)
	})
})

createBindableWindowHotkey(["Win", "1"], ["Win", "Shift", "1"])
createBindableWindowHotkey(["Win", "2"], ["Win", "Shift", "2"])
createBindableWindowHotkey(["Win", "3"], ["Win", "Shift", "3"])


const MOD = 'sc056' // left backslash
const MOD_ALT = ";"
const MOD2 = 'CapsLock'

// otherwise pressing Ctrl-MOD types a weird character
ahk.remap(["Ctrl", MOD], () => {})

const BROWSER_MODE_TOGGLE = "'"
const NORMAL_MODE_TOGGLE = ['CapsLock', 'Escape']

const navKeys = {
	'd': 'Home',
	'f': 'End',
	'e': 'PgUp',
	's': 'PgDn',
	
	'i': 'Left',
	'k': 'Up',
	'j': 'Down',
	'l': 'Right',

	'x': 'Up',
	'c': 'Down',
	'z': 'Left',
	'v': 'Right',
	
	'a': 'Escape',
	'Space': 'Enter',
}

browserKeys = {
	'a': 'Escape',
	
	'd': 'Up',
	'f': 'Down',
	
	'w': 'Left',
	'r': 'Right',
	
	'e': 'PgUp',
	's': 'PgDn',

	'i': 'Left',
	'k': 'Up',
	'j': 'Down',
	'l': 'Right',
	
	'q': ['Ctrl', 'r'],
	't': ['Ctrl', 'Shift', 'Tab'],
	'g': ['Ctrl', 'Tab'],
	'9': ['Ctrl', 'Shift', 'Tab'],
	'0': ['Ctrl', 'Tab'],
	'z': ['Ctrl', 'z'],
	'x': ['Ctrl', 'Enter'],
	'c': ['Ctrl', 'c'],
	'v': ['Ctrl', 'v'],
	'h': ['Ctrl', 't'],
	'm': ['Ctrl', 't'],
	'y': 'Space',
	'o': 'f',
	'b': ['Ctrl', 'w'],
	'3': ['Ctrl', 'l'],
	'Space': 'Enter',
	
	'n': ['Ctrl', 'n'],
	'p': ['Ctrl', 'Shift', 'p'],
	'u': ['Ctrl', 'Shift', 'l'],
	
	'5': ['Alt', 'Tab'],
}

mod2Keys = {
	'f': ')',
	'd': '(',
	'e': '[',
	'r': ']',
	'c': '{',
	'v': '}',

	',': "<",
	'.': ">",

	'1': "!",
	'2': "@",
	'3': "#",
	'4': "$",

	'j': "'",
	'k': '"',
	'n': '-',
	'm': '=',
	'l': '+',
	'b': '%',
	'u': '&',
	'i': '*',
	'o': '^',
	't': '_',

	'a': '`',
	'q': 'NumpadDiv',
	'z': '~',
	'h': ':',
	'g': '|',
	'w': ';',
	'x': '?',
	's': '\\',
	
	'Space': 'Backspace',
	'Tab': 'Delete',
	
	'y': 'μ',
}


ahk.ifCtx(() => ahk.raw("BrowserMode"), () => {
	const turnOff = () => {
		ahk.raw('BrowserMode := false')
		flashScreen(false)
	}
	
	ahk.remap(BROWSER_MODE_TOGGLE, turnOff)
	ahk.remap(NORMAL_MODE_TOGGLE, turnOff)
	ahk.remap('1', turnOff)

	ahk.raw("2::^#Left")
	ahk.raw("4::^#Right")
	
	for (let mod of [MOD, MOD_ALT]) {
		LOWERCASE.concat(['Space']).concat('0123456789'.split('')).forEach((k) => ahk.remap([mod, k], k))
	}
	
	relearnRemaining(null, browserKeys)
	relearnKeys(null, '78'.split(''))
	applyRemap(null, browserKeys, true)
})

ahk.ifCtx(() => ahk.raw("not BrowserMode"), () => {
	const turnOff = () => {
		ahk.raw('BrowserMode := true')
		flashScreen(true)
	}
	
	ahk.remap(BROWSER_MODE_TOGGLE, turnOff)
	ahk.remap(NORMAL_MODE_TOGGLE, turnOff)
	
	for (let mod of [MOD, MOD_ALT]) {
		ahk.remap([mod, 'q'], turnOff)
		
		disableKey(mod)
		disableKey(['Shift', mod])
		
		relearnRemaining(mod, {'q': null, ...navKeys})
		applyRemap(mod, navKeys, false)
	}
})


relearnRemaining(MOD2, mod2Keys)
applyRemap(MOD2, mod2Keys, false)

ahk.remap(["Shift", ","], ["—"])
ahk.remap(["Shift", "."], ["–"])

ahk.remap(['Shift', '1'], 'ů')
ahk.remap(['Shift', '2'], 'ě')
ahk.remap(['Shift', '3'], 'š')
ahk.remap(['Shift', '4'], 'č')
ahk.remap(['Shift', '5'], 'ř')
ahk.remap(['Shift', '6'], 'ž')
ahk.remap(['Shift', '7'], 'ý')
ahk.remap(['Shift', '8'], 'á')
ahk.remap(['Shift', '9'], 'í')
ahk.remap(['Shift', '0'], 'é')
ahk.remap(['Shift', '-'], 'ú')
ahk.remap(['Shift', '='], 'ň')

ahk.remap(['Ctrl', 'Shift', '1'], 'Ů')
ahk.remap(['Ctrl', 'Shift', '2'], 'Ě')
ahk.remap(['Ctrl', 'Shift', '3'], 'Š')
ahk.remap(['Ctrl', 'Shift', '4'], 'Č')
ahk.remap(['Ctrl', 'Shift', '5'], 'Ř')
ahk.remap(['Ctrl', 'Shift', '6'], 'Ž')
ahk.remap(['Ctrl', 'Shift', '7'], 'Ý')
ahk.remap(['Ctrl', 'Shift', '8'], 'Á')
ahk.remap(['Ctrl', 'Shift', '9'], 'Í')
ahk.remap(['Ctrl', 'Shift', '0'], 'É')
ahk.remap(['Ctrl', 'Shift', '-'], 'Ú')
ahk.remap(['Ctrl', 'Shift', '='], 'Ň')


// add hotkey for remap in programs
// currently used in IDEA
ahk.remap('`', 'F13', true)
/*
ahk.remap(['`', 'a'], 'ä')
ahk.remap(['`', 'o'], 'ö')
ahk.remap(['`', 'u'], 'ü')
ahk.remap(['`', 's'], 'ß')
*/

ahk.raw("]::^#Right")
ahk.raw("[::^#Left")

ahk.remap('\\', 'LWin')

ahk.remap('RAlt', 'AppsKey')
ahk.remap('/', 'F18')



// minimize windows with right shift
ahk.remap('RShift', () => ahk.if(
	() => ahk.win.active('exe', 'VmConnect.exe'),
	() => {
		// it seems we cannot minimize VmConnect, at least switch focus to Hyper-V Manager
		ahk.win.activate("exe", "mmc.exe")
	},
	() => ahk.win.minimize(null, 'A'),
))

ahk.raw("`; & RShift::!F4")
ahk.raw(MOD + " & RShift::!F4")


// debug hotkey
ahk.remap(["Ctrl", "RShift"], () => {
	ahk.raw("WinGet, active_id, ProcessName, A")
	ahk.raw("MsgBox, %active_id%")
})

// hide mode indicator
ahk.remap(['Ctrl', 'PrintScreen'], () => {
	ahk.raw("Gui, indicator:Hide")
})
ahk.remap(['Shift', 'PrintScreen'], () => {
	ahk.raw("Gui, indicator:Show, NA")
})
