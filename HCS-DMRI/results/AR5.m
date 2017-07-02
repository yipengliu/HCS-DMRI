%% plot FIG.7
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

figure(2)
dtv=mean(DTV192_rmse);
mstv=mean(OMTV192_rmse);
ktslr=mean(ktslr192_rmse);
bcs=mean(BCS192_rmse);
ktrpca=ktRPCA192_rmse(41,:);


subplot(121)
x=0.10:0.05:0.40;

plot(x,bcs,'gx-');hold on;
plot(x,ktslr,'b.-');hold on;
plot(x,dtv,'k+-');hold on;
plot(x,ktrpca,'mo-');hold on;
plot(x,mstv,'r*-');hold on;

axis([0.10 0.40 0.01 0.035]);
xlabel('Average sampling ratio');
ylabel('Average RMSE');
legend('BCS','k-t SLR','DTV','k-t RPCA','HCS-DMRI')




dtv1=mean(DTV256_rmse);
mstv1=mean(OMTV256_rmse);
ktslr1=mean(ktslr256_rmse);
bcs1=mean(BCS256_rmse);
ktrpca1=ktRPCA256_rmse(31,:);
subplot(122)

x=0.1:0.05:0.40;


plot(x,bcs1,'gx-');hold on;
plot(x,ktslr1,'b.-');hold on;
plot(x,dtv1,'k+-');hold on;
plot(x,ktrpca1,'mo-');hold on;
plot(x,mstv1,'r*-');hold on;
axis([0.1 0.40 0 0.035]);
xlabel('Average sampling ratio');
ylabel('Average RMSE');
legend('BCS','k-t SLR','DTV','k-t RPCA','HCS-DMRI')