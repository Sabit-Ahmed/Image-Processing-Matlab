function notch_filter()
f=imread('moire.jpg');
fd=double(f);
im = fft2(fd);
F=fftshift(im);
[P,Q]=size(F);
D0=3;
n1=4;
for u=0:P-1
   for v=0:Q-1   
        Dpk(u+1,v+1)=(((u-(P/2)-(u+1)).^2)+((v-(Q/2)-(v+1)).^2)).^0.5;
        Dnk(u+1,v+1)=(((u-(P/2)+(u+1)).^2)+((v-(Q/2)+(v+1)).^2)).^0.5;
        H1(u+1,v+1)=(1/(1+(D0/Dpk(u+1,v+1)).^2*n1)).*(1/(1+(D0/Dnk(u+1,v+1)).^2*n1));
   end
end
[rf cf]=size(F)
[rh ch]=size(H1)
result1=F.*H1;
r1=ifft2(result1);

subplot(2,2,2),imshow(abs(r1));
title('NOTCH FILTER');

subplot(2,2,1),imshow(f);
title('original image');
end