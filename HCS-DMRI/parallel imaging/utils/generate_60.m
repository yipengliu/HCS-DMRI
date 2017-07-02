function [D1,D2,D3,D4,D5,D6,D7,D8]=generate_60(size)
%generate 8 total variation operators (sqrt(3)direction)

len=size*size;
d=sparse(len,len);
D1=speye(len);D1(1:len,len+1:2*len)=d;D1(1:len,2*len+1:3*len)=d;
D2=speye(len);D2(1:len,len+1:2*len)=d;D2(1:len,2*len+1:3*len)=d;
D3=speye(len);D3(1:len,len+1:2*len)=d;D3(1:len,2*len+1:3*len)=d;
D4=speye(len);D4(1:len,len+1:2*len)=d;D4(1:len,2*len+1:3*len)=d;
D5=speye(len);D5(1:len,len+1:2*len)=d;D5(1:len,2*len+1:3*len)=d;
D6=speye(len);D6(1:len,len+1:2*len)=d;D6(1:len,2*len+1:3*len)=d;
D7=speye(len);D7(1:len,len+1:2*len)=d;D7(1:len,2*len+1:3*len)=d;
D8=speye(len);D8(1:len,len+1:2*len)=d;D8(1:len,2*len+1:3*len)=d;

for i=1:size      %row
    for j=1:size  %column
        if i~=1&&j~=1
           D1((j-1)*size+i,len+(j-1-1)*size+i-1)=-1; %up-left-back
        end
         if i~=1&&j~=size
            D2((j-1)*size+i,len+(j-1+1)*size+i-1)=-1; %up-right-back
         end
         if i~=size&&j~=1
           D3((j-1)*size+i,len+(j-1-1)*size+i+1)=-1; %down-left-back
         end
         if i~=size&&j~=size
           D4((j-1)*size+i,len+(j-1+1)*size+i+1)=-1; %down-right-back
        end
        if i~=1&&j~=1
           D5((j-1)*size+i,2*len+(j-1-1)*size+i-1)=-1; %up-left-forward
        end
        if i~=1&&j~=size
           D6((j-1)*size+i,2*len+(j-1+1)*size+i-1)=-1; %up-right-forward
        end
        if i~=size&&j~=1
           D7((j-1)*size+i,2*len+(j-1-1)*size+i+1)=-1; %down-left-forward
        end
        if i~=size&&j~=size
           D8((j-1)*size+i,2*len+(j-1+1)*size+i+1)=-1;% down-right-forward
        end
    end
end
end