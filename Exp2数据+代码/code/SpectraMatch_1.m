%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time：2020/3/23
%Author: 张睿祥
%Function:高光谱实验2 计算汉明距离
clear,clc
datalib=xlsread('E:\ziliao\2_Term6_highd\Exp2数据\数据\SpectrumLibrary2');
data_judge=xlsread('E:\ziliao\2_Term6_highd\Exp2数据\数据\PixelSpectrum');
%图像二值化
datalib1=im2bw(datalib,0.5);
data_judge1=im2bw(data_judge,0.5);
datalib1=double(datalib1);
data_judge1=double(data_judge1);

%计算汉明距离 
% 方法一 调用内部函数
% hming_dist=zeros(3,1);
% for i=1:3
%     temp=[datalib1(i,:);data_judge1];
%     hming_dist(i)=pdist(temp,'cityblock');
% end
%方法二 自写函数
hming_dist=zeros(3,1);
for i=1:3
    temp=[datalib1(i,:);data_judge1];
    for j=1:size(temp,2)
        hming_dist(i)=hming_dist(i)+abs(temp(1,j)-temp(2,j));
    end
end

%寻找最小汉明距离行列号
minimum = min(hming_dist);
[x,y]=find(hming_dist==minimum);
%输出行号
fid=fopen(['E:\ziliao\2_Term6_highd\Exp2数据\数据\','out1.txt'],'w');%写入文件路径
fprintf(fid,'猜测这种物质属于： ');
fprintf(fid,'%d\r\n',x);   %按列输出，若要按行输出：fprintf(fid,'%.4\t',A(jj)); 
fclose(fid);
disp('猜测这种物质属于： ')
disp(x)