function rgb=exp4_rgb2hsi(hsi)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time：2020/4/09
%Author: 张睿祥
%Function:hsi->hsi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

H=hsi(:,:,1);
%  H=H*2*pi;
S=hsi(:,:,2);
I=hsi(:,:,3);
% R=zeros(size(I,1),size(I,2));
% B=zeros(size(I,1),size(I,2));
% G=zeros(size(I,1),size(I,2));
%进行赋值
for i=1:size(I,1)
    for j=1:size(I,2)
        if(H(i,j)>=0&&H(i,j)<pi*2/3)
           R(i,j)=I(i,j)*(1+(S(i,j)*cos(H(i,j)))/cos(pi/3-H(i,j)));
           B(i,j)=I(i,j)*(1-S(i,j));
           G(i,j)=3*I(i,j)-(R(i,j)+B(i,j));
        elseif(H(i,j)>=pi*2/3&&H(i,j)<4*pi/3)
            H(i,j)=H(i,j)-pi*2/3;
            G(i,j)=I(i,j)*(1+(S(i,j)*cos(H(i,j)))/cos(pi/3-H(i,j)));
            R(i,j)=I(i,j)*(1-S(i,j));
            B(i,j)=3*I(i,j)-(R(i,j)+G(i,j));
        elseif(H(i,j)>=pi*4/3&&H(i,j)<2*pi)
            H(i,j)=H(i,j)-pi*4/3;
            B(i,j)=I(i,j)*(1+(S(i,j)*cos(H(i,j)))/cos(pi/3-H(i,j)));
            G(i,j)=I(i,j)*(1-S(i,j));
            R(i,j)=3*I(i,j)-(G(i,j)+B(i,j));
        end
    end
end

rgb=cat(3,R,G,B);
%  rgb=max(min(rgb,1),0);
