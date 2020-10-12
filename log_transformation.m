function log_transformation()
x='log.jpg';
a=importdata(x);
g=rgb2gray(a);
dv=im2double(g);
o3=3*log(1+dv);
subplot(1,2,1),imshow(g);title('original image');
subplot(1,2,2),imshow(o3);title('output scaling factor 3');
end
