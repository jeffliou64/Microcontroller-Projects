@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\jeffreyliou\Desktop\elec291\lab4\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\jeffreyliou\Desktop\elec291\lab4\combine.c"
if not exist hex2mif.exe goto done
if exist combine.ihx hex2mif combine.ihx
if exist combine.hex hex2mif combine.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\jeffreyliou\Desktop\elec291\lab4\combine.hex
