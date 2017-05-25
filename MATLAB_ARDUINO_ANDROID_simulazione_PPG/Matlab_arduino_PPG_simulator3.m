%%Uso matlabascii.ino
%creo un Segnale PPG virtuale
%load('Data002.mat');
x=Data002(:,1);
y=Data002(:,2);
xi=linspace(0,10000,10000);
yi=interp1(x,y,xi,'spline');
plot(xi,yi);
%mapping of yi fra 0 e 1023
for i=1:10000
    yi(i)=yi(i)/1000;
end

%%
%Apro la comunicazione seriale

arduinoCom = serial('/dev/ttyUSB3');  % insert your serial properties here
set(arduinoCom, 'Baudrate', 9600);
set(arduinoCom, 'Parity', 'none');
set(arduinoCom, 'Databits', 8);
set(arduinoCom, 'Stopbit', 1);
set(arduinoCom, 'Terminator', 'CR/LF');
set(arduinoCom, 'OutputBufferSize', 22);

fopen(arduinoCom);%NB: non chiudo la comunicazione con un fclose()
%Non chiudendo con fclose arduino rimarra nel suo loop
%while(Serial.available>0){...}
%quindi devo mettere la scrittura bluetooth in quel loop
%%
%%parameti da settare per l'onda PPG
bpm=90;
saturacion=98;

%%
SATUR=saturacion/100*5;%converto in volt
interv=100;
paso=1;
t=1;
Y=0;
i=1;
FREQ=bpm/60;%converto in HZ
figure('name','Pulsossimetro');

while(t<interv)
 while (i<10000)
  
 %%sendData = '#+%d+0.00+0.00+0.00+~',yi(i);
 %ATTENZIONE: Invio solo caratteri ASCII
 fprintf(arduinoCom,'#%0.2f+%0.2f+%0.2f+%0.2f+~',[yi(i),SATUR,0,0]);%
 
 %fscanf(arduinoCom)    %this will read response or use BytesAvailableFcn property of serial
 %fclose(arduinoCom);
    Y=[Y,yi(i)];
      plot(Y,':.');
    ylim([0 5]);
    xlim([0 100]);
    
    grid
    t=t+paso;
    i=ceil(i+150*FREQ);%150 e' un fattore correttivo legato al fitting del segnale PPG 
    %(più è fitto il segnale pi tempo ci vuole ad inviare tutti i dati)
   
    drawnow;
    if (i>10000)
        i=1;
    end
    if (t>interv) 
            t=0;
            Y=yi(i);
    end
 end
      
        
        
end
