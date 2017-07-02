function [rmse,im_rec,time]=TestHMRIparal(refNum,im_Full,Q1,Q2,mask,a,b,b1)
fprintf(1,'---------------多结构的TV计算中------------\n');

[m,n,seqlen] = size(im_Full);
N = [m,n];
[m1,n1,C] = size(b1);
input.C=C;


input.lambda1 = a; % regularization parameter
input.lambda2 = b;
input.n1 =N(1);
input.n2 = N(2);
input.no=13; % 13 number of iterations for outer loop, may need to change for different datasets
input.cgiter=25;% 25 number of iterations for inner PCG loop, may need to change for different datasets
input.Q1=Q1;
input.Q2=Q2;

imrec=zeros(m,n,seqlen);
rmse = zeros(seqlen,1);
ser = zeros(seqlen,1);


time=0;

for num=1:seqlen
   
    seq=refNum(1,num);%%current reconstruction frame
    rf1=refNum(2,num);%%backward reference frame munber
    rf2=refNum(3,num);%%forward reference frame munber
    
    fprintf('--reconstructing %d-th frame\n',seq); 
    FT= p2DFT(mask(:,:,num), N, b1, 1, 2); 
    k= length(find(mask(:,:,num)~=0));
    input.ratio=k/(m*n);

	x0 = im_Full(:,:,seq);
    y2{seq}=FT*x0;
    AA =  A_operator(@(x) reshape(FT*x,[m*n*C,1]), @(x) reshape(FT'*x,[m*n,1]));
	input.A = AA;
    input.At = AA';
    
    if rf1==0
        ref = zeros(m,n,1);
    elseif rf1==rf2
        ref=im_rec(:,:,rf2);
    else 
        ref=(abs(rf2-seq)/(abs(rf1-seq)+abs(rf2-seq)))*im_rec(:,:,rf1)+...
            (abs(rf1-seq)/(abs(rf1-seq)+abs(rf2-seq)))*im_rec(:,:,rf2);%undersapling fourior operator
    end
    tic;
    if rf1==0 %% without reference frame 
        input.flag=0;
        input.r1=zeros(N(1)*N(2),1);
        input.refL1=0;
        input.r2=zeros(N(1)*N(2),1);
        input.refL2=0;
         
        input.f = im_Full(:,:,seq);
        input.b = y2{seq};% underSampled k-tdata
        out = FIRLS_omtv_para(input);

        xout= out.y;
    elseif rf1==rf2  %with one reference frame when reconstructed frames loacated in final poeriod
        input.flag=1;
        
        input.r1=im_rec(:,:,rf1);
        input.r1=input.r1(:);
        input.refL1=abs(seq-rf1);
        
        input.r2=zeros(N(1)*N(2),1);
        input.refL2=0;
        
        input.r = ref(:);
        input.f = im_Full(:,:,seq);
        input.b = y2{seq}-FT*ref;
        
        out = FIRLS_omtv_para(input);
        
       xout= out.y+ref(:);
    else 
        input.flag=2;
        input.r1=im_rec(:,:,rf1);
        input.r1=input.r1(:);
        input.refL1=abs(seq-rf1);
        
        input.r2=im_rec(:,:,rf2);
        input.r2=input.r2(:);
        input.refL2=abs(seq-rf2);
        
        input.r = ref(:);
        input.f = im_Full(:,:,seq)-ref;
        input.b = y2{seq}-FT*ref;  
        out = FIRLS_omtv_para(input);
          xout= out.y+ref(:);
    end
      toc;
    time=toc;

    im_rec(:,:,seq)=reshape(xout,[m,n]);
    rmse(seq) = RMSE(im_rec(:,:,seq),im_Full(:,:,seq));
    ser(seq) = SER(im_rec(:,:,seq),im_Full(:,:,seq));
end
end
    
