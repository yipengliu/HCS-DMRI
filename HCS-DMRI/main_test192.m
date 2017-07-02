addpath(genpath('Data\'));
addpath(genpath('IRLS-PCG\'));
addpath(genpath('Functions\'));
addpath(genpath('utils\')); 
load perf192_40.mat;
load MSQ192.mat;
load mask0.15.mat;  %average sampling ratio is 0.15here, average sampling ratio is 0.25 when used mask0.25
I=image;
[m,n,q]=size(I);
OMTV192_rmse=zeros(q,7);%RMSE of the reconstruction
OMTV192_rec=zeros(m,n,q,7);%reconstruction images
OMTV192_time=zeros(7,1);%CPU time
OMTV192_ratio=zeros(q+1,7);%subsampling ratio of each frame,and the average sampling ratio of the whole sequence in the final
T=7;% sampling period
fprintf('------------------------OMTV based 192*192*40 reconstruction---------------------------\n');
alpha1=1e-3; 
alpha2=5e-7;

for i=2:2  %i varies from 1 to 7 when average sampling ratio varies from 0.1 to 0.4
fprintf('   -----------------average sampling ratio %f ----------------------------\n',0.05+0.05*i);
  [refNum]=vratioGenerator(q,0.60+0.05*i,0.05+0.05*i,T); %average sampling  ratio is 0.05+0.05*i for different i
  for j=1:q
  k = length(find(mask(:,:,j)~=0));
    OMTV192_ratio(j,i)=k/(m*n);
  end
 OMTV192_ratio(q+1,i)=sum(OMTV192_ratio(:,i))/q;
[OMTV192_rmse(:,i),OMTV192_rec(:,:,:,i),OMTV192_time(i)]=TestHMRI(refNum,I,Q1,Q2,mask,alpha1,alpha2);
end

 