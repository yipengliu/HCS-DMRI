function At = transpose(A)
m=At.func;
At.func = A.transpose;
At.transpose = m;
At = class(At,'A_operator');