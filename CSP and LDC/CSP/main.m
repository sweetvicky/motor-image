%main.m是一个过程不是函数，模拟混编时C++所干的事情
clc;clear;
global Fs;%采样频率
global N;%提取特征对数
global DATA_CHANNEL;%通道数
global DATA_LENGTH;%样本长度
global time_start;%开始时间
global time_end;%结束时间
global data_source;%存放原始数据
global data_x;%存放滤波后的数据
global data_y;%存放数据对应标签
global R;%样本的相关系数
global data_size;%样本数量
global data_index;%数据池指针
global F;%CSP所寻找到的投影方向
global w;%LDA权值
global b;%LDA偏移
global filter_a;%滤波系数a
global filter_b;%滤波系数b

%属性设置
Fs=1000;
N=3;
DATA_CHANNEL=21;
DATA_LENGTH=3*Fs;
time_start=1;
time_end=DATA_LENGTH;
filt_n =5;
Wn=[8 30]/(Fs/2);
[filter_b,filter_a]=butter(filt_n,Wn);



right=0;all=0;
init;
load('..\\dataset\\data_7.mat');
for i=1:size(x,1)
    for j=1:DATA_LENGTH
        data_set(x{i}(j,:));
    end
    if data_size>30
        y_test=data_test();
        if y(data_size)==y_test
            right=right+1;
        end
        all=all+1;
        disp([all floor(right/all*100)]);
    end
    csp_make(y(data_size));
end
data_save('data.mat');