try
 fclose(instrfind);
end;
s1 = serial('COM3', ... % Change as needed!
 'BaudRate', 115200, ...
 'Parity', 'none', ...
 'DataBits', 8, ...
 'StopBits', 1, ...
 'FlowControl', 'none');
fopen(s1);
try
 fprintf('Press CTRL+C to finish\n');
 xdata = [];
 ydata = [];
 x = 500;
 t = -1;
 hLine = plot(xdata,ydata);
 stripchart('Initialize',gca)
 while(1)
 t = t + 1;
 val=fscanf(s1);
 result = sscanf(val, '%f');
 %fprintf('T=%5.2fC\n', result);
 y(t) = result;
 stripchart('Update',hLine,ydata);
 end
end
fclose(s1);