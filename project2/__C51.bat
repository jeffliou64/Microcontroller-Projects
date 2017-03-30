@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\jeffreyliou\Desktop\elec291\project2\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v4.c"
if not exist hex2mif.exe goto done
if exist autonomous v4.ihx hex2mif autonomous v4.ihx
if exist autonomous v4.hex hex2mif autonomous v4.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\jeffreyliou\Desktop\elec291\project2\autonomous v4.hex
