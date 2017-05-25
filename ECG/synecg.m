function synecg
%# DEVELOPING SYNTHETIC ECG IN MATLAB
disp('This function is able to generate synthetic electrocardiograms')
disp('for 10 seconds. Input your heart rate (per minute) and the')
disp('desired peak voltage in millivolts.')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=input('Input your heart rate (in beats per minute)=');
p=input('Input desired Peak voltage(in mV)=');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1=10;
% t1=10 seconds is preferred to enable us have clearer RR tachograms.
% indicates the duration
x1 = p*ecg(6000).';
%denoising ecg signals with savitsky-golay filter for us to
%get noiseless or ideal ECG
y1 = sgolayfilt(kron(ones(1,19),x1),0,25);

disp('Number of heart beats per 10 seconds=')
m = round(h/6)

if (h <= 105)
if (m==5)
    n1=32000;

elseif (m==6)
    n1=37000;

elseif (m==7)
    n1=43000;

elseif m==8
n1=49000;
elseif m==9
n1=55000;
elseif m==10
n1=60000;
elseif m==11
n1=66000;
elseif m==12
n1=75000;
elseif m==13
n1=80000;
elseif m==14
n1=85100;
elseif m==15
n1=92000;
elseif m==16
n1=98000;
elseif m==17
n1=100000;
end
else
disp('Heart Rate inputexceeds limit')
end
n = 1:n1;
del = round(6000*rand(1));
mhb = y1(n + del); t =linspace(0,t1,n1);
colordef white; 
plot(t,mhb, 'g');
q=p+0.5;
axis([0 t1 -q q]); grid;
xlabel('Time [sec]'); ylabel('Voltage[mV]');
title('Artificial Electrocardiogram');
legend('Isoelectric line');
end