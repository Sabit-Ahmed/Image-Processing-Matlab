clear all;
Img = imread('peppers.png');
Img1 = rgb2gray(Img);
f = mod(Img,128);
mask = Img>127;
[r,c]=size(Img);
for i = 1: r
   for j = 1: c
      if mask(i,j) == 1
        f(i,j) = f(i,j) + 128;
      end
   end
end
subplot(1,3,1), imshow(Img);
subplot(1,3,2), imshow(f);
subplot(1,3,3), imshow(Img1);
