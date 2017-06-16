load DataFitted_10000

drift = DATA_Fitted(:,2);%Signal (Y)
t= DATA_Fitted(:,1);%Time (X)
Fs=1000;%Sample frequncy 1kHz

% subplot(2,1,1);
% plot(drift,t);

Nf = 50; 
Fpass = 100; 
Fstop = 120;

d = designfilt('differentiatorfir','FilterOrder',Nf, ...
    'PassbandFrequency',Fpass,'StopbandFrequency',Fstop, ...
    'SampleRate',Fs);

fvtool(d,'MagnitudeDisplay','zero-phase','Fs',Fs)

dt = t(2)-t(1);

vdrift = filter(d,drift)/dt;

delay = mean(grpdelay(d))

tt = t(1:end-delay);
vd = vdrift;
vd(1:delay) = [];

tt(1:delay) = [];
vd(1:delay) = [];

%%

[pkp,lcp] = findpeaks(drift);
zcp = zeros(size(lcp));

[pkm,lcm] = findpeaks(-drift);
zcm = zeros(size(lcm));

[pkp2,lcp2] = findpeaks(vd);
zcp2 = zeros(size(lcp2));

[pkm2,lcm2] = findpeaks(-vd);
zcm2 = zeros(size(lcm2));

subplot(3,1,1)
plot(t,drift,t([lcp lcm]),[pkp -pkm],'or')
xlabel('Time')
ylabel('Signal')
grid

subplot(3,1,2)
plot(tt,vd,t([lcp lcm]),[zcp zcm],'or')
xlabel('Time')
ylabel('First Derivtive')
grid

%%

%figure;
adrift = filter(d,vdrift)/dt;

at = t(1:end-2*delay);
ad = adrift;
ad(1:2*delay) = [];

at(1:2*delay) = [];
ad(1:2*delay) = [];

[pkp3,lcp3] = findpeaks(ad);
zcp3 = zeros(size(lcp3));

[pkm3,lcm3] = findpeaks(-ad);
zcm3 = zeros(size(lcm3));


% subplot(2,1,1)
% plot(tt,vd)
% xlabel('Time (s)')
% ylabel('First derivative')
% grid

subplot(3,1,3)
%plot(t,drift,t([lcp lcm]),[pkp -pkm],'or')
plot(at,ad)
ax = gca;
ax.YLim =[-1 1];
xlabel('Time (s)')
ylabel('Second Derivative')
grid