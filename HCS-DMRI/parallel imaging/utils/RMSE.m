function sol=RMSE(M,F)  %����������

M = abs(M(:));
F = abs(F(:));
[n,m]=size(F);
D=(M-F).^2;
sol=sqrt(sum(D)/(n*m));
