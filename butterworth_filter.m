function butterworth_filter()
%f=imread('cameraman.tif')
%f=imresize(f,[150 150])
f=zeros(200,200);
f(90:130,90:110)=1;
fd=double(f);
[m,n]=size(f);
F1=0;
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
F=fftshift(im);
[P,Q]=size(F);
D0=20;
n1=1;
n2=10;
n3=30;
for u=0:P-1
   for v=0:Q-1
        
        D(u+1,v+1)=(((u-(P/2)).^2)+((v-(Q/2)).^2)).^0.5;
        H1(u+1,v+1)=1/(1+(D(u+1,v+1)/D0).^2*n1);
        H2(u+1,v+1)=1/(1+(D(u+1,v+1)/D0).^2*n2);
        H3(u+1,v+1)=1/(1+(D(u+1,v+1)/D0).^2*n3);
   end
end

result1=F.*H1;
r1=ifft2(result1);

result2=F.*H2;
r2=ifft2(result2);

result3=F.*H3;
r3=ifft2(result3);

subplot(2,2,2),imshow(abs(r1));
title('BLPF WITH N=1');

subplot(2,2,3),imshow(abs(r2));
title('BLPF WITH N=10');

subplot(2,2,4),imshow(abs(r3));
title('BLPF WITH N=30');

subplot(2,2,1),imshow(f);
title('original image');
end