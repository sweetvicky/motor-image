% mian.m
load('A01E.mat');
% eegclass = {'','',''}
[preX,T,Y,Fs,class] = preProcess(data,1);
classes = 1:size(class,2);
% [EEG, com, b] = pop_eegfiltnew(outputX);

%经过butter滤波
wn = [8 30] / Fs;
norder = 5;
butterX = butterfilter(preX,norder,wn,'bandpass');

%将时域EGG-标签形式提取
[resetX,labels] = resetData(butterX,T,Y,classes);

figure();
plot(preX(1,:),'r');
hold on;
plot(butterX(1,:),'k')
xlabel('Time');
ylabel('Amplitude')
