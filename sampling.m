Img = imread('peppers.png');
Img1 = rgb2gray(Img);
factor=8;
x_downsampled=[ ];
[r,c]=size(Img1);
for i = 1: factor: length(Img1)
   for j = i+1: factor
      x_downsampled=0;
   end
   x_downsampled=Img1(i);
end
figure
subplot(1,2,1);
imshow(Img1);
title('Original Image');
subplot(1,2,2);
imshow(x_downsampled);
title('Sampled Image');