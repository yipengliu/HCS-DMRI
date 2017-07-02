
load 6.mat
load 7.mat;
load 8.mat;
load 9.mat;
x=0.10:0.05:0.40;

plot(x,t6,'b--');hold on;
plot(x,t7,'b+-');hold on;
plot(x,t8,'bo-');hold on;
plot(x,t9,'b.-');hold on;

axis([0.10 0.40 0.01 0.03]);
xlabel('Average sampling ratio');
ylabel('Average RMSE');
legend('T=6','T=7','T=8','T=9')