
figure(1)
load h457.mat;
load h507.mat;
load h557.mat;
load h607.mat;
x=0.10:0.05:0.40;
plot(x,h457,'b--');hold on;
plot(x,h507,'bo-');hold on;
plot(x,h607,'b.-');hold on;
plot(x,h60745,'b+-');hold on;


axis([0.10 0.40 0.01 0.03]);
xlabel('Average sampling ratio');
ylabel('Average RMSE');
legend('0.45+0.05s','0.50+0.05s','0.55+0.05s','0.60+0.05s')
