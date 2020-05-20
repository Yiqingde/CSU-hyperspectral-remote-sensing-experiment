%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time：2020/4/29
%Author: 张睿祥
%Function:高光谱实验3 　 NFINDR函数
%输入：降维后的二维图像、M为端元个数、Np为所有像元总数
%返回：最纯的像元值索引和E矩阵
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
