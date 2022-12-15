%1
a1=imread('lena.bmp');
a2=imread('lena1.bmp');
a3=imread('lena2.bmp');
a4=imread('lena4.bmp');
b1=imread('woman.bmp');
b2=imread('woman1.bmp');
b3=imread('woman2.bmp');
c1=imread('elain.bmp');
c2=imread('elain1.bmp');
c3=imread('elain2.bmp');
c4=imread('elain3.bmp');
d1=imread('citywall.bmp');
d2=imread('citywall1.bmp');
d3=imread('citywall2.bmp');
figure(1)
imhist(a1)
title('lena.bmp');
figure(2)
imhist(a2)
title('lena1.bmp');
figure(3)
imhist(a3)
title('lena2.bmp');
figure(4)
imhist(a4)
title('lena4.bmp')
figure(5)
imhist(b1)
title('woman.bmp')
figure(6)
imhist(b2)
title('woman1.bmp')
figure(7)
imhist(b3)
title('woman2.bmp')
figure(8)
imhist(c1)
title('elain.bmp')
figure(9)
imhist(c2)
title('elain1.bmp')
figure(10)
imhist(c3)
title('elain2.bmp')
figure(11)
imhist(c4)
title('elain3.bmp')
figure(12)
imhist(d1)
title('citywall.bmp')
figure(13)
imhist(d2)
title('citywall1.bmp')
figure(14)
imhist(d3)
title('citywall2.bmp')


%2
figure(1)
histeq(a1)
figure(2)
histeq(a2)
figure(3)
histeq(a3)
figure(4)
histeq(a4)
figure(5)
histeq(b1)
figure(6)
histeq(b2)
figure(7)
histeq(b3)
figure(8)
histeq(c1)
figure(9)
histeq(c2)
figure(10)
histeq(c3)
figure(11)
histeq(c4)
figure(12)
histeq(d1)
figure(13)
histeq(d2)
figure(14)
histeq(d3)

figure(15)
a1=histeq(a1);
imhist(a1)
figure(16)
a2=histeq(a2);
imhist(a2)
figure(17)
a3=histeq(a3);
imhist(a3)
figure(18)
a4=histeq(a4);
imhist(a4)
figure(19)
b1=histeq(b1);
imhist(b1)
figure(20)
b2=histeq(b2);
imhist(b2)
figure(21)
b3=histeq(b3);
imhist(b3)
figure(22)
c1=histeq(c1);
imhist(c1)
figure(23)
c2=histeq(c2);
imhist(c2)
figure(24)
c3=histeq(c3);
imhist(c3)
figure(25)
c4=histeq(c4);
imhist(c4)
figure(26)
d1=histeq(d1);
imhist(d1)
figure(27)
d2=histeq(d2);
imhist(d2)
figure(28)
d3=histeq(d3);
imhist(d3)

%3


























