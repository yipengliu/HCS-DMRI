addpath(genpath('result data\'));
addpath(genpath('original data\'));

load('BCS_192.mat')
load('DTV_192.mat')
load('ktrpca_192.mat')
load('ktslr_192.mat')
load('OMTV_192.mat')
load perf192_40.mat;
i=16;
I=image(:,:,i);
I=abs(I);
I=I/max(max(I));
imwrite(I,'full.jpg','jpg')
% 
bcs=BCS192_rec(:,:,i,2);
bcs=abs(bcs);
bcs=bcs./max(max(bcs));
imwrite(bcs,'bcs.jpg','jpg')
% 
ktslr=ktslr192_rec(:,:,i,2);
ktslr=abs(ktslr);
ktslr=ktslr./max(max(ktslr));
imwrite(ktslr,'ktslr.jpg','jpg')

ktrpca=ktRPCA192_rec(:,:,i,2);
ktrpca=abs(ktrpca);
ktrpca=ktrpca./max(max(ktrpca));
imwrite(ktrpca,'ktrpca.jpg','jpg')

dtv=DTV192_rec(:,:,i,2);
dtv=abs(dtv);
dtv=dtv./max(max(dtv));
imwrite(dtv,'dtv.jpg','jpg')

omtv=OMTV192_rec(:,:,i,2);
omtv=abs(omtv);
omtv=omtv./max(max(omtv));
imwrite(omtv,'omtv.jpg','jpg')
size1=90;
size2=90;
start=[20,20];


I1=part(I,start,size1,size2);imwrite(I1,'full11.jpg','jpg'); 
bcs1=part(bcs,start,size1,size2);imwrite(bcs1,'bcs11.jpg','jpg');
omtv1=part(omtv,start,size1,size2);imwrite(omtv1,'omtv11.jpg','jpg');
ktslr1=part(ktslr,start,size1,size2);imwrite(ktslr1,'ktslr11.jpg','jpg');
dtv1=part(dtv,start,size1,size2);imwrite(dtv1,'dtv11.jpg','jpg');
ktrpca1=part(ktrpca,start,size1,size2);imwrite(ktrpca1,'ktrpca11.jpg','jpg');
