function DFT()
f=zeros(200,200);
f(50:130,90:110)=1;
Q=0;

[M,N]=size(f);
for k=0:1:M-1
    for l=0:1:N-1
        for x=0:1:M-1
            for y=0:1:N-1
                F= f(x+1,y+1)* exp(-1i*2*pi*(k*x/M + l*y/N));
                Q=Q+F;
            end
            
        end
        im(k+1,l+1)=Q;
        Q=0;
        
    end
end

subplot(2,2,1),imshow(f);
title('original image');

subplot(2,2,2),imshow(uint8(im));
title('after DFT');

F=fftshift(im);
subplot(2,2,3),imshow(abs(F));
title('after shifting DFT');

subplot(2,2,4),imshow(uint8(log(1+abs(F))),[]);
title('enhanced shifted DFT(log transformation)');

end