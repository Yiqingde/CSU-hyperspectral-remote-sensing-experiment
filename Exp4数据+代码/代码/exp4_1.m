%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time：2020/4/09
%Author: 张睿祥
%Function:高光谱实验4 全色与多光谱合一合　 
%调用Normalize3归一化函数 exp4_rgb2hsi、exp4_rgb2hsi颜色转换函数 freadenvi enviwrite读写envi图像函数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------------------------①读取函数 前3波段升采样-----------------读入CSU_MS 输出升采样J2图像-----------
[image,pt,ft]=freadenvi('E:\ziliao\2_Term6_highd\Exp4数据+代码\数据\CSU_MS');
image=double(image);
image1=zeros(488,310,3);
for i=1:3
    image1(:,:,i)=reshape(image(:,i),488,310);
end
times=2/0.5
J1=zeros(488*times,310*times,3);
for i=1:3
    J1(:,:,i)=imresize(image1(:,:,i),times,'bicubic');
end
J2=Normalize3(J1);%归一化 0到1 double

%---------------------------------②RGB转换到IHS空间 全色替换I 再逆合成混合图像fusion-----------------
%转换成IHS
IHS=exp4_rgb2hsi(J2(:,:,3:-1:1));  %将RGB变换到IHS空间，生成的IHS图像中，1通道对应H，2通道对应S，3通道对应I
%读全色图像 输出pan 0-1double类型
[ori_pan,pt,ft]=freadenvi('E:\ziliao\2_Term6_highd\Exp4数据+代码\数据\CSU_PAN');
pan=zeros(1952,1240);
pan=reshape(ori_pan,1952,1240)/max(ori_pan);
%直方图匹配  实验未要求不用
% [counts,x]=imhist(IHS(:,:,3));%RGB 直方图匹配
% pan=histeq(pan,counts);
%用pan代替IHS的I分量
IHS(:,:,3)=pan;
%逆IHS变换，构建融合图象
fusion=exp4_hsi2rgb(IHS);
%调用matlab自带rgb2hsi两个函数的话 把下面这个取消加上
% fusion=Normalize3(fusion);%归一化 0到1 double 
%---------------------------------②输出envi envi打开---------------------------------------------------
figure,imshow(Normalize3(image1(:,:,3:-1:1)));
title('original')
figure,imshow(fusion);
title('IHS');
enviwrite(fusion,1952,1240,3,'E:\ziliao\2_Term6_highd\Exp4数据+代码\outputdata\fusion');
