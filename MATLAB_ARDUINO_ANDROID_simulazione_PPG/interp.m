%load('Data002.mat');
x=Data002(:,1);
y=Data002(:,2);
xi=linspace(0,10000,10000);
yi=interp1(x,y,xi,'spline');
plot(xi,yi);
%%%%%%%%%%%%%%%%%%%%%

%%writePWMVoltage
%%clear
%%a=arduino('/dev/ttyUSB0','mini');

%arduinoCom = serial('/dev/ttyUSB5','BaudRate',9600);  % insert your serial properties here
%fopen(arduinoCom);
interv=10000;
paso=1;
t=1;
Y=0;
i=1;
figure('name','Pulsossimetro');
while(t<interv)
 while (i<10000)
   
 sendData = yi(i);
 %fprintf(arduinoCom,'%i',sendData); %this will send 5 to the arduino
 %fscanf(arduinoCom)    %this will read response or use BytesAvailableFcn property of serial
    Y=[Y,yi(i)];
      plot(Y,':.');
   % ylim([0 5]);
    grid
    t=t+paso;
    i=i+100;
    if (i>10000)
    i=1;
    end
    drawnow;
 end
        if (t>interv) 
        t=0; 
        end
end






