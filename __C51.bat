@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\jeffreyliou\Desktop\elec291\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.c"
if not exist hex2mif.exe goto done
if exist CrossIde1.ihx hex2mif CrossIde1.ihx
if exist CrossIde1.hex hex2mif CrossIde1.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\jeffreyliou\Desktop\elec291\CrossIde1.hex
