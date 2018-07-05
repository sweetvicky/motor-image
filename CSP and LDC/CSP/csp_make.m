function csp_make(y)
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

R{data_size}=data_x{data_size}(time_start:time_end,:)'*data_x{data_size}(time_start:time_end,:);
data_y(data_size)=y;
if data_size<30
    return;
end

R1=zeros(DATA_CHANNEL,DATA_CHANNEL);
R2=zeros(DATA_CHANNEL,DATA_CHANNEL);
for i=1:data_size
    if data_y(i)>0
        R1=R1+R{i};
    else
        R2=R2+R{i};
    end
end
R1=R1/trace(R1);
R2=R2/trace(R2);
R3=R1+R2;
close all
figure();surf(R1);
figure();surf(R2);
figure();surf(R3);
[U0,Sigma]=eig(R3);
P=Sigma^(-0.5)*U0';
YL=P*R1*P';
[UL,SigmaL]=eig(YL);
[Y,I]=sort(diag(SigmaL), 'descend');
F=P'*UL(:,I([1:N,DATA_CHANNEL-N+1:DATA_CHANNEL]));

f1=[];f2=[];
for i=1:data_size
    if data_y(i)==1
        f1=[f1,log(sum((data_x{i}(time_start:time_end,:)*F).^2))'];
    end
    if data_y(i)==-1
        f2=[f2,log(sum((data_x{i}(time_start:time_end,:)*F).^2))'];
    end
end
%����������
F1=f1';F2=f2';
M1=mean(F1,1)';M2=mean(F2,1)';
count1=size(f1,2)-1;count2=size(f2,2)-1;
w=(inv((count1*cov(F1)+count2*cov(F2))/(count1+count2))*(M2-M1))';
b=-w*(M1+M2)/2;
return