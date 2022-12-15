clear;clc;
%读取图像：
test1=imread('test1.pgm');
test2=imread('test2.tif');
%分别以3*3,5*5,7*7进行中值滤波：
test1_median_3=MedianFilter(test1,3);test2_median_3=MedianFilter(test2,3);
test1_median_5=MedianFilter(test1,5);test2_median_5=MedianFilter(test2,5);
test1_median_7=MedianFilter(test1,7);test2_median_7=MedianFilter(test2,7);
%分别以3*3,5*5,7*7进行高斯滤波：
test1_gaussian_3=GaussianFilter(test1,3,1.5);test2_gaussian_3=GaussianFilter(test2,3,1.5);
test1_gaussian_5=GaussianFilter(test1,5,1.5);test2_gaussian_5=GaussianFilter(test2,5,1.5);
test1_gaussian_7=GaussianFilter(test1,7,1.5);test2_gaussian_7=GaussianFilter(test2,7,1.5);
%输出图像：
figure('NumberTitle','off','Name','Median_test1')
subplot(2,2,1);imshow(test1);title('original');
subplot(2,2,2);imshow(test1_median_3);title('mask:3*3');
subplot(2,2,3);imshow(test1_median_5);title('mask:5*5');
subplot(2,2,4);imshow(test1_median_7);title('mask:7*7');
figure('NumberTitle','off','Name','Median_test2')
subplot(2,2,1);imshow(test2);title('original');
subplot(2,2,2);imshow(test2_median_3);title('mask:3*3');
subplot(2,2,3);imshow(test2_median_5);title('mask:5*5');
subplot(2,2,4);imshow(test2_median_7);title('mask:7*7');
figure('NumberTitle','off','Name','Gaussian_test1')
subplot(2,2,1);imshow(test1);title('original');
subplot(2,2,2);imshow(test1_gaussian_3);title('mask:3*3');
subplot(2,2,3);imshow(test1_gaussian_5);title('mask:5*5');
subplot(2,2,4);imshow(test1_gaussian_7);title('mask:7*7');
figure('NumberTitle','off','Name','Gaussian_test2')
subplot(2,2,1);imshow(test2);title('original');
subplot(2,2,2);imshow(test2_gaussian_3);title('mask:3*3');
subplot(2,2,3);imshow(test2_gaussian_5);title('mask:5*5');
subplot(2,2,4);imshow(test2_gaussian_7);title('mask:7*7');
%% *********** 函     数 *************
% 中值滤波：
function Img_out=MedianFilter(Img,masksize)
exsize=floor(masksize/2);   %各方向扩展大小
Imgex=padarray(Img,[exsize,exsize],'replicate','both'); %扩展图片
[m,n]=size(Img);
Img_out=Img;    %将Img_out准备为和Img相同的size
for i=1:m
    for j=1:n
        neighbor=Imgex(i:i+masksize-1,j:j+masksize-1);  %截取邻域
        Img_out(i,j)=median(neighbor(:));   %中值滤波
    end
end
end
% 高斯滤波：
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
