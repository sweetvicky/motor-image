%main.m��һ�����̲��Ǻ�����ģ����ʱC++���ɵ�����
clc;clear;
global Fs;%����Ƶ��
global N;%��ȡ��������
global DATA_CHANNEL;%ͨ����
global DATA_LENGTH;%��������
global time_start;%��ʼʱ��
global time_end;%����ʱ��
global data_source;%���ԭʼ����
global data_x;%����˲��������
global data_y;%������ݶ�Ӧ��ǩ
global R;%���������ϵ��
global data_size;%��������
global data_index;%���ݳ�ָ��
global F;%CSP��Ѱ�ҵ���ͶӰ����
global w;%LDAȨֵ
global b;%LDAƫ��
global filter_a;%�˲�ϵ��a
global filter_b;%�˲�ϵ��b

%��������
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