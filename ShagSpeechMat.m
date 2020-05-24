Fs = 44100;

[P1,f1] = periodogram(HelloTest1,[],[],Fs,'power');
[P2,f2] = periodogram(HelloTest2,[],[],Fs,'power');

subplot(3,1,1)
plot(f1,P1,'k')
grid
ylabel('P_1')
title('Power Spectrum')
axis([0 0.18*10^4 0 0.00025])

subplot(3,1,2)
plot(f2,P2,'r')
grid
ylabel('P_2')
xlabel('Frequency (Hz)')
axis([0 0.18*10^4 0 0.00025])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Magnitude-squared coherence %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[Cxy,f] = mscohere(HelloTest1,HelloTest2,[],[],[],Fs);

thresh = 0.75;
[pks,locs] = findpeaks(Cxy,'MinPeakHeight',thresh);
MatchingFreqs = f(locs);

subplot(3,1,3)
plot(f,Cxy)
ax = gca;
grid
xlabel('Frequency (Hz)')
title('Coherence Estimate')
ax.XTick = MatchingFreqs;
ax.YTick = thresh;
axis([0 0.18*10^4 0 1])

