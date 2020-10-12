%f=imread('cameraman.tif')
%f=imresize(f,[150 150])
f=zeros(200,200);
f(44:130,83:110)=1;
fd=double(f)
[m,n]=size(f)
F1=0
for u=0:1:m-1
    for v=0:1:n-1
        for x=0:1:m-1
            for y=0:1:n-1
                F= fd(x+1,y+1)* exp(-1i*2*pi*(u*x/m + v*y/n));
                F1=F1+F;
            end
         end
        
        im(u+1,v+1)=F1;
        F1=0;
        
    end
end
subplot(1,3,3),imshow(uint8(im))
title('FT image')
F=fftshift(im)
[P,Q]=size(F)
D0=input('Enter D0:') 
n=input('Enter n:')
for u=0:P-1
   for v=0:Q-1
        
        D(u+1,v+1)=(((u-(P/2)).^2)+((v-(Q/2)).^2)).^0.5;
        H(u+1,v+1)=1/(1+(D(u+1,v+1)/D0).^2*n);
   end
end

%figure(),imshow(H)
result=F.*H
r=ifft2(result);
subplot(1,3,2),imshow(abs(r));
title('using filter')

subplot(1,3,1),imshow(f)
title('original image')


%a=[1,2,3;4,5,6]
%[Max,Min]=minmax(a)