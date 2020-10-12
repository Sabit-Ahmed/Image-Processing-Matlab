im=double(imread('coins.png'));

F_u_v=fft2(im);

%sz = ceil(size(F_u_v)/2);
%F_u_v = F_u_v([sz(1)+1:end, 1:sz(1)], [sz(2)+1:end, 1:sz(2)]);
F_u_v=fftshift(F_u_v);
[M,N]=size(im);

D0=30;

for i=1:M
    for j=1:N
     D(i,j)=  sqrt( (i-(M/2))^2 + (j-(N/2))^2);
    end
end

H =double(D <=D0);
g=real(ifft2((1-H).*F_u_v));
%g=fftshift(g);
subplot(2,2,1), imshow(uint8(im)), title('Original Image');
subplot(2,2,2), imshow(uint8(F_u_v)), title('DFT image');
subplot(2,2,3), imshow(H,[]), title('Ideal Highpass Filter');
subplot(2,2,4), imshow(uint8(abs(g))), title('Filtered Image');