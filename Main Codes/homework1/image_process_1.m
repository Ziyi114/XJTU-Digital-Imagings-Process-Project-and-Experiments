%题目2
I=imread('lena.bmp');
figure(1)
imshow(I)
title('256');
[width,height]=size(I);
img128=zeros(width,height);
img64=zeros(width,height);
img32=zeros(width,height);
img16=zeros(width,height);
img8=zeros(width,height);
img4=zeros(width,height);
for i=1:width
    for j=1:height
        img128(i,j)=floor(I(i,j)/2);
    end
end
figure(2)
imshow(uint8(img128),[0,127])
title('128');
for i=1:width
    for j=1:height
        img64(i,j)=floor(I(i,j)/4);
    end
end
figure(3)
imshow(uint8(img64),[0,63])
title('64');
for i=1:width
    for j=1:height
        img32(i,j)=floor(I(i,j)/8);
    end
end
figure(4)
imshow(uint8(img32),[0,31])
title('32');
for i=1:width
    for j=1:height
        img16(i,j)=floor(I(i,j)/16);
    end
end
figure(5)
imshow(uint8(img16),[0,15])
title('16');
for i=1:width
    for j=1:height
        img8(i,j)=floor(I(i,j)/32);
    end
end
figure(6)
imshow(uint8(img8),[0,7])
title('8');
for i=1:width
    for j=1:height
        img4(i,j)=floor(I(i,j)/64);
    end
end
figure(7)
imshow(uint8(img4),[0,3])
title('4');
for i=1:width
    for j=1:height
        img2(i,j)=floor(I(i,j)/128);
    end
end
figure(8)
imshow(uint8(img2),[0,1])
title('2');

%题目3
a=imread('lena.bmp');
figure(1)
imhist(a)
title('直方图');
b=mean2(a)
c=std2(a)
d=c^2

%题目4
a=imread('lena.bmp');
b1=imresize(a,[2048 2048],'nearest');
figure(1)
imshow(a);
title('origin');
figure(2)
imshow(b1);
title('近邻');
b2=imresize(a,[2048 2048],'bilinear');
figure(3)
imshow(b2);
title('双线性');
b3=imresize(a,[2048 2048],'bicubic');
figure(4)
imshow(b2);
title('双三次');

%题目5
%水平偏移
t_type='affine';
t_matrix=[1 3 0;0 1 0;0 0 1];
t=maketform(t_type,t_matrix);
i=imread('lena.bmp');
j=imread('elain1.bmp');
a_t=imtransform(i,t);
c_t=imtransform(j,t);
figure(1)
imshow(i);
title('lena origin');
b1=imresize(a_t,[2048 2048],'nearest');
figure(2)
imshow(b1);
title('lena水平，最邻近');
b2=imresize(a_t,[2048 2048],'bilinear');
figure(3)
imshow(b2);
title('lena水平，双线性');
b3=imresize(a_t,[2048 2048],'bicubic');
figure(4)
imshow(b3);
title('lena水平，双三次');
figure(5)
imshow(j);
title('elain origin');
d1=imresize(c_t,[2048 2048],'nearest');
figure(6)
imshow(d1);
title('elain水平，最邻近');
d2=imresize(c_t,[2048 2048],'bilinear');
figure(7)
imshow(d2);
title('elain水平，双线性');
d3=imresize(c_t,[2048 2048],'bicubic');
figure(8)
imshow(d3);
title('elain水平，双三次');

%旋转30
a=imread('lena.bmp');
b=imrotate(a,30,'bilinear','crop');
figure(1)
imshow(a);
title('lena origion');
b1=imresize(b,[2048 2048],'nearest');
figure(2)
imshow(b1);
title('lena旋转，最邻近');
b2=imresize(b,[2048 2048],'bilinear');
figure(3)
imshow(b2);
title('lena旋转，双线性');
b3=imresize(b,[2048 2048],'bicubic');
figure(4)
imshow(b3);
title('lena旋转，双三次');
c=imread('elain1.bmp');
d=imrotate(c,30,'bilinear','crop');
figure(5)
imshow(c);
title('elain origion');
d1=imresize(d,[2048 2048],'nearest');
figure(6)
imshow(d1);
title('elain旋转，最邻近');
d2=imresize(d,[2048 2048],'bilinear');
figure(7)
imshow(d2);
title('elain旋转，双线性');
d3=imresize(d,[2048 2048],'bicubic');
figure(8)
imshow(d3);
title('elain旋转，双三次');





