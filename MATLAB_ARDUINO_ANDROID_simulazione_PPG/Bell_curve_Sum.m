x = linspace(0,1,1000);

%Base curves superimposition
base = 4*cos(2*pi*x);

Pos = [1 2 3 5 7 8]/10;%position of the peak
Hgt = [3 7 5 5 4 5];%heigth of the peak
Wdt = [1 3 3 4 2 3]/100;%width of the peak
figure(1);
for n = 1:length(Pos)
    %Gauss curves creation
    Gauss(n,:) =  Hgt(n)*exp(-((x - Pos(n))/Wdt(n)).^2);
    %Plot of the curve
    plot(x,Gauss(n,:),'--')
    hold on;
end

PeakSig = sum(Gauss)+base;
%plot of the base
plot(x,PeakSig,x,base)

figure(2);
%findpeaks will plot PeakSig automatically
findpeaks(PeakSig,x,'MinPeakProminence',4,'Annotate','extents')
%[pks,locs,widths,proms] = findpeaks(PeakSig,x);