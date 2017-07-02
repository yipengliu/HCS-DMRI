function [mask,r]=maskGenerator(size,ratio,flag)

%产生一定采样比的射线采样模板

num=floor(ratio*size);
OMEGA=fftshift(MRImask(size,num)); 
[mask] = RandMask_InverseTransfer(OMEGA,size,size);
k = length(find(mask~=0));
r=k/(size*size);

i=1;
while(abs(r-ratio)>0.0001&&i<50)
      num=num-floor((r-ratio)*size);
      OMEGA=fftshift(MRImask(size,num)); 
      [mask] = RandMask_InverseTransfer(OMEGA,size,size);
      k = length(find(mask~=0));
      r=k/(size*size);
      i=i+1;
end

if(flag==1)
     num=num+1;
     OMEGA=fftshift(MRImask(size,num)); 
      [mask] = RandMask_InverseTransfer(OMEGA,size,size);
      k = length(find(mask~=0));
      r=k/(size*size);
end
r=k/(size*size);
end
