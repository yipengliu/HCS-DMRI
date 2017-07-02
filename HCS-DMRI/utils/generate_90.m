function [D1,D2,D3,D4,D5,D6]=generate_90(size)
%generate 6 total variation operators£» vertical direction

len=size*size;
d=sparse(len,len);
D1=speye(len);D1(1:len,len+1:2*len)=d;D1(1:len,2*len+1:3*len)=d;
D2=speye(len);D2(1:len,len+1:2*len)=d;D2(1:len,2*len+1:3*len)=d;
D3=speye(len);D3(1:len,len+1:2*len)=d;D3(1:len,2*len+1:3*len)=d;
D4=speye(len);D4(1:len,len+1:2*len)=d;D4(1:len,2*len+1:3*len)=d;
D5=speye(len);D5(1:len,len+1:2*len)=d;D5(1:len,2*len+1:3*len)=d;
D6=speye(len);D6(1:len,len+1:2*len)=d;D6(1:len,2*len+1:3*len)=d;

for i=1:size      %row
    for j=1:size  %column
        if i~=1
           D1((j-1)*size+i,(j-1)*size+i-1)=-1; %up
        end
        if i~=size
            D2((j-1)*size+i,(j-1)*size+i+1)=-1; %down
        end
        if j~=1
            D3((j-1)*size+i,(j-1-1)*size+i)=-1; %left
        end
        if j~=size
           D4((j-1)*size+i,(j-1+1)*size+i)=-1; %right
        end
        D5((j-1)*size+i,(j-1)*size+i+len)=-1; %back
        D6((j-1)*size+i,(j-1)*size+i+2*len)=-1; %forward
    end
end