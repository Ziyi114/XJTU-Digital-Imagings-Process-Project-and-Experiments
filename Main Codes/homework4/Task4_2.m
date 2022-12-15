clear;clc;
%读取图像并处理：
test3=imread('test3_corrupt.pgm');
test4=imread('test4 copy.bmp');
[test3_unsharp,test3_highboost,test3_mask]=Unsharp(test3);
[test4_unsharp,test4_highboost,test4_mask]=Unsharp(test4);
%输出图像test3的原图及各种操作后的图像：
figure('NumberTitle','off','Name','test3')
subplot(2,2,1);imshow(test3);title('original');
subplot(2,2,2);imshow(test3_mask);title('Unsharp Mask');
subplot(2,2,3);imshow(test3_unsharp);title('unsharp');
subplot(2,2,4);imshow(test3_highboost);title('highboost,k=3');
%输出图像test4的原图及各种操作后的图像：
figure('NumberTitle','off','Name','test4')
subplot(2,2,1);imshow(test4);title('original');
subplot(2,2,2);imshow(test4_mask);title('Unsharp Mask');
subplot(2,2,3);imshow(test4_unsharp);title('unsharp');
subplot(2,2,4);imshow(test4_highboost);title('highboost,k=3');

%% ************ 函   数 ***************
% 反锐化掩模：
function [Img_unsharp,Img_highboost,mask_unsharp]=Unsharp(Img)
Imgblur=GaussianFilter(Img,7,3);    %用高斯滤波得到虚化图像
mask_unsharp=Img-Imgblur;   %得到反锐化掩模
Img_unsharp=Img+mask_unsharp;   %得到反锐化掩模处理后的图像
Img_highboost=Img+3*mask_unsharp;   %得到highboost滤波后的图像（k=3）
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

