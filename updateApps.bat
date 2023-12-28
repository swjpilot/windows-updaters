@echo off
setlocal
CALL :GETPARENT PARENT
REM IF /I "%PARENT%" == "powershell" GOTO :ISPOWERSHELL
REM IF /I "%PARENT%" == "pwsh" GOTO :ISPOWERSHELL
endlocal

pushd %HOMEDRIVE%%HOMEPATH%\Nextcloud\Development\git\windows-updaters\
for /f %%i in ('dir "*.bat" /b') do call :test %%i
goto continue
  :test
  if "%1"=="updateApps.bat" goto :eof
  if "%1"=="workspacesChocoInstall.bat" goto :eof
  echo ****************** EXECUTING %1 ****************************
  call %1
  GOTO :EOF
:continue
GOTO :EOF

:GETPARENT
SET "PSCMD=$ppid=$pid;while($i++ -lt 3 -and ($ppid=(Get-CimInstance Win32_Process -Filter ('ProcessID='+$ppid)).ParentProcessId)) {}; (Get-Process -EA Ignore -ID $ppid).Name"
for /f "tokens=*" %%i in ('powershell -noprofile -command "%PSCMD%"') do SET %1=%%i
popd
GOTO :EOF

:ISPOWERSHELL
c:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe -Command {Start-Process -verb runas -wait -FilePath C:\Windows\System32\CMD.exe -ArgumentList "/C %USERPROFILE%\Nextcloud\Development\git\windows-updaters\updateApps.bat"}
exit /b 1
