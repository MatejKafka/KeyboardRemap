:: I'm using a local installation of js2ahk for development
cmd /c "D:\programming\js2ahk\bin\js2ahk.cmd %~dp0\capsicain.ahk.js %~dp0\compiled\capsicain.ahk"
Ahk2Exe /in "%~dp0\compiled\capsicain.ahk" /out "%~dp0\..\..\..\cache\ahk-capsicain.exe"
start "" "AutoHotkey" "%~dp0\compiled\capsicain.ahk"