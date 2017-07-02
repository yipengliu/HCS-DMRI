
addpath(genpath('data\'));
addpath(genpath('Function2new\'));
addpath(genpath('utils\')); 


load cine256_24;
load MSQ256;
load('data_2d_cardiac_cine.mat')
I=image;
[m,n,q]=size(I);
T=7;%samping ratio
fprintf('------------------------OMTV based parallel 256*256*24 reconstruction---------------------------\n');
lambda1=0.0001; %0.0001
lambda2=0.000001;  %0.000005
for i=4:4
fprintf('   -----------------average sampling ratio %f ----------------------------\n',0.05+0.05*i);
  [refNum]=vratioGenerator(q,0.35+0.05*i,0.05+0.05*i,T);
 OMTV_mask=mask;
[OMTV_rmse(:,i),OMTV_rec(:,:,:,i),OMTV192_time(i)]=TestHMRIparal(refNum,I,Q1,Q2,OMTV_mask,lambda1,lambda2,b1);
  

end
