%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time��2020/3/23
%Author: �����
%Function:�߹���ʵ��2 ���㺺������
clear,clc
datalib=xlsread('E:\ziliao\2_Term6_highd\Exp2����\����\SpectrumLibrary2');
data_judge=xlsread('E:\ziliao\2_Term6_highd\Exp2����\����\PixelSpectrum');
%ͼ���ֵ��
datalib1=im2bw(datalib,0.5);
data_judge1=im2bw(data_judge,0.5);
datalib1=double(datalib1);
data_judge1=double(data_judge1);

%���㺺������ 
% ����һ �����ڲ�����
% hming_dist=zeros(3,1);
% for i=1:3
%     temp=[datalib1(i,:);data_judge1];
%     hming_dist(i)=pdist(temp,'cityblock');
% end
%������ ��д����
hming_dist=zeros(3,1);
for i=1:3
    temp=[datalib1(i,:);data_judge1];
    for j=1:size(temp,2)
        hming_dist(i)=hming_dist(i)+abs(temp(1,j)-temp(2,j));
    end
end

%Ѱ����С�����������к�
minimum = min(hming_dist);
[x,y]=find(hming_dist==minimum);
%����к�
fid=fopen(['E:\ziliao\2_Term6_highd\Exp2����\����\','out1.txt'],'w');%д���ļ�·��
fprintf(fid,'�²������������ڣ� ');
fprintf(fid,'%d\r\n',x);   %�����������Ҫ���������fprintf(fid,'%.4\t',A(jj)); 
fclose(fid);
disp('�²������������ڣ� ')
disp(x)