Img = imread('peppers.png');
 
Img1 = rgb2gray(Img);
M=8;
downimgcolor=downsample (Img1',M)
downimg=downsample (downimgcolor',M)
  
subplot(1,2,1), imshow(Img1);
title('Original image');
subplot(1,2,2), imshow(downimg);
title('down sample');
 
