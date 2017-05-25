%load('Data002.mat');
x=Data002(:,1);
y=Data002(:,2);
xi=linspace(0,10000,10000);
yi=interp1(x,y,xi,'spline');
plot(xi,yi);
%mapping of yi fra 0 e 1023
for i=1:10000
    yi(i)=yi(i)*1024/5000;
end
%%%%%%%%%%%%%%%%%%%%%

%%writePWMVoltage
%%clear
%%a=arduino('/dev/ttyUSB0','mini');

arduinoCom = serial('/dev/ttyUSB8','BaudRate',9600);  % insert your serial properties here

interv=10000;
paso=1;
t=1;
Y=0;
i=1;
bpm=60;
FREQ=bpm/60;%HZ
figure('name','Pulsossimetro');
while(t<interv)
 while (i<10000)
   fopen(arduinoCom);
 sendData = yi(i);
 fprintf(arduinoCom,'%i',sendData); %this will send 5 to the arduino
 %fscanf(arduinoCom)    %this will read response or use BytesAvailableFcn property of serial
 fclose(arduinoCom);
    Y=[Y,yi(i)];
      plot(Y,':.');
    ylim([0 1023]);
    grid
    t=t+paso;
    i=ceil(i+150/(FREQ));%150 e' un fattore correttivo
    if (i>10000)
    i=1;
    end
    drawnow;
 end
        if (t>interv) 
        t=0; 
        end
end
