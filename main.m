A = imread('conv.png');
A = rgb2gray(A);
mask = [3,10,3;0,0,0;-3,-10,-3];
mask_flip = mask(end:-1:1,end:-1:1);
B = conv(A,mask);
C = conv2(A, mask,'same');
subplot(2,3,1),imshow(A);title('Original Image');
subplot(2,3,2),imshow(B);title('without tool');
subplot(2,3,3),imshow(C);title('Reference Image with conv2()');

gaussian_filter();
max_and_min_filter();
median_filter();
unshape_mask();