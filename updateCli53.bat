@echo off
pushd %TEMP%
curl -s https://api.github.com/repos/barnybug/cli53/releases/latest | grep "browser_download_url.*cli53-windows-amd64.exe" | cut -d : -f 2,3 | sed -e "s/^[ \t]*//" -e s/^.// -e s/.$// | wget -i -
copy cli53-windows-amd64.exe c:\windows\system32\cli53.exe
del cli53-windows-amd64.exe
popd
