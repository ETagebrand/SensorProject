
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% New Words Collection %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% sound1 = audioread('HelloTest1.wav');
% sound2 = audioread('HelloTest2.wav');
% 
Fs = 44100;
% 
% [P1,f1] = periodogram(sound1,[],[],Fs,'power');
% [P2,f2] = periodogram(sound2,[],[],Fs,'power');
% 
% subplot(2,1,1)
% plot(f1,P1,'k')
% grid
% ylabel('P_1')
% title('Power Spectrum')
% axis([0 0.18*10^4 0 0.00010])
% 
% subplot(2,1,2)
% plot(f2,P2,'r')
% grid
% ylabel('P_2')
% xlabel('Frequency (Hz)')
% axis([0 0.18*10^4 0 0.00010])
% 
% Word = 'Bye'
% 
% [pk1,lc1] = findpeaks(P1,'SortStr','descend','NPeaks',3);
% P1peakFreqs = f1(lc1);
% 
% [pk2,lc2] = findpeaks(P2,'SortStr','descend','NPeaks',3);
% P2peakFreqs = f2(lc2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Word Test. Find Peaks %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

TestSignal = audioread('HelloTest.wav');

[Ptest,ftest] = periodogram(TestSignal,[],[],Fs,'power');

figure;
plot(ftest,Ptest, 'g');
grid
ylabel('P_Test')
xlabel('Frequency (Hz)')
axis([0 0.18*10^4 0 0.00020])

[pktest,lctest] = findpeaks(Ptest,'SortStr','descend','NPeaks',3);
P1peakFreqsTest = ftest(lctest)

words = ["Hello", "Yes", "No", "Rip", "Sweet", "Bye"];

lowestValue = 1000;

for i = 1:6
    
    Difference = abs((P1peakFreqsTest(1) - WordPeakData(1,i))) + abs((P1peakFreqsTest(2) - WordPeakData(2,i))) + abs((P1peakFreqsTest(3) - WordPeakData(3,i)));
    
    if Difference < lowestValue
        lowestIndex = i;
        lowestValue = Difference;
    end
    
end

words(lowestIndex)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Magnitude-squared coherence %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [Cxy,f] = mscohere(HelloTest1,HelloTest2,[],[],[],Fs);
% 
% thresh = 0.6;
% [pks,locs] = findpeaks(Cxy,'MinPeakHeight',thresh);
% MatchingFreqs = f(locs);
% 
% subplot(3,1,3)
% plot(f,Cxy)
% ax = gca;
% grid
% xlabel('Frequency (Hz)')
% title('Coherence Estimate')
% ax.XTick = MatchingFreqs;
% ax.YTick = thresh;
% axis([0 0.18*10^4 0 1])

