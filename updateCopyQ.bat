@echo off
pushd %TEMP%
curl -s https://api.github.com/repos/hluk/CopyQ/releases/latest | grep "browser_download_url.*exe" | cut -d : -f 2,3 | sed -e "s/^[ \t]*//" -e s/^.// -e s/.$// | wget -O copyq.exe -i -
REM FOR /F %%A IN ('dir /S copyq*.exe') DO call %%~A /INFFILE=%HOMEDRIVE%%HOMEPATH%\NextCloud\Scripts\copyqinstall.inf
start copyq.exe /INFFILE=%HOMEDRIVE%%HOMEPATH%\NextCloud\Scripts\copyqinstall.inf /S
del copyq*.exe
popd