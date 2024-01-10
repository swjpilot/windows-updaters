@echo off
pushd %TEMP%

curl --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/111.0" -H "Content-Type: application/x-www-form-urlencoded" -d "key=VPUV-33PW-TQ27-HYXQ-5798&mail=&number=&platform=win&download_program=Start download of FileZilla Pro&platform_cli=win&platform_fzpes=win" -X POST https://filezilla-project.org/prodownload.php?beta=0 -o %TEMP%\FileZilla_Pro_win64-setup.exe
start /W /B %TEMP%\FileZilla_Pro_win64-setup.exe /S
del %TEMP%\FileZilla_Pro_win64-setup.exe
popd
