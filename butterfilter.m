function outputData = butterfilter(inputData,norder,wn,ftype)
[b,a] = butter(norder,wn,ftype);
[cols rows] = size(inputData);
outputData = [];
for i=1:cols
    outputData = [outputData ; filter(b,a,inputData(i,:))];
end
