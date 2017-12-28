rem @echo off


setlocal
cd /d %~dp0
adb root
adb forward tcp:8888 tcp:8888

"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\oem.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\userdata.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\cache.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\system.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\boot.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\wcnmodem.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\wmodem.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\wdsp.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\miscdata.img
"C:\Program Files\Nmap\ncat.exe" 127.0.0.1 8888 > backup\recovery.img