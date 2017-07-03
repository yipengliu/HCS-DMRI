addpath(genpath('data\'));
load('DTV','DTV_rec')
load('zero_filled','recon_dft')
load('ktSS','KtSS_rec')
load('OMTV','OMTV_rec')
i=4;
zerof=recon_dft(:,:,i);
zerof=abs(zerof);
zerof=zerof./max(max(zerof));imwrite(zerof,'zerof.jpg','jpg')
dtv=DTV_rec(:,:,i);
dtv=abs(dtv);
dtv=dtv./max(max(dtv));imwrite(dtv,'dtv.jpg','jpg')
omtv=OMTV_rec(:,:,i);
omtv=abs(omtv);
omtv=omtv./max(max(omtv));imwrite(omtv,'omtv.jpg','jpg')
ktSS=KtSS_rec(:,:,i);
ktSS=abs(ktSS);
ktSS=ktSS./max(max(ktSS));imwrite(ktSS,'ktSS.jpg','jpg')

start=[90,72];
size1=95;
size2=95;

dtv1=part(dtv,start,size1,size2);imwrite(dtv1,'dtv1.jpg','jpg');
omtv1=part(omtv,start,size1,size2);imwrite(omtv1,'omtv1.jpg','jpg');
zerof1=part(zerof,start,size1,size2);imwrite(zerof1,'zerof1.jpg','jpg');
ktSS1=part(ktSS,start,size1,size2);imwrite(ktSS1,'ktSS1.jpg','jpg');





