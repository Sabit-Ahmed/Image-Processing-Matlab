function gamma_correction()
x='gamma.jpg';
a=importdata(x);
g=rgb2gray(a);
dv=im2double(g);
o1=2*(dv.^0.5);
o2=2*(dv.^1.2);
o3=2*(dv.^2.0);
 subplot(2,2,1),
imshow(g);
title('original image');
subplot(2,2,2),
imshow(o1);
title('gamma<1(0.5)');
subplot(2,2,3),imshow(o2);title('gamma>1(1.2)');
subplot(2,2,4),imshow(o3);title('gamma>1(2.0)');
end