[w,fs] = audioread('Bye1.wav');
Bye1 = timetable(seconds((0:length(w)-1)'/fs),w);

[w2,fs2] = audioread('Bye2.wav');
Bye2 = timetable(seconds((0:length(w)-1)'/fs2),w2);

[w3,fs3] = audioread('Yes1.wav');
Yes1 = timetable(seconds((0:length(w)-1)'/fs3),w3);

[wNo1,fsNo1] = audioread('No1.wav');
No1 = timetable(seconds((0:length(w)-1)'/fs3),w3);

[wSweet1,fsSweet1] = audioread('Sweet1.wav');
Yes1 = timetable(seconds((0:length(w)-1)'/fs3),w3);

[w3,fs3] = audioread('Yes1.wav');
Yes1 = timetable(seconds((0:length(w)-1)'/fs3),w3);

[w3,fs3] = audioread('Yes1.wav');
Yes1 = timetable(seconds((0:length(w)-1)'/fs3),w3);


timeLimits = seconds([0 0.5108163]); % seconds
frequencyLimits = [4.616661 7141.974]; % Hz


% Index into signal time region of interest
Bye1_w_ROI = Bye1(:,'w');
Bye1_w_ROI = Bye1_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);

Bye2_w_ROI = Bye2(:,'w2');
Bye2_w_ROI = Bye2_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);

Yes1_w_ROI = Yes1(:,'w3');
Yes1_w_ROI = Yes1_w_ROI(timerange(timeLimits(1),timeLimits(2),'closed'),1);



% Compute spectral estimate
% Run the function call below without output arguments to plot the results
[PBye1_w_ROI, FBye1_w_ROI] = pspectrum(Bye1_w_ROI, 'FrequencyLimits',frequencyLimits);

%%%
[PBye2_w_ROI, FBye2_w_ROI] = pspectrum(Bye2_w_ROI, 'FrequencyLimits',frequencyLimits);
%%%

%%%%%%%%%%%%%%%%%%%%%%%
[PYes1_w_ROI, FYes1_w_ROI] = pspectrum(Yes1_w_ROI, 'FrequencyLimits',frequencyLimits);
%%%%%%%%%%%%%%%%%%%%%%%


PBye1_w_ROI = mag2db(PBye1_w_ROI);
PBye2_w_ROI = mag2db(PBye2_w_ROI);

PYes1_w_ROI = mag2db(PYes1_w_ROI);

RByeBye = corrcoef(PBye1_w_ROI,PBye2_w_ROI)

RYesBye = corrcoef(PBye1_w_ROI,PYes1_w_ROI)

figure;
grid
ylabel('Power Spectrum (db)')
xlabel('Frequency (Hz)')
hold on;
plot(FBye1_w_ROI,(PBye1_w_ROI),'k')
plot(FBye2_w_ROI,(PBye2_w_ROI),'k')
plot(FYes1_w_ROI,(PYes1_w_ROI),'r')
hold off;
