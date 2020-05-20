function hsi=exp4_rgb2hsi(f)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time：2020/4/09
%Author: 张睿祥
%Function:rgb->hsi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(f);
R=f(:,:,1);
G=f(:,:,2);
B=f(:,:,3);
%进行赋值
I=(R+G+B)/3;
S=1-(3.*min(min(R,G),B))./(R+B+G+eps);
theta=acos((((R-G)+(R-B))*0.5)./(sqrt((R-G).*(R-G)+(R-B).*(G-B))+eps));
H=theta;
H(B>G)=2*pi-H(B>G);
% H=H/(2*pi);
%返回
hsi=cat(3,H,S,I);