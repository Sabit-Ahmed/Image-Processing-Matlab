function max_and_min_filter()
%READ AN IMAGE
A = imread('board.tif');
A = rgb2gray(A(1:300,1:300,:));
%figure,imshow(A),title('ORIGINAL IMAGE');


%PREALLOCATE THE OUTPUT MATRIX
B=zeros(size(A));
C=zeros(size(A));
%PAD THE MATRIX A WITH ZEROS
modifyA=padarray(A,[1 1]);
modifyA=double(modifyA);
        x=[1:3]';
        y=[1:3]';
  
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
      
       %VECTORIZED METHOD
       %window=reshape(modifyA(i+x-1,j+y-1),[],1);
       window = modifyA(i:i+2,j:j+2);
       %FIND THE MAXIMUM VALUE IN THE SELECTED WINDOW
       %B(i,j)=max(window);
       B(i,j)=max(window(:));
       C(i,j)=min(window(:));
   
    end
end

%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
C=uint8(C);
figure;
subplot(2,3,1),imshow(A),title('ORIGINAL IMAGE');
subplot(2,3,2),imshow(B),title('IMAGE AFTER MAX FILTERING');
subplot(2,3,3),imshow(C),title('IMAGE AFTER MIN FILTERING');