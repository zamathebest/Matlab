%%Creation of an analytic template
%INCOMPLETE!!!!!!!!
load Data002.mat

x = linspace(0,1,1000);

%Base curves superimposition
base = 4*cos(2*pi*x);

Pos = [1251 2575]/10000;%position of the peak
Hgt = [2921 888];%heigth of the peak
Wdt = [591.6712 385.9315]/10000;%width of the peak
figure(1);
for n = 1:length(Pos)
    %Gauss curves creation
    Gauss(n,:) =  Hgt(n)*exp(-((x - Pos(n))/Wdt(n)).^2);
    %Plot of the curve
    plot(x,Gauss(n,:),'--')
    hold on;
end

PeakSig = sum(Gauss);%+base;
%plot of the base
plot(x,PeakSig)
%plot(x,base)

% figure(2);
% %findpeaks will plot PeakSig automatically
% findpeaks(PeakSig,x,'MinPeakProminence',4,'Annotate','extents')
% %[pks,locs,widths,proms] = findpeaks(PeakSig,x);