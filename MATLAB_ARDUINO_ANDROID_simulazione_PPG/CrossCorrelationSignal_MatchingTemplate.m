load DataFitted_10000

Fs=1000;

signal = DATA_Fitted(:,2);
t1 = DATA_Fitted(:,1);

template = Template_zeropadding
t2 = t1;

figure(1);
subplot(2,1,1)
plot(t1,signal)
title('PPG Signal')

subplot(2,1,2)
plot(t2,template)
title('Zero Padding PPG Template')
xlabel('Time (s)')

[acor,lag] = xcorr(template,signal);

[~,I] = max(abs(acor));
lagDiff = lag(I);

timeDiff = lagDiff/Fs

figure(2);
plot(lag,acor)
a3 = gca;
title('Crosscorrelation');

%%

[Rmm,lags] = xcorr(signal,'unbiased');

Rmm = Rmm(lags>0);
lags = lags(lags>0);

figure(3);
plot(lags/Fs,Rmm)
xlabel('Lag (s)')
title('Autocorrelation');