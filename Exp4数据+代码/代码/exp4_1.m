%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Time��2020/4/09
%Author: �����
%Function:�߹���ʵ��4 ȫɫ�����׺�һ�ϡ� 
%����Normalize3��һ������ exp4_rgb2hsi��exp4_rgb2hsi��ɫת������ freadenvi enviwrite��дenviͼ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%---------------------------------�ٶ�ȡ���� ǰ3����������-----------------����CSU_MS ���������J2ͼ��-----------
[image,pt,ft]=freadenvi('E:\ziliao\2_Term6_highd\Exp4����+����\����\CSU_MS');
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
J2=Normalize3(J1);%��һ�� 0��1 double

%---------------------------------��RGBת����IHS�ռ� ȫɫ�滻I ����ϳɻ��ͼ��fusion-----------------
%ת����IHS
IHS=exp4_rgb2hsi(J2(:,:,3:-1:1));  %��RGB�任��IHS�ռ䣬���ɵ�IHSͼ���У�1ͨ����ӦH��2ͨ����ӦS��3ͨ����ӦI
%��ȫɫͼ�� ���pan 0-1double����
[ori_pan,pt,ft]=freadenvi('E:\ziliao\2_Term6_highd\Exp4����+����\����\CSU_PAN');
pan=zeros(1952,1240);
pan=reshape(ori_pan,1952,1240)/max(ori_pan);
%ֱ��ͼƥ��  ʵ��δҪ����
% [counts,x]=imhist(IHS(:,:,3));%RGB ֱ��ͼƥ��
% pan=histeq(pan,counts);
%��pan����IHS��I����
IHS(:,:,3)=pan;
%��IHS�任�������ں�ͼ��
fusion=exp4_hsi2rgb(IHS);
%����matlab�Դ�rgb2hsi���������Ļ� ���������ȡ������
% fusion=Normalize3(fusion);%��һ�� 0��1 double 
%---------------------------------�����envi envi��---------------------------------------------------
figure,imshow(Normalize3(image1(:,:,3:-1:1)));
title('original')
figure,imshow(fusion);
title('IHS');
enviwrite(fusion,1952,1240,3,'E:\ziliao\2_Term6_highd\Exp4����+����\outputdata\fusion');
