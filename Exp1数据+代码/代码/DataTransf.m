a=importdata('E:\ziliao\2_Term6_highd\Exp5����+����\����\PaviaU_gt.mat');
[nL,nS,nB]=size(a);%��ȡ����a�Ĵ�С
fname='PaviaU_label';
enviwrite(a,nL,nS,nB,fname);