function hist_eq()
x = imread('hist.jpg');
Im = rgb2gray(x);
[height,width] = size(Im);


%calculate the number of pixels with the same grey level
PixelNumSame = zeros(1,256);%there are 256 grey levels 0-255
for j = 1:height
	for k = 1:width
		PixelNumSame(Im(j,k)+1) = PixelNumSame(Im(j,k)+1)+1;
	end
end

%calculate the probability density
ProDensity = zeros(1,256);
for i = 1:256
	ProDensity(i) = PixelNumSame(i) / (height * width);
end

%calculate the probability density after the equalization
ProDenAfter = zeros(1,256);
for i = 1:256
	if i == 1
		ProDenAfter(i) = ProDensity(i);
	else
		ProDenAfter(i) = ProDensity(i)+ProDenAfter(i-1);
	end
end

%calculate the equalized grey level
GreyLevelEq = uint8(ProDenAfter*255);

%map the image 
for j = 1:height
	for k = 1:width
		Im2(j,k) = GreyLevelEq(Im(j,k)+1);
	end
end

figure;
subplot(2,2,1)
imshow(Im);
title('Original image');
subplot(2,2,2);
imhist(Im);
figure;
%show the new image and histogram
subplot(2,2,1);
imshow(Im2);
title('After histogram equalization');
subplot(2,2,2);
imhist(Im2);

% histogram equalization with tool
x=histeq(Im);
figure;
subplot(2,2,1);
imshow(x);
title('Using tool');
subplot(2,2,2);
imhist(x);
end