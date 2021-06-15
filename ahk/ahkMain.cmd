:: I'm using a local installation of js2ahk for development
cmd /c "D:\programming\js2ahk\bin\js2ahk.cmd %~dp0\main.ahk.js %~dp0\compiled\main.ahk"
Ahk2Exe /in "%~dp0\compiled\main.ahk" /out "%~dp0\..\..\cache\ahk-main.exe"
start "" "AutoHotkey" "%~dp0\compiled\main.ahk"