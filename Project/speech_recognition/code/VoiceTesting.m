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

%classifier
load database
D=[];
for(i=1:size(F,1))
	d=sum(abs(F(i)-f));
	D=[D d];
end

%smallest distance classifier
sm=inf;
ind=-1;
for(i=1:length(D))
	if(D(i)<sm)
		sm=D(i);
		ind=1;
	end
end
detected_class=C(ind);
disp('The detected class is:');
detected_class
  