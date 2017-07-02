%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is an example for dynamic MRI plus 多结构(multi-structure )total variation的动态优化模型
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [rmse,im_rec,time]=TestHMRI(refNum,im_Full,Q1,Q2,mask,a,b)
fprintf(1,'---------------HCS-DMRI caculating------------\n');

[m,n,seqlen] = size(im_Full);
N = [m,n];

input.lambda1 = a; % regularization parameter
input.lambda2 = b;  % regularization parameter
input.n1 =N(1);
input.n2 = N(2);
input.no=13;  % 13 number of iterations for outer loop, may need to change for different datasets
input.cgiter=25; % 25 number of iterations for inner PCG loop, may need to change for different datasets
input.Q1=Q1;
input.Q2=Q2;

im_rec=zeros(m,n,seqlen);
rmse = zeros(seqlen,1);
ser = zeros(seqlen,1);

time=0;


for num=1:seqlen
   
    seq=refNum(1,num);%current reconstruction frame
    rf1=refNum(2,num);%backward reference frame munber
    rf2=refNum(3,num);%forward reference frame munber 
    
    fprintf('--reconstructing %d-th frame\n',seq); 
    FT= p2DFT(mask(:,:,num), N, 1, 2); 
    k= length(find(mask(:,:,num)~=0));
    input.ratio=k/(m*n);
    
	x0 = im_Full(:,:,seq);
    y2{seq}=FT*x0;
    AA =  A_operator(@(x) reshape(FT*x,[m*n,1]), @(x) reshape(FT'*x,[m*n,1])); %undersapling fourior operator
	input.A = AA;
    input.At = AA';
    
    if rf1==0
        ref = zeros(m,n,1);
    elseif rf1==rf2
        ref=im_rec(:,:,rf1);

    else 
        ref=(abs(rf2-seq)/(abs(rf1-seq)+abs(rf2-seq)))*im_rec(:,:,rf1)+...
             (abs(rf1-seq)/(abs(rf1-seq)+abs(rf2-seq)))*im_rec(:,:,rf2);   %%prediction frame
    end
    tic;
    if rf1==0 %% without reference frame 
        input.flag=0;
        input.r1=zeros(N(1)*N(2),1);
        input.refL1=0;
        input.r2=zeros(N(1)*N(2),1);
        input.refL2=0;
         
        input.f = im_Full(:,:,seq);
        input.b = y2{seq};    % underSampled k-tdata
        out = FIRLS_omtv(input);
        xout= out.y;
    elseif rf1==rf2   %with one reference frame when reconstructed frames loacated in final poeriod
        input.flag=1;
        
        input.r1=im_rec(:,:,rf1);
        input.r1=input.r1(:);
        input.refL1=abs(seq-rf1);   
        
        input.r2=zeros(N(1)*N(2),1);
        input.refL2=0;
        
        input.r = ref(:);
        input.f = im_Full(:,:,seq);
        input.b = y2{seq}-FT*ref;% underSampled k-t data
        
        out = FIRLS_omtv(input);
        xout = out.y+ref(:);
    else 
        input.flag=2;%with forward and backward reference frames
        input.r1=im_rec(:,:,rf1);
        input.r1=input.r1(:);
        input.refL1=abs(seq-rf1);  %%temporal distance between rf1 and current frame,
        
        input.r2=im_rec(:,:,rf2);
        input.r2=input.r2(:);
        input.refL2=abs(seq-rf2);  %%temporal distance between rf2 and current frame,
        
        input.r = ref(:); 
        input.f = im_Full(:,:,seq)-ref;
        input.b = y2{seq}-FT*ref;
       
        
        out = FIRLS_omtv(input);
        xout = out.y+ref(:);
    end
      toc;
    time=time+toc;
    im_rec(:,:,seq)=reshape(xout,[m,n]);
    rmse(seq) = RMSE(im_rec(:,:,seq),im_Full(:,:,seq));
    ser(seq) = SER(im_rec(:,:,seq),im_Full(:,:,seq));
    
end
    
end