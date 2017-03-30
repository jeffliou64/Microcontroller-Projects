@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\jeffreyliou\Desktop\elec291\lab5\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.c"
if not exist hex2mif.exe goto done
if exist any_pin with cp437.ihx hex2mif any_pin with cp437.ihx
if exist any_pin with cp437.hex hex2mif any_pin with cp437.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\jeffreyliou\Desktop\elec291\lab5\any_pin with cp437.hex
