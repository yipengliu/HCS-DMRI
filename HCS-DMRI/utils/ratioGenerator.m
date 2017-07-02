function ratio=ratioGenerator(num,firstRatio,secondRatio,lastRatio)
    ratio=zeros(1,num);
    ratio(1)=firstRatio;
    for i=2:num
        ratio(i)=((lastRatio-secondRatio)*(i-2)+(num-2)*secondRatio)/(num-2);
    end
end