function [D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12]=generate_45(size)
%generate 12 total variation operatos£» sqrt(2) direction

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
D9=speye(len);D9(1:len,len+1:2*len)=d;D9(1:len,2*len+1:3*len)=d;
D10=speye(len);D10(1:len,len+1:2*len)=d;D10(1:len,2*len+1:3*len)=d;
D11=speye(len);D11(1:len,len+1:2*len)=d;D11(1:len,2*len+1:3*len)=d;
D12=speye(len);D12(1:len,len+1:2*len)=d;D12(1:len,2*len+1:3*len)=d;

for i=1:size      %row
    for j=1:size  %column
        if i~=1&&j~=1
            D1((j-1)*size+i,(j-1-1)*size+i-1)=-1; %up-left
        end
        if i~=1&&j~=size
            D2((j-1)*size+i,(j-1+1)*size+i-1)=-1; %up-right
        end
        if i~=size&&j~=1
            D3((j-1)*size+i,(j-1-1)*size+i+1)=-1; %down-left
        end
        if i~=size&&j~=size
            D4((j-1)*size+i,(j-1+1)*size+i+1)=-1; %down-right
        end
        
        if i~=1
            D5((j-1)*size+i,len+(j-1)*size+i-1)=-1; %back-up
        end
        if j~=1
           D6((j-1)*size+i,len+(j-1-1)*size+i)=-1; %back-left
        end
        if  i~=size
           D7((j-1)*size+i,len+(j-1)*size+i+1)=-1; %back-down
        end
        if j~=size
           D8((j-1)*size+i,len+(j-1+1)*size+i)=-1; %back-right
        end
        
        if i~=1
           D9((j-1)*size+i,2*len+(j-1)*size+i-1)=-1; %forward-up
        end
        if j~=1
           D10((j-1)*size+i,2*len+(j-1-1)*size+i)=-1;%forward-left
        end
        if i~=size
           D11((j-1)*size+i,2*len+(j-1)*size+i+1)=-1;%forward-down
        end
        if j~=size
           D12((j-1)*size+i,2*len+(j-1+1)*size+i)=-1;%forward-right
        end
    end
end

end