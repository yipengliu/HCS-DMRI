function x=part(x,start,size1,size2)
%获得图片的部分，其中start表示坐标
%size1,size2分别表示宽和长尺寸

x=x(start(1):start(1)+size1-1,start(2):start(2)+size2-1);