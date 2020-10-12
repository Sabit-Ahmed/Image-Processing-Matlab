image = imread('peppers.png');
figure
subplot(1,2,1);
imshow(image);
title('Original Image');
subplot(1,2,2);
grayScaleImage = rgb_to_grey_2(image);
imshow(grayScaleImage);
title('Grayscale Image');