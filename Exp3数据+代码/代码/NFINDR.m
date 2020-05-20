%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time��2020/4/29
%Author: �����
%Function:�߹���ʵ��3 �� NFINDR����
%���룺��ά��Ķ�άͼ��MΪ��Ԫ������NpΪ������Ԫ����
%���أ������Ԫֵ������E����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ind,E] = NFINDR(img,M,Np)
ind = unidrnd(Np, 1,M);
E   = ones(M);
E(2:end,:) = img(ind,:)';
dentor = factorial(M-1);
V_max  = abs(det(E))/dentor;
for i = 1:M  
    i_max = ind(i);
    for j = 1:Np  
        E(2:end,i) = img(j,:)';
        V = abs(det(E))/dentor;
        k = V>V_max;
        i_max(k) = j;
        V_max(k) = V;
    end
    E(2:end,i) = img(i_max,:)';
    ind(i) = i_max;
end
