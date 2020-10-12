function unsharp_mask()
%Without built_in function
%Read an Image
Img = imread('coins.png');
A = imnoise(Img,'Gaussian',0.04,0.003);
%Image with noise
%figure,imshow(A);
I = double(A);

%Design the Gaussian Kernel
%Standard Deviation
sigma = 1.76;
%Window size
sz = 4;
[x,y]=meshgrid(-sz:sz,-sz:sz);

M = size(x,1)-1;
N = size(y,1)-1;
Exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);
%Initialize
Output=zeros(size(I));
%Pad the vector with zeros
I = padarray(I,[sz sz]);

%Convolution
for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp = I(i:i+M,j:j+M).*Kernel;
        Output(i,j)=sum(Temp(:));
    end
end
%Output=conv(Img,Kernel);
%Image without Noise after Gaussian blur
Output = uint8(Output);

Output2=Img-Output;
Output2 = padarray(Output2,[sz sz]);
Output2=double(Output2);
Img1=double(Img);
Output3=zeros(size(I));

k=1;
for i = 1:size(Img1,1)-M
    for j =1:size(Img1,2)-N
        Temp(i:i+M,j:j+M) = Img1(i:i+M,j:j+M)+k.*Output2(i:i+M,j:j+M);
        Output3=Temp;
    end
end

Output4=zeros(size(I));
k=2;

%for i = 1:size(Img1,1)-M
%    for j =1:size(Img1,2)-N
%        Temp(i:i+M,j:j+M) = Img1(i:i+M,j:j+M)+k.*Output2(i:i+M,j:j+M);
%        Output4=Temp;
%    end
%end
for i = 1:size(Img1,1)-M
    for j =1:size(Img1,2)-N
        Temp(i:i+M,j:j+M) = k.*Output2(i:i+M,j:j+M);
    end
end
Output4=double(Img)+Temp;
Output3 = uint8(Output3);
Output4 = uint8(Output4);
figure;
subplot(2,3,1),imshow(Img),title('Original Image');
subplot(2,3,2),imshow(Output),title('GAUSSIAN FILTER');
subplot(2,3,3),imshow(Output2),title('SUBTRACTION');
subplot(2,3,4),imshow(Output3),title('UNSHAPE MASK WHERE K=1');
subplot(2,3,6),imshow(Output4),title('HIGHBOOST FILTER WHERE K>1');
end
 