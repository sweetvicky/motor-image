function data_set(data)%��������
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


data_index=data_index+1;
if data_index>DATA_LENGTH
    data_size=data_size+1;
    data_source{data_size}=zeros(DATA_LENGTH,DATA_CHANNEL);
    data_index=1;
end
data_source{data_size}(data_index,:)=data;

%�ź��˲�
if data_index==DATA_LENGTH
    for i=1:DATA_CHANNEL
        data_x{data_size}(:,i)=filter(filter_b,filter_a,data_source{data_size}(:,i));
    end
end
return