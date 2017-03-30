@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\jeffreyliou\Desktop\elec291\lab6\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\jeffreyliou\Desktop\elec291\lab6\lab6code.c"
if not exist hex2mif.exe goto done
if exist lab6code.ihx hex2mif lab6code.ihx
if exist lab6code.hex hex2mif lab6code.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\jeffreyliou\Desktop\elec291\lab6\lab6code.hex
