%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time��2020/4/29
%Author: �����
%Function:�߹���ʵ��3 �� ����ͼ��������ͼ��
%����NFINDR�����������Ȳ��â���Լ����۰�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc,clear,close all
%% ---------------------------------����ٷ�-----------------���뽵ά��ͼ��-----------
[image,pt,ft]=freadenvi('E:\ziliao\2_Term6_highd\Exp3����+����\output\123');
dim=size(image);
image=double(image);
[loc,E]=NFINDR(image(:,1:11),12,140000);

%% ---------------------------------�������� ��Լ��----------------------------
A=image(loc,1:12)';
inv_A=inv(A);
scale=[];
for i=1:dim(1)
    single=image(i,1:12)';
    scale(i,:)=(inv_A*single)';
end
%% ---------------------------------�������� ��Լ��----------------------------
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
%% ---------------------------------�����----------------------------
close all,
image1=[];
for i=1:12
    image1(:,:,i)=reshape(scale(:,i),pt(1),pt(2));
    figure,
    imshow(image1(:,:,i)),
    colorbar;
    colormap(jet);
end
enviwrite(image1,pt(1),pt(2),12,'E:\ziliao\2_Term6_highd\Exp3����+����\output\--Լ��');
