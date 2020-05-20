a=importdata('E:\ziliao\2_Term6_highd\Exp5数据+代码\数据\PaviaU_gt.mat');
[nL,nS,nB]=size(a);%读取矩阵a的大小
fname='PaviaU_label';
enviwrite(a,nL,nS,nB,fname);