%READ AN IMAGE
I = imread('peppers.png');
%disp(size(I));

%CONVERT RGB IMAGE INTO GRAYSCALE
I = rgb2gray(I);

%ADD SALT AND PEPPER NOISE TO THE GRAYSCALE IMAGE
A = imnoise(I,'Salt & pepper',0.1);

%figure,imshow(A);title('IMAGE WITH SALT AND PEPPER NOISE');


%DEFINE THE WINDOW SIZE MXN
M1=2;
N1=2;

%PAD THE MATRIX WITH ZEROS ON ALL SIDES
modifyA1=padarray(A,[floor(M1/2),floor(N1/2)]);
%figure,imshow(uint8(modifyA)); title('PADDED WITH ZEROS');


B = zeros([size(A,1) size(A,2)]);
med_indx = round((M1*N1)/2); %MEDIAN INDEX

for i=1:size(modifyA1,1)-(M1-1)
    for j=1:size(modifyA1,2)-(N1-1)
       
       
        temp=modifyA1(i:i+(M1-1),j:j+(N1-1),:);
        tmp_sort = sort(temp(:));%tmp(:) converts 2D matrix to 1D matrix
        B(i,j) = tmp_sort(med_indx);
      
      
       
    end
end

%DEFINE THE WINDOW SIZE MXN
M2=5;
N2=5;
%PAD THE MATRIX WITH ZEROS ON ALL SIDES
modifyA2=padarray(A,[floor(M2/2),floor(N2/2)]);
%figure,imshow(uint8(modifyA)); title('PADDED WITH ZEROS');


C = zeros([size(A,1) size(A,2)]);
med_indx = round((M2*N2)/2); %MEDIAN INDEX

for i=1:size(modifyA2,1)-(M2-1)
    for j=1:size(modifyA2,2)-(N2-1)
       
       
        temp=modifyA2(i:i+(M2-1),j:j+(N2-1));
        tmp_sort = sort(temp(:));%tmp(:) converts 2D matrix to 1D matrix
        C(i,j) = tmp_sort(med_indx);
      
      
       
    end
end


 %CONVERT THE IMAGE TO UINT8 FORMAT.
B=uint8(B);
C=uint8(C);
figure;
subplot(2,2,1),imshow(I),title('Original Image');
subplot(2,2,2),imshow(A),title('IMAGE WITH SALT AND PEPPER NOISE');
subplot(2,2,3),imshow(B),title('IMAGE AFTER MEDIAN FILTERING WITH 2x2 WINDOW');
subplot(2,2,4),imshow(C),title('IMAGE AFTER MEDIAN FILTERING WITH 5x5 WINDOW');