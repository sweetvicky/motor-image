function data_set(data)%输入数据
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


data_index=data_index+1;
if data_index>DATA_LENGTH
    data_size=data_size+1;
    data_source{data_size}=zeros(DATA_LENGTH,DATA_CHANNEL);
    data_index=1;
end
data_source{data_size}(data_index,:)=data;

%信号滤波
if data_index==DATA_LENGTH
    for i=1:DATA_CHANNEL
        data_x{data_size}(:,i)=filter(filter_b,filter_a,data_source{data_size}(:,i));
    end
end
return