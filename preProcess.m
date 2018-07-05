function [outputX,outputT,outputY,Fs,classes] = preProcess(inputData,channel)
outputX = [];
outputY = [];
for i=4:size(inputData,2)
    outputX = [outputX ; inputData{i}.X(:,channel)'];
    outputY = [outputY ; inputData{i}.y'];
end
outputT = inputData{i}.trial;
Fs = inputData{i}.fs;
classes = inputData{i}.classes;
