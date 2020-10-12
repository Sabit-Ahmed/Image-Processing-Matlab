function ideal_highpass_filter()
f=double(imread('coins.png'));
[m,n]=size(f);
F1=0;
for u=0:1:m-1
    for v=0:1:n-1
        for x=0:1:m-1
            for y=0:1:n-1
                F= f(x+1,y+1)* exp(-1i*2*pi*(u*x/m + v*y/n));
                F1=F1+F;
            end
         end
        
        im(u+1,v+1)=F1;
        F1=0;
        
    end
end
sz = ceil(size(im)/2);
F = im([sz(1)+1:end, 1:sz(1)], [sz(2)+1:end, 1:sz(2)]);
[P,Q]=size(F);
D0=30;

for i=1:P
    for j=1:Q
        D(i,j)=  sqrt( (i-(P/2))^2 + (j-(Q/2))^2);
    end
end

H = double(D <=D0);
g=real(ifft2(H.*im));

subplot(2,2,1),imshow(uint8(f));
title('original image');
subplot(2,2,2),imshow(uint8(abs(g)));
title('ILPF');
end