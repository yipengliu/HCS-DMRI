function output = FIRLS_omtv_para(input,varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% used OMTV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 C=input.C;
ratio=input.ratio;
n1=input.n1; 
n2=input.n2; 
N=n1*n2;
A=input.A; 
b=input.b;
flag=input.flag;
At = input.At;
Atb = At*b;
r1=input.r1;
r2=input.r2;
y=Atb;


if (isfield(input,'r'))
	r=input.r;
else
    r=zeros(n1*n2,1);	
end

alpha1 =input.lambda1;
alpha2 = input.lambda2;

if isnumeric(A)
    AtA=At*A;
else
    AtA=A_operator(@(x) At*reshape(A*x,[n1,n2,C]), @(x) At*(A*x));
end

refL1=input.refL1;
refL2=input.refL2; 

w=1/sqrt(2);
if flag==0
    Bweight1=0;
    Bweight2=0;
    Bweight3=0;

    Fweight1=0;
    Fweight2=0;
    Fweight3=0;
elseif flag==1
    Bweight1=1/sqrt(refL1.^2);
    Bweight2=1/sqrt(1+refL1.^2);
    Bweight3=1/sqrt(2+refL1.^2);

    Fweight1=0;
    Fweight2=0;
    Fweight3=0;
else
    Bweight1=1/sqrt(refL1.^2);
    Bweight2=1/sqrt(1+refL1.^2);
    Bweight3=1/sqrt(2+refL1.^2);

    Fweight1=1/sqrt(refL2.^2);
    Fweight2=1/sqrt(1+refL2.^2);
    Fweight3=1/sqrt(2+refL2.^2);
end
%% 2OMTV weighted

w=1/sqrt(2);
Q1=input.Q1;    
Q1{1}=Q1{1};Q1{2}=Q1{2};Q1{3}=Q1{3};Q1{4}=Q1{4}; %Vertical angle   
Q1{5}=w*Q1{5};Q1{6}=w*Q1{6};Q1{7}=w*Q1{7};Q1{8}=w*Q1{8}; %Diagonal angle

%% 3OMTV weighted
%Vertical angle
Q2{1}=input.Q2{1};
Q2{2}=input.Q2{2};
Q2{3}=input.Q2{3};
Q2{4}=input.Q2{4};
Q2{5}=Bweight1.*input.Q2{5};
Q2{6}=Fweight1.*input.Q2{6};

%sqrt(2) angle
for i=7:10
    Q2{i}=input.Q2{i};
end
for i=11:14
    Q2{i}=Bweight2.*input.Q2{i};
end
for i=15:18
    Q2{i}=Fweight2.*input.Q2{i};
end

%sqrt(3) angle
for i=19:22
    Q2{i}=Bweight3.*input.Q2{i};
end
for i=23:26
    Q2{i}=Fweight3.*input.Q2{i};
end


In = speye(N);
f0 = input.f;

for itr = 1:input.no    % total iter counter       
    
     D1=weight(y,Q1);% update weighter for residual
     D2=weight([y+r;r1;r2],Q2); %updata weighter for image
     
    P=ratio*In;
    tp1=[(1:N)' (1:N)' D1];
    tp2=[(1:N)' (1:N)' D2];
    dd1=spconvert(tp1);
    dd2=spconvert(tp2);
      
      
    
    ad1=Q1{1}'*dd1*Q1{1}+Q1{2}'*dd1*Q1{2}+Q1{3}'*dd1*Q1{3}+Q1{4}'*dd1*Q1{4}+Q1{5}'*dd1*Q1{5}+Q1{6}'*dd1*Q1{6}+Q1{7}'*dd1*Q1{7}+Q1{8}'*dd1*Q1{8};
    ad2=Q2{1}'*dd2*Q2{1}+Q2{2}'*dd2*Q2{2}+Q2{3}'*dd2*Q2{3}+Q2{4}'*dd2*Q2{4}+...
            +Q2{5}'*dd2*Q2{5}+Q2{6}'*dd2*Q2{6}+Q2{7}'*dd2*Q2{7}+Q2{8}'*dd2*Q2{8}+...
            +Q2{9}'*dd2*Q2{9}+Q2{10}'*dd2*Q2{10}+Q2{11}'*dd2*Q2{11}+Q2{12}'*dd2*Q2{12}+...
            +Q2{13}'*dd2*Q2{13}+Q2{14}'*dd2*Q2{14}+Q2{15}'*dd2*Q2{15}+Q2{16}'*dd2*Q2{16}+...
            +Q2{17}'*dd2*Q2{17}+Q2{18}'*dd2*Q2{18}+Q2{19}'*dd2*Q2{19}+Q2{20}'*dd2*Q2{20}+...
            +Q2{21}'*dd2*Q2{21}+Q2{22}'*dd2*Q2{22}+Q2{23}'*dd2*Q2{23}+Q2{24}'*dd2*Q2{24}+...
            +Q2{25}'*dd2*Q2{25}+Q2{26}'*dd2*Q2{26};
    
    
	temp1=ad2(1:N,1:N);
	temp2=ad2(N+1:2*N,1:N);
	temp3=ad2(2*N+1:3*N,1:N);
	
	
    tp =  alpha1*ad1+alpha2*temp1;
    P= P+ tp; %preconditioner
    S = A_operator(@(x) AtA*x + tp*x, @(x) AtA*x + tp*x); %system matrix
    
    
    %construct LU decompostion
    d = diag(P);
    d1 = diag(P,1);
    d2 = diag(P,n1);
    d = diag(d);
    d1 = diag(d1,1);
    d2 = diag(d2,n1);
    U2 = d +d1 +d2;
    d1t = diag(P,-1);
    d2t = diag(P,-n1);
    ratios = 1./(diag(d));
    d1t = ratios(1:N-1).*d1t;
    d2t = ratios(1:N-n1).*d2t;
    L2 = In+diag(d1t,-1)+diag(d2t,-n1);
    
    invp = @(x) FFP(L2,U2,x);
    invP =  A_operator(@(x) invp(x), @(x) invp(x));
    
    Atb=Atb-alpha2*(temp1*r+temp2'*r1+temp3'*r2);
	
    [y,k1,res,err] =  PCG_operator(S,Atb,invP,input.cgiter,y,1e-15,1,f0(:),itr);

end

output.y=y;
end

function D=weight(x,Q)%Updata W
   D=0;
   for i=1:length(Q)
      D=D+(abs(Q{i}*x)+eps).^(2);
   end

      D =D.^(-0.5);
      
end

