%% Plot Fig.6
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


bcs15=BCS192_rmse(:,5);
ktslr15=ktslr192_rmse(:,5);
dtv15=DTV192_rmse(:,5);
mstv15=OMTV192_rmse(:,5);
ktrpca15=ktRPCA192_rmse(1:40,5);
figure(2)
subplot(121)
k=1:40;

plot(k,bcs15,'gx-');hold on;
plot(k,ktslr15,'b.-');hold on;
plot(k,dtv15,'k+-');hold on;
plot(k,ktrpca15,'mo-');hold on;
plot(k,mstv15,'r*-');hold on;
xlabel('Frame index');
ylabel('RMSE');
legend('BCS','k-t SLR','DTV','k-t RPCA','HCS-DMRI')


subplot(122)

bcs1=BCS256_rmse(:,5);
ktslr1=ktslr256_rmse(:,5);
dtv1=DTV256_rmse(:,5);
mstv1=OMTV256_rmse(:,5);
ktrpca1=ktRPCA256_rmse(1:30,5);


 x=1:30;

plot(x,bcs1,'gx-');hold on;
plot(x,ktslr1,'b.-');hold on;
plot(x,dtv1,'k+-');hold on;
plot(x,ktrpca1,'mo-');hold on;
plot(x,mstv1,'r*-');hold on;
xlabel('Frame index');
ylabel('RMSE');
legend('BCS','k-t SLR','DTV','k-t RPCA','HCS-DMRI')
