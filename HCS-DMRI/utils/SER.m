function R=SER(f1,f2) %求信噪比
% 计算 signal to error
%  -10log10((rec-original).^2/(original).^2);
%
f1=abs(f1);
f2=abs(f2);
R=(-10)*log10((norm(f1-f2,2).^2)/(norm(f2,2).^2));
