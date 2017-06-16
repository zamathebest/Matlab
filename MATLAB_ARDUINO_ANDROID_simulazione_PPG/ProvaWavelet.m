load DataFitted_10000

signal = DATA_Fitted(:,2);
lev   = 5;
wname = 'db1';
nbcol = 256;
[c,l] = wavedec(signal,lev,wname);
len = length(signal);
cfd = zeros(lev,len);
for k = 1:lev
    d = detcoef(c,l,k);
    d = d(:)';
    d = d(ones(1,2^k),:);
    cfd(k,:) = wkeep1(d(:)',len);
end
cfd =  cfd(:);
I = find(abs(cfd)<sqrt(eps));
cfd(I) = zeros(size(I));
cfd    = reshape(cfd,lev,len);
cfd = wcodemat(cfd,nbcol,'row');

h211 = subplot(3,1,1);
h211.XTick = [];
plot(signal,'r');
title('Analyzed signal.');
ax = gca;
ax.XLim = [1 length(signal)];
subplot(3,1,2);
colormap(cool(128));
image(cfd);
tics = 1:lev;
labs = int2str(tics');
ax = gca;
ax.YTickLabelMode = 'manual';
ax.YDir = 'normal';
ax.Box = 'On';
ax.YTick = tics;
ax.YTickLabel = labs;
title('Discrete Transform, absolute coefficients.');
ylabel('Level');
% 
[cfs,f] = cwt(signal,1,'waveletparameters',[3 3.1]);
% hp = pcolor(1:length(signal),f,abs(cfs)); hp.EdgeColor = 'none';
% set(gca,'YScale','log');
% xlabel('Sample'); ylabel('log10(f)');
% 
subplot(3,1,3);
plot(abs(cfs(1,:))); grid on;