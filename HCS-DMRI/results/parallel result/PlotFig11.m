addpath(genpath('data\'));
load('DTV','DTV_rec')
load('zero_filled','recon_dft')
load('ktSS','KtSS_rec')
load('OMTV','OMTV_rec')


j=145;
zerof=recon_dft(j,:,:);
zerof=abs(zerof);
zerof=zerof./max(max(zerof));zerof=reshape(zerof,[256,24]);imshow(zerof);imwrite(zerof,'zerof.jpg','jpg')
dtv=DTV_rec(j,:,:);
dtv=abs(dtv);
dtv=dtv./max(max(dtv));dtv=reshape(dtv,[256,24]);imwrite(dtv,'dtv.jpg','jpg')
omtv=OMTV_rec(j,:,:);
omtv=abs(omtv);
omtv=omtv./max(max(omtv));omtv=reshape(omtv,[256,24]);imwrite(omtv,'omtv.jpg','jpg')
ktSS=KtSS_rec(j,:,:);
ktSS=abs(ktSS);
ktSS=ktSS./max(max(ktSS));ktSS=reshape(ktSS,[256,24]);imwrite(ktSS,'ktSS.jpg','jpg')
