clear all;
close all;
clc;

%Setting the recorder to required sample rate, number of bits and channels
recorder=audiorecorder(16000,8,2);

%asking user for input
disp('Please Record Your Voice');
pause(1);

%recording for 5 seconds
recordblocking(recorder,5);

%play recorded clip
play(recorder);

%getting audio features and plot
data=getaudiodata(recorder);
plot(data)
figure;

%Feature extraction
f=VoiceFeatures(data);

%Save the users voice data
uno=input('Enter number label for speaker');
try
	load database
	F=[F;f];
	C=[C;uno];
	save database F C
end
msgbox('Voice is registered in the database')