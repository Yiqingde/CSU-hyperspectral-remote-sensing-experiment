%写输出结构图像，默认路径c:\名字需手动调整
function writeimg(xx,ss,pathname)
if length(ss)==2
   as(1)=ss(1);
   as(2)=ss(2);
   as(3)=1;
   ss=as;
end
for mmm=1:ss(3)
aaa=xx(:,:,mmm);
bbb=reshape(aaa',ss(1)*ss(2),1);
if mmm==1
ccc=bbb;
else
ccc=[ccc;bbb];
end
end
% enviwrite(ccc,160,160,4,'C:\xxkuaimu10_9ynew5000itneww');
% enviwrite(ccc,p(1),p(2),m(3),'C:\lamdatest\20000itr_10lamda_AA_A');
enviwrite(ccc,ss(2),ss(1),ss(3),pathname);
clear mmm aaa bbb ccc;

