function hist_match()
im1 = imread('hist_m.jpg');
im2 = imread('hist_m_ad.jpg');
M = zeros(256,1,'uint8'); 
hist1 = imhist(im1); 
hist2 = imhist(im2);
cdf1 = cumsum(hist1) / numel(im1); 
cdf2 = cumsum(hist2) / numel(im2);
 for idx = 1 : 256
    diff = abs(cdf1(idx) - cdf2);
    [~,ind] = min(diff);
    M(idx) = ind-1;
end
out = M(double(im1)+1);
subplot(2,3,1),imshow(im1);title('Reference Image');
subplot(2,3,2),imshow(im2);title('Image to be adjusted');
subplot(2,3,3),imshow(out);title('Histogram matched image');
subplot(2,3,4),imhist(im1);title('Histogram of reference image');
subplot(2,3,5),imhist(im2);title('Histogram of the image to be adjusted');
subplot(2,3,6),imhist(out);title('After histogram matching');
end