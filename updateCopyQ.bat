@echo off
pushd %TEMP%
curl -s https://api.github.com/repos/hluk/CopyQ/releases/latest | grep "browser_download_url.*exe" | cut -d : -f 2,3 | sed -e "s/^[ \t]*//" -e s/^.// -e s/.$// | wget -i -
FOR /F %A IN ('ls copyq*.exe') DO start /wait %~A /INFFILE=$HOME\NextCloud\Scripts\copyqinstall.inf
del -y copyq*.exe
popd