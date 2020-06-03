[w,fs] = audioread('Bye1.wav');
Bye1 = timetable(seconds((0:length(w)-1)'/fs),w);

[wYes1,fsYes1] = audioread('Yes1.wav');
Yes1 = timetable(seconds((0:length(w)-1)'/fsYes1),wYes1);

[wNo1,fsNo1] = audioread('No1.wav');
No1 = timetable(seconds((0:length(w)-1)'/fsNo1),wNo1);

[wSweet1,fsSweet1] = audioread('Sweet1.wav');
Sweet1 = timetable(seconds((0:length(w)-1)'/fsSweet1),wSweet1);

[wRip1,fsRip1] = audioread('Rip1.wav');
Rip1 = timetable(seconds((0:length(w)-1)'/fsRip1),wRip1);

[wHello1,fsHello1] = audioread('HelloTest1.wav');
Hello1 = timetable(seconds((0:length(w)-1)'/fsHello1),wHello1);


%%%%%%%%%%%%%%%% Change This %%%%%%%%%%%%%%%%%%%%%%
[w2,fs2] = audioread('YesTest.wav');
TestWord = timetable(seconds((0:length(w)-1)'/fs2),w2);


timeLimits = seconds([0 0.5108163]); % seconds
frequencyLimits = [4.616661 7141.974]; % Hz


% Index into signal time region of interest
Bye1_w_ROI = Bye1(:,'w');
Bye1_w_ROI = Bye1_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);

TestWord_w_ROI = TestWord(:,'w2');
TestWord_w_ROI = TestWord_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);

Yes1_w_ROI = Yes1(:,'wYes1');
Yes1_w_ROI = Yes1_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);

No1_w_ROI = No1(:,'wNo1');
No1_w_ROI = No1_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);

Sweet1_w_ROI = Sweet1(:,'wSweet1');
Sweet1_w_ROI = Sweet1_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);

Rip1_w_ROI = Rip1(:,'wRip1');
Rip1_w_ROI = Rip1_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);

Hello1_w_ROI = Hello1(:,'wHello1');
Hello1_w_ROI = Hello1_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);


% Compute spectral estimate
% Run the function call below without output arguments to plot the results
[PWord(1:4096,1), FWord(1:4096,1)] = pspectrum(Hello1_w_ROI, 'FrequencyLimits',frequencyLimits);

[PWord(1:4096,2), FWord(1:4096,2)] = pspectrum(Yes1_w_ROI, 'FrequencyLimits',frequencyLimits);

[PWord(1:4096,3), FWord(1:4096,3)] = pspectrum(No1_w_ROI, 'FrequencyLimits',frequencyLimits);

[PWord(1:4096,4), FWord(1:4096,4)] = pspectrum(Rip1_w_ROI, 'FrequencyLimits',frequencyLimits);

[PWord(1:4096,5), FWord(1:4096,5)] = pspectrum(Sweet1_w_ROI, 'FrequencyLimits',frequencyLimits);

[PWord(1:4096,6), FWord(1:4096,6)] = pspectrum(Bye1_w_ROI, 'FrequencyLimits',frequencyLimits);

[PWord(1:4096,7), FWord(1:4096,7)] = pspectrum(TestWord_w_ROI, 'FrequencyLimits',frequencyLimits);


% PBye1_w_ROI = mag2db(PBye1_w_ROI);
% PTestWord_w_ROI = mag2db(PTestWord_w_ROI);
% PYes1_w_ROI = mag2db(PYes1_w_ROI);
% PNo1_w_ROI = mag2db(PNo1_w_ROI);
% PSweet1_w_ROI = mag2db(PSweet1_w_ROI);
% PRip1_w_ROI = mag2db(PRip1_w_ROI);
% PHello1_w_ROI = mag2db(PHello1_w_ROI);

for i = 1:7
    PWord(1:4096,i) = mag2db(PWord(1:4096,i));
end

% RByeBye = corrcoef(PBye1_w_ROI,PTestWord_w_ROI)
% RYesBye = corrcoef(PBye1_w_ROI,PYes1_w_ROI)

words = ["Hello", "Yes", "No", "Rip", "Sweet", "Bye", "Tested Word"];

BestFit = 0;
FittestWord = "";

for i = 1:6
    R = corrcoef(PWord(1:4096,7),PWord(1:4096,i));
    
    if BestFit < R(2,1)
        BestFit = R(2,1);
        FittestWord = words(i);
    end
end

BestFit
FittestWord

% figure;
% grid
% ylabel('Power Spectrum (db)')
% xlabel('Frequency (Hz)')
% hold on;
% plot(FBye1_w_ROI,(PBye1_w_ROI),'k')
% plot(FTestWord_w_ROI,(PTestWord_w_ROI),'k')
% plot(FYes1_w_ROI,(PYes1_w_ROI),'r')
% hold off;
