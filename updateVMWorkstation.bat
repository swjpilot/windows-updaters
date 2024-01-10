@echo off
pushd %TEMP%
set USERAGENT=X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/111.0
REM FOR /F %%A IN ('curl --user-agent "%USERAGENT%" -w "%{redirect_url}" https://www.vmware.com/go/getworkstation-win') DO set url=%%~A
REM FOR /F %%B IN ('echo %url% ^| grep -i -o "VMware-Workstation-Full-.*\.exe"') DO set file=%%~B
wget -O vmware-workstation.exe --user-agent="%USERAGENT%" https://www.vmware.com/go/getworkstation-win
start /W /B .\vmware-workstation.exe
del vmware-workstation.exe /S
popd