%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time：2020/4/29
%Author: 张睿祥
%Function:高光谱实验3 　 读入图像输出丰度图像
%调用NFINDR函数，推算丰度采用②无约束或③半月束
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc,clear,close all
%% ---------------------------------①穷举法-----------------读入降维后图像-----------
[image,pt,ft]=freadenvi('E:\ziliao\2_Term6_highd\Exp3数据+代码\output\123');
dim=size(image);
image=double(image);
[loc,E]=NFINDR(image(:,1:11),12,140000);

%% ---------------------------------②推算丰度 无约束----------------------------
A=image(loc,1:12)';
inv_A=inv(A);
scale=[];
for i=1:dim(1)
    single=image(i,1:12)';
    scale(i,:)=(inv_A*single)';
end
%% ---------------------------------③推算丰度 有约束----------------------------
% A=ones(13,12);
% A(2:end,:)=image(loc,1:12)';
% for i=1:12
%     A(i,i)=A(i,i)+0.01;
% end
% scale=[];
% for i=1:dim(1)
%     single=[1,image(i,1:12)]';
%     scale(i,:)=linsolve(A,single);
%     sum(scale(i,:));
% end
%% ---------------------------------④输出----------------------------
close all,
image1=[];
for i=1:12
    image1(:,:,i)=reshape(scale(:,i),pt(1),pt(2));
    figure,
    imshow(image1(:,:,i)),
    colorbar;
    colormap(jet);
end
enviwrite(image1,pt(1),pt(2),12,'E:\ziliao\2_Term6_highd\Exp3数据+代码\output\--约束');
