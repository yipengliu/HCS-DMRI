load t6.mat;
load t8.mat;
load ('OMTV_256.mat')
t7=mean(OMTV256_rmse)
x=0.10:0.05:0.40;
% h60(1)=0.0247;
% t6=t6+0.0001;
% plot(x,t6,'k--');hold on;
% plot(x,t6,'k.-');hold on;
% plot(x,t7,'ko-');hold on;
% plot(x,t8,'k+-');hold on;
% 
% axis([0.10 0.40 0.003 0.0015]);
% xlabel('Average sampling ratio');
% ylabel('Average RMSE');
load 75.mat
load 74.mat
h745=t7;

plot(x,h74,'k.-');hold on;
plot(x,h745,'k+-');hold on;
plot(x,c75,'ko-');hold on;

axis([0.10 0.40 0.003 0.015]);
xlabel('Average sampling ratio');
ylabel('Average RMSE');
legend('45%','50%','55%')
