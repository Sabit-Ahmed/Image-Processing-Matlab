function con_2(x)

f=imread(x);
L=max(f);
I=min(f);
a=input('Enter the lower range, a = ');
b=input('Enter the higher range, b = ');

[M,N]=size(f);
        for x = 1:M
            for y = 1:N
                g(x,y)=(f(x,y)-I(x,y)).*((b-a)/(I(x,y)-L(x,y)))+a;
                
            end
        end
figure;
imshow(g);
title('Contrast Stretching');
end