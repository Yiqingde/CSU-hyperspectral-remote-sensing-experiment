%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time��2020/4/09
%Author: �����
%Function:�߹���ʵ��4 3ά��һ������  
%���룺 3ά���� 
%����� double����3ά���� 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function OutImg = Normalize3(InImg)
ymax=1;ymin=0.00000000000000001;
for i=1:3
    xmax = max(max(InImg(:,:,i))); %���InImg�е����ֵ
    xmin = min(min(InImg(:,:,i))); %���InImg�е���Сֵ
    OutImg(:,:,i) = (ymax-ymin)*(InImg(:,:,i)-xmin)/(xmax-xmin) + ymin; %��һ����ȡ��
end
end
