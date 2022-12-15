clear;clc;
%��ȡͼ�񲢴���
test3=imread('test3_corrupt.pgm');
test4=imread('test4 copy.bmp');
[test3_unsharp,test3_highboost,test3_mask]=Unsharp(test3);
[test4_unsharp,test4_highboost,test4_mask]=Unsharp(test4);
%���ͼ��test3��ԭͼ�����ֲ������ͼ��
figure('NumberTitle','off','Name','test3')
subplot(2,2,1);imshow(test3);title('original');
subplot(2,2,2);imshow(test3_mask);title('Unsharp Mask');
subplot(2,2,3);imshow(test3_unsharp);title('unsharp');
subplot(2,2,4);imshow(test3_highboost);title('highboost,k=3');
%���ͼ��test4��ԭͼ�����ֲ������ͼ��
figure('NumberTitle','off','Name','test4')
subplot(2,2,1);imshow(test4);title('original');
subplot(2,2,2);imshow(test4_mask);title('Unsharp Mask');
subplot(2,2,3);imshow(test4_unsharp);title('unsharp');
subplot(2,2,4);imshow(test4_highboost);title('highboost,k=3');

%% ************ ��   �� ***************
% ������ģ��
function [Img_unsharp,Img_highboost,mask_unsharp]=Unsharp(Img)
Imgblur=GaussianFilter(Img,7,3);    %�ø�˹�˲��õ��黯ͼ��
mask_unsharp=Img-Imgblur;   %�õ�������ģ
Img_unsharp=Img+mask_unsharp;   %�õ�������ģ������ͼ��
Img_highboost=Img+3*mask_unsharp;   %�õ�highboost�˲����ͼ��k=3��
end
% ��˹�˲���
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

