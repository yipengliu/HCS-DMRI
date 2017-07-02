function res = mtimes(a,b)
% res = mtimes(FT, x)

%
if a.adjoint
    % x=H'*y (x=res,b=y), x: object, y: multi-coil k-space data
    % multi-coil data in image domain 
    for ch=1:size(b,3),
       b(:,:,ch) = reshape(b(:,:,ch),a.dataSize(1),a.dataSize(2));
        b(:,:,ch)=b(:,:,ch).*a.mask;
        res(:,:,ch)=zpad(b(:,:,ch),a.imSize(1),a.imSize(2));
        res(:,:,ch)=ifft2c(res(:,:,ch));
    end
        res = sum(squeeze(res(:,:,:)).*conj(a.b1),3)./sum(abs((a.b1)).^2,3); %#ok<AGROW>
        %res(:,:,tt)=sum(squeeze(x_array(:,:,tt,:)).*conj(a.b1),3); %#ok<AGROW>
    
    res = res.*conj(a.ph);
    switch a.mode
    	case 0
		res = real(res);
   	case 1
		res = real(res);
    end



else
    bb = reshape(b,a.imSize(1),a.imSize(2));
    
    switch a.mode
    	case 0
		bb = real(bb);
   	case 1
		bb = real(bb);
    end
    
    bb = bb.*a.ph; % phase correct
    %先乘b1再傅里叶变化再乘mask；这里bb = bb.*a.ph;不确定干嘛，也可能放在乘b1之后
    for ch=1:size(a.b1,3)
       res(:,:,ch)=bb.*a.b1(:,:,ch);
    res(:,:,ch) = fft2c(res(:,:,ch));
    res(:,:,ch) = crop(res(:,:,ch),a.dataSize(1),a.dataSize(2));
    res(:,:,ch) = res(:,:,ch).*a.mask;
    end
end

if size(b,2) == 1
    res = res(:);
end
 



    
