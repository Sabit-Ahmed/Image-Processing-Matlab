function contrast_stretching()
x=imread('x_ray_2.PNG');
f=rgb2gray(x);
%L=max(max(f));

a=input('Enter the lower range, a = ');
b=input('Enter the higher range, b = ');
al=input('Enter alpha value = ');
be=input('Enter beta value = ');
ga=input('Enter gamma value = ');
va=al*a;
vb=be*(b-a)+va;
[M,N]=size(f);
        for x = 1:M
            for y = 1:N
                if(f(x,y)<a)
                    g(x,y)=al*f(x,y);
                elseif(f(x,y)>=a && f(x,y)<b)
                    g(x,y)=be*(f(x,y)-a)+va;
                else
                    g(x,y)=ga*(f(x,y)-b)+vb;
                end
            end
        end
subplot(2,2,1),imshow(f);title('Original image');
subplot(2,2,2),imhist(f);title('Histogram of original image');
subplot(2,2,3),imshow(g);title('After contrast stretching');
subplot(2,2,4),imhist(g);title('Histogram of contrasted image');
end