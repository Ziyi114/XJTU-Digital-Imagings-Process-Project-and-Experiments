%1.1 75
i1=imread('test1.pgm');
i2=imread('test2.tif');
figure(1)
subplot(1,2,1)
imshow(i1);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i1);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
butterworth_num=2;
d0=75;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2))^2);
        H1(u,v)=1/(1+(D1(u,v)/d0)^(2*butterworth_num));
        G1(u,v)=F1(u,v)*H1(u,v);
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2))^2);
        H2(u,v)=1/(1+(D2(u,v)/d0)^(2*butterworth_num));
        G2(u,v)=F2(u,v)*H2(u,v);
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('butterworth d0=75 lowpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2

%1.1 25
i1=imread('test1.pgm');
i2=imread('test2.tif');
figure(1)
subplot(1,2,1)
imshow(i1);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i1);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
butterworth_num=2;
d0=25;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2))^2);
        H1(u,v)=1/(1+(D1(u,v)/d0)^(2*butterworth_num));
        G1(u,v)=F1(u,v)*H1(u,v);
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2))^2);
        H2(u,v)=1/(1+(D2(u,v)/d0)^(2*butterworth_num));
        G2(u,v)=F2(u,v)*H2(u,v);
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('butterworth d0=25 lowpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2

%1.2 75
i1=imread('test1.pgm');
i2=imread('test2.tif');
figure(1)
subplot(1,2,1)
imshow(i1);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i1);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
d0=75;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2)^2));
        H1(u,v)=exp(-D1(u,v)^2/(2*d0^2));
        G1(u,v)=F1(u,v)*H1(u,v);
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2)^2));
        H2(u,v)=exp(-D2(u,v)^2/(2*d0^2));
        G2(u,v)=F2(u,v)*H2(u,v);
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('gaussian d0=75 lowpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2


%1.2 25
i1=imread('test1.pgm');
i2=imread('test2.tif');
figure(1)
subplot(1,2,1)
imshow(i1);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i1);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
d0=25;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2)^2));
        H1(u,v)=exp(-D1(u,v)^2/(2*d0^2));
        G1(u,v)=F1(u,v)*H1(u,v);
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2)^2));
        H2(u,v)=exp(-D2(u,v)^2/(2*d0^2));
        G2(u,v)=F2(u,v)*H2(u,v);
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('gaussian d0=25 lowpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2

%2.1 25
i3=imread('test3_corrupt.pgm');
i2=imread('test4 copy.bmp');
figure(1)
subplot(1,2,1)
imshow(i3);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i3);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
butterworth_num=2;
d0=25;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2))^2);
        H1(u,v)=1/(1+(d0/D1(u,v))^(2*butterworth_num));
        G1(u,v)=F1(u,v)*H1(u,v);
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2))^2);
        H2(u,v)=1/(1+(d0/D2(u,v))^(2*butterworth_num));
        G2(u,v)=F2(u,v)*H2(u,v);
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('butterworth d0=25 highpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2

%2.1 75
i1=imread('test3_corrupt.pgm');
i2=imread('test4 copy.bmp');
figure(1)
subplot(1,2,1)
imshow(i1);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i1);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
butterworth_num=2;
d0=75;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2))^2);
        H1(u,v)=1/(1+(d0/D1(u,v))^(2*butterworth_num));
        G1(u,v)=F1(u,v)*H1(u,v);
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2))^2);
        H2(u,v)=1/(1+(d0/D2(u,v))^(2*butterworth_num));
        G2(u,v)=F2(u,v)*H2(u,v);
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('butterworth d0=75 highpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2

%2.2 25
i1=imread('test3_corrupt.pgm');
i2=imread('test4 copy.bmp');
figure(1)
subplot(1,2,1)
imshow(i1);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i1);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
d0=25;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2))^2);
        H1(u,v)=1-exp(-D1(u,v)^2/(2*d0^2));
        G1(u,v)=F1(u,v)*H1(u,v);
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2))^2);
        H2(u,v)=1-exp(-D2(u,v)^2/(2*d0^2));
        G2(u,v)=F2(u,v)*H2(u,v);
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('gaussian d0=25 highpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2

%2.2 75
i1=imread('test3_corrupt.pgm');
i2=imread('test4 copy.bmp');
figure(1)
subplot(1,2,1)
imshow(i1);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i1);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
d0=75;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2))^2);
        H1(u,v)=1-exp(-D1(u,v)^2/(2*d0^2));
        G1(u,v)=F1(u,v)*H1(u,v);
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2))^2);
        H2(u,v)=1-exp(-D2(u,v)^2/(2*d0^2));
        G2(u,v)=F2(u,v)*H2(u,v);
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('gaussian d0=25 highpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2

%3.1 ¼ûmyimlapsharp
%3.2
i1=imread('test3_corrupt.pgm');
i2=imread('test4 copy.bmp');
figure(1)
subplot(1,2,1)
imshow(i1);
subplot(1,2,2)
imshow(i2);
title('³õÊ¼Í¼Ïñ');
f1=double(i1);
f2=double(i2);
F1=fft2(f1);
F1=fftshift(F1);
F2=fft2(f2);
F2=fftshift(F2);
[p1,q1]=size(F1);
[p2,q2]=size(F2);
d0=100;
k1=1;
k2=1;
for u=1:p1
    for v=1:q1
        D1(u,v)=sqrt((u-fix(p1/2))^2+(v-fix(q1/2))^2);
        H1(u,v)=1-exp(-D1(u,v)^2/(2*d0^2));
        G1(u,v)=F1(u,v)*(k1+k2*H1(u,v));
    end
end
for u=1:p2
    for v=1:q2
        D2(u,v)=sqrt((u-fix(p2/2))^2+(v-fix(q2/2))^2);
        H2(u,v)=1-exp(-D2(u,v)^2/(2*d0^2));
        G2(u,v)=F2(u,v)*(k1+k2*H2(u,v));
    end
end
g1=ifftshift(G1);
g1=ifft2(g1);
g1=uint8(real(g1));
g2=ifftshift(G2);
g2=ifft2(g2);
g2=uint8(real(g2));
figure(2)
subplot(2,2,1)
imshow(g1);
subplot(2,2,2)
imshow(g2);
title('unmask highpass');
s=0;
s1=0;
for u=1:p1
    for v=1:q1
        l1=(abs(G1(u,v)))^2;
        s1=s1+l1;
        l=(abs(F1(u,v)))^2;
        s=s+l;
    end
end
l1=s1/s;
s=0;
s2=0;
for u=1:p2
    for v=1:q2
        l2=(abs(G2(u,v)))^2;
        s2=s2+l2;
        l=(abs(F2(u,v)))^2;
        s=s+l;
    end
end
l2=s2/s;
l1
l2














