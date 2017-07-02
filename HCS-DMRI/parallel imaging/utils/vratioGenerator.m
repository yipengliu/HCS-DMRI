function [reNum]=vratioGenerator(num,high,average,period)
%caculate the subsampling ratio
% varing undersampling ratio for HCS-DMRI
ratio=zeros(1,num);
reNum=zeros(3,num);

count=ceil(num/period);
ratio1=high;
ratio2=(num*average-(count+1)*high)/(num-count);

for i=1:count
    ratio(i)=ratio1;
    reNum(1,i)=period*(i-1)+1;
end
ratio(count+1)=ratio2;


k=count+1;
for i=1:count+1
    for j=1:period-1
        if(k<=num)
            ratio(k)=ratio2;
            reNum(1,k)=reNum(1,i)+j;
            reNum(2,k)=period*(i-1)+1;
            reNum(3,k)=period*i+1;
            if(period*i+1>num)
                reNum(3,k)=  reNum(2,k);

            end
            k=k+1;
        else
            break;
        end
    end
end

end