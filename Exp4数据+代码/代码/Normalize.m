%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time：2020/4/09
%Author: 张睿祥
%Function:高光谱实验4 3维归一化函数  
%输入： 3维矩阵 
%输出： double类型3维矩阵 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function OutImg = Normalize(InImg)
ymax=255;ymin=0;
xmax = max(max(InImg)); %求得InImg中的最大值
xmin = min(min(InImg)); %求得InImg中的最小值
OutImg = round((ymax-ymin)*(InImg-xmin)/(xmax-xmin) + ymin); %归一化并取整
end
