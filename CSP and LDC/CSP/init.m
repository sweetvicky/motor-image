function init()%��ʼ������
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

data_x=cell(1,1);
data_source=cell(1,1);
data_x{1}=zeros(DATA_LENGTH,DATA_CHANNEL);
data_y=zeros(1,1);
R=cell(1,1);
data_size=0;
data_index=DATA_LENGTH;
return