%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time��2020/3/23
%Author: �����
%Function:�߹���ʵ��2 ������׽������ƥ��
clear,clc
datalib=xlsread('E:\ziliao\2_Term6_highd\Exp2����\����\SpectrumLibrary2');
data_judge=xlsread('E:\ziliao\2_Term6_highd\Exp2����\����\PixelSpectrum');
figure,

hold on
plot(datalib(1,:),'--*r')
hold on
plot(datalib(2,:),':sg')
hold on
plot(datalib(3,:),'-^b')
hold on
plot(data_judge(:),':.m')

legend('Aɳʯ','B������','Cʯ����','P');
title('��������ͼ')
xlabel('������')
ylabel('������')

length=8;
cof=zeros(3,2*length-1);
for i=1:3
    for j=1:size(cof,2)
        a=0;
        b=0;
        c=0;
        d=0;
        if j<=length
            a=1;
            b=j+10-length;
            c=length-j+1;
            d=10;
        elseif j<=2*length-1
            a=-length+j+1;
            b=10;
            c=1;
            d=10-j+length;
        end
        hehe=[a,b,c,d]
        temp=corrcoef(datalib(i,a:b),data_judge(c:d));
        cof(i,j)=temp(1,2);
    end
end
figure,
t=-length+1:length-1;
plot(t,cof(1,:),'--*r');
hold on;
plot(t,cof(2,:),':sg');
hold on;
plot(t,cof(3,:),'-^b');
legend('Aɳʯ','B������','Cʯ����');
title('�����������')
xlabel('ƫ��ֵ')
ylabel('���ϵ��')
set(gca,'XTick',t)

ASke=zeros(3,7)
for i=1:7
    ASke(:,i)=1-abs(cof(:,16-i)-cof(:,i))/2
end
