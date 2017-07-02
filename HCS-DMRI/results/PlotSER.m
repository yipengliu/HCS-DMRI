
%% Plot Fig.8
addpath(genpath('result data\'));
addpath(genpath('original data\'));
load('BCS_192.mat')
load('BCS_256.mat')
load('DTV_192.mat')
load('DTV_256.mat')
load('ktrpca_192.mat')
 load('ktrpca_256.mat')
load('ktslr_192.mat')
load('ktslr_256.mat')
load('OMTV_192.mat')
load('OMTV_256.mat')
load perf192_40.mat;
for i=1:7
bcs15(i)=SER(BCS192_rec(:,:,:,i),image);
ktslr15(i)=SER(ktslr192_rec(:,:,:,i),image);
dtv15(i)=SER(DTV192_rec(:,:,:,i),image);
mstv15(i)=SER(OMTV192_rec(:,:,:,i),image);
ktrpca15(i)=SER(ktRPCA192_rec(:,:,:,i),image);
end


figure(7)
subplot(121)
 x=0.10:0.05:0.40;
plot(x,bcs15,'gx-');hold on;
plot(x,ktslr15,'b.-');hold on;
plot(x,dtv15,'k+-');hold on;
plot(x,ktrpca15,'mo-');hold on;
plot(x,mstv15,'r*-');hold on;
  axis([0.10 0.40 17 25]);
xlabel('Frame index');
ylabel('SER(dB)');
legend('BCS','k-t SLR','DTV','k-t RPCA','HCS-DMRI')

subplot(122)
load cine256_30.mat;
for i=1:7
bcs1(i)=SER(BCS256_rec(:,:,:,i),image);
ktslr1(i)=SER(ktslr256_rec(:,:,:,i),image);
dtv1(i)=SER(DTV256_rec(:,:,:,i),image);
mstv1(i)=SER(OMTV256_rec(:,:,:,i),image);
ktrpca1(i)=SER(ktRPCA256_rec(:,:,:,i),image);
end

x=0.10:0.05:0.40;
plot(x,bcs1,'gx-');hold on;
plot(x,ktslr1,'b.-');hold on;
plot(x,dtv1,'k+-');hold on;
plot(x,ktrpca1,'mo-');hold on;
plot(x,mstv1,'r*-');hold on;
 axis([0.10 0.40 18 34]);
xlabel('Frame index');
ylabel('SER(dB)');
legend('BCS','k-t SLR','DTV','k-t RPCA','HCS-DMRI')