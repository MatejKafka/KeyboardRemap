# KeyboardRemap
My custom keyboard remap, in two versions:

 1) The main version uses a combination of [Capsicain](https://github.com/cajhin/capsicain) and [AutoHotkey v1](https://www.autohotkey.com/), which is more reliable.
 2) The old version is AutoHotkey-only; it is  not maintained, but currently still mostly up-to-date with the main version.

## Notable features

This is just an overview, for the current exact bindings, read the source code. :)

- **Browser mode:** separate "browser mode" config that allows me to operate a browser using one hand by mapping letters to browser navigation keys — `f` = ArrowDown, `d` = ArrowUp, `e` = PgUp, `s` = PgDown, `w` = ArrowLeft, `r` = ArrowRight, `t` = Ctrl-Shift-Tab,...
	- Current mode is indicated using a small GUI indicator in the screen corner
	- To toggle, use `'`, `CapsLock-Escape`; to activate from normal mode, `;-q` works; to deactivate, you may also use `1` 

- **CapsLock for special characters:** separate layer that lets me type all commonly used special chars using the middle 3 keyboard rows - `CapsLock-d` = `(`, `CapsLock-j` = `'`,...

 - **`Shift-<num>` for Czech accents** (and `Ctrl-Shift-<num>` for uppercase)
 - **`;` and `L\` as a layer for navigation:** both of those are very nicely placed keys, which are almost asking to be used for macros :) ; I'm using them for text navigation, e.g. arrows, home/end,...
	 - a bit unusually, I'm using j=down, k=up, i=left, l=right; this lets me keep my fingers on the home row when scrolling, and matches `vim` layout more
	 - for the left hand, the layout is similar, but for Home/End/PgUp/PgDn on `esdf` (I'm using `esdf` even when gaming, as it's imo more natural than `wsad`)
 - **Window switching using hotkeys:** `Win-f` = Firefox, `Win-c` = Spotify,...; if the window exists, it is focused, otherwise the app is started (you may need to adjust the exe paths for your system)
 - Virtual desktop switching using `[` and `]`
 - `RShift` = minimize current window, `;-RShift` = close current window

## Usage

Apologies, this is not very streamlined. If you want to try the config and something doesn't work, open an issue and I'll try to improve this a bit. Afaik, I'm currently the only user, so I don't have much motivation to polish the setup. :)

First, start Capsicain by moving/symlinking the `capsicain.ini` from this repo to the Capsicain installation dir and then running `capsicain.exe`.

Second, start the AutoHotkey part by running `./ahk/compiled/capsicain.ahk` directly using AutoHotkey. Alternatively, install [`js2ahk`](https://github.com/MatejKafka/js2ahk) (mostly abandoned, but I still use it), adjust the path in `./ahk/ahkCapsicain.cmd` and then run it — it compiles the `capsicain.ahk.js` file and then runs the resulting `capsicain.ahk` file.
