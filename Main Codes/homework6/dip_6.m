%6.1 ??˹?????????ָ?
i=imread('lena.bmp');
i_origin=i;
i_gaussnoise1=GaussianNoise(i,0,0.1);
i_gaussnoise2=GaussianNoise(i,0,0.5);
i_gaussnoise3=GaussianNoise(i,0.5,0.1);

figure('NumberTitle','off','Name','gauss????')
subplot(2,2,1);imshow(i_origin);title('origin');
subplot(2,2,2);imshow(i_gaussnoise1);title('av=0,std=0.1');
subplot(2,2,3);imshow(i_gaussnoise2);title('av=0,std=0.5');
subplot(2,2,4);imshow(i_gaussnoise3);title('av=0.5,std=0.1');

i_gauss_gauss1=GaussianFilter(i_gaussnoise1,3,1.5);
i_gauss_gauss2=GaussianFilter(i_gaussnoise1,5,1.5);
i_gauss_median1=MedianFilter(i_gaussnoise1,3);
i_gauss_median2=MedianFilter(i_gaussnoise1,5);
figure('NumberTitle','off','Name','gauss?????ָ?')
subplot(3,2,1);imshow(i_origin);title('ԭͼ');
subplot(3,2,2);imshow(i_gaussnoise1);title('gauss????av=0,std=0.1');
subplot(3,2,3);imshow(i_gauss_gauss1);title('gauss?˲??? 3x3');
subplot(3,2,4);imshow(i_gauss_gauss2);title('gauss?˲??? 5x5');
subplot(3,2,5);imshow(i_gauss_median1);title('??ֵ?˲??? 3x3');
subplot(3,2,6);imshow(i_gauss_median2);title('??ֵ?˲??? 5x5');

%6.2 ?????????????ָ?
i_saltpepper=SaltPepperNoise(i,0.1,0.1);
i_pepper=SaltPepperNoise(i,0.1,0);
i_salt=SaltPepperNoise(i,0,0.1);

figure('NumberTitle','off','Name','????????')
subplot(2,2,1);imshow(i_origin);title('origin');
subplot(2,2,2);imshow(i_saltpepper);title('????????a=b=0.1');
subplot(2,2,3);imshow(i_pepper);title('????????a=0.1,b=0');
subplot(2,2,4);imshow(i_salt);title('????????a=0,b=0.1');

i_saltpepper_gauss1=GaussianFilter(i_saltpepper,3,1.5);
i_saltpepper_gauss2=GaussianFilter(i_saltpepper,5,1.5);
i_saltpepper_median1=MedianFilter(i_saltpepper,3);
i_saltpepper_median2=MedianFilter(i_saltpepper,5);
figure('NumberTitle','off','Name','?????????ָ?')
subplot(3,2,1);imshow(i_origin);title('ԭͼ');
subplot(3,2,2);imshow(i_saltpepper);title('????????a=b=0.1');
subplot(3,2,3);imshow(i_saltpepper_gauss1);title('gauss?˲??? 3x3');
subplot(3,2,4);imshow(i_saltpepper_gauss2);title('gauss?˲??? 5x5');
subplot(3,2,5);imshow(i_saltpepper_median1);title('??ֵ?˲??? 3x3');
subplot(3,2,6);imshow(i_saltpepper_median2);title('??ֵ?˲??? 5x5');

%??г????ֵ?˲?
ic1_pos=Contraharmonic(i_pepper,2);
ic2_pos=Contraharmonic(i_salt,2);
ic1_neg=Contraharmonic(i_pepper,-2);
ic2_neg=Contraharmonic(i_salt,-2);

figure('NumberTitle','off','Name','??г????ֵ?˲?')
subplot(3,3,1);imshow(i_origin);title('ԭͼ');
subplot(3,3,2);imshow(i_pepper);title('????????');
subplot(3,3,3);imshow(i_salt);title('????????');
subplot(3,3,4);imshow(i_origin);title('ԭͼ');
subplot(3,3,5);imshow(ic1_pos);title('???????? Q=2');
subplot(3,3,6);imshow(ic2_pos);title('???????? Q=2');
subplot(3,3,7);imshow(i_origin);title('ԭͼ');
subplot(3,3,8);imshow(ic1_neg);title('???????? Q=-2');
subplot(3,3,9);imshow(ic2_neg);title('???????? Q=-2');

%6.3 ά???˲???
h=fspecial('motion',50,45);
i_blur=imfilter(i,h,'circular','conv');
i_blur_done=imnoise(i_blur,'gaussian',0,0.01);
%i_wnrecover=deconvwnr(i_blur_done,h,[]);
noise=imnoise(zeros(size(i)),'gaussian',0,0.01);
nsr=sum(noise(:).^2)/sum(im2double(i(:)).^2);
i_wnrecover_done=deconvwnr(i_blur_done,h,nsr);
%i1=checherboard(8);
np=0.01*prod(size(i));
i_reg=deconvreg(i_blur_done,h,np);

figure('NumberTitle','off','Name','ά???˲???')
subplot(2,3,1);imshow(i_origin);title('ԭͼ');
subplot(2,3,2);imshow(i_blur);title('ģ??');
subplot(2,3,3);imshow(i_blur_done);title('ģ??+????');
subplot(2,3,4);imshow(i_origin);title('ԭͼ');
subplot(2,3,5);imshow(i_wnrecover_done);title('ά???˲???');
subplot(2,3,6);imshow(i_reg);title('Լ????С???˷?');



%?Ӹ?˹??????
function Img_out=GaussianNoise(Img,av,std)
[M,N]=size(Img);
u1=rand(M,N);   u2=rand(M,N);
x=std*sqrt(-2*log(u1)).*cos(2*pi*u2)+av;
Img_out=uint8(255*(double(Img)/255+x));
end
%?ӽ?????????
function Img_out=SaltPepperNoise(Img,a,b)
[M,N]=size(Img);
x=rand(M,N);
Img_out=Img;
Img_out(find(x<=a))=0;
Img_out(find(x>a&x<(a+b)))=255;
end
% ??˹?˲???
function Img_out=GaussianFilter(Img,masksize,sigma)
for i=1:masksize
    for j=1:masksize
        x=i-ceil(masksize/2);
        y=j-ceil(masksize/2);
        h(i,j)=exp(-(x^2+y^2)/(2*sigma^2))/(2*pi*sigma^2);
    end
end
Img_out=uint8(conv2(Img,h,'same'));
end
% ??ֵ?˲???
function Img_out=MedianFilter(Img,masksize)
exsize=floor(masksize/2);   %????????չ??С
Imgex=padarray(Img,[exsize,exsize],'replicate','both'); %??չͼƬ
[m,n]=size(Img);
Img_out=Img;    %??Img_out׼??Ϊ??Img??ͬ??size
for i=1:m
    for j=1:n
        neighbor=Imgex(i:i+masksize-1,j:j+masksize-1);  %??ȡ????
        Img_out(i,j)=median(neighbor(:));   %??ֵ?˲?
    end
end
end
%??г????ֵ?˲???
function Img_out=Contraharmonic(Img,Q)
[M,N]=size(Img);
ImgSize=3;   ImgSize=(ImgSize-1)/2;
Img_out=Img;
for x=1+ImgSize:1:M-ImgSize
    for y=1+ImgSize:1:M-ImgSize
        is=Img(x-ImgSize:1:x+ImgSize,y-ImgSize:1:y+ImgSize);
        Img_out(x,y)=sum(double(is(:)).^(Q+1))/sum(double(is(:)).^(Q));
    end
end
end
%ģ????
function Img_out=Blur(Img_in,a,b,T)
Img_in=double(imread('lena.bmp'));
Img_fft_shift=fftshift(fft2(Img_in));
[M,N]=size(Img_fft_shift);
for i=1:M
    for j=1:N
        H(i,j)=(T/(pi*(i*a+j*b)))*sin(pi*(i*a+j*b))*exp(-sqrt(-1)*pi*(i*a+j*b));
        G(i,j)=H(i,j)*Img_fft_shift(i,j);
    end
end
Img_out=ifft2(ifftshift(G));
Img_out=256.*Img_out./max(max(Img_out));
Img_out=uint8(real(Img_out));
end
