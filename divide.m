I = imread('peppers.png');
background = imopen(I, strel('disk',15));
Ip = imdivide(I,background);

subplot(1,2,1), imshow(I);
title('Original image');
subplot(1,2,2), imshow(Ip);
title('Divided image');
