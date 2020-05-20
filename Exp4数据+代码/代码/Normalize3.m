%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time：2020/4/09
%Author: 张睿祥
%Function:高光谱实验4 3维归一化函数  
%输入： 3维矩阵 
%输出： double类型3维矩阵 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function OutImg = Normalize3(InImg)
ymax=1;ymin=0.00000000000000001;
for i=1:3
    xmax = max(max(InImg(:,:,i))); %求得InImg中的最大值
    xmin = min(min(InImg(:,:,i))); %求得InImg中的最小值
    OutImg(:,:,i) = (ymax-ymin)*(InImg(:,:,i)-xmin)/(xmax-xmin) + ymin; %归一化并取整
end
end
