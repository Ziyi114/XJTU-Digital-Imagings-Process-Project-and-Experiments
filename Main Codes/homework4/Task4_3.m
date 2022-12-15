clear;clc;
%��ȡͼ�񲢴���
test3=imread('test3_corrupt.pgm');
test4=imread('test4 copy.bmp');
test3_sobel=Sobel(test3);test4_sobel=Sobel(test4);
test3_laplace=Laplace(test3);test4_laplace=Laplace(test4);
test3_canny=Canny(test3);test4_canny=Canny(test4);
%���Sobel��Ե�����ͼ��
figure('NumberTitle','off','Name','Sobel')
subplot(2,2,1);imshow(test3);title('test3\_original');
subplot(2,2,2);imshow(test3_sobel);title('test3\_sobel');
subplot(2,2,3);imshow(test4);title('test4\_original');
subplot(2,2,4);imshow(test4_sobel);title('test4\_sobel');
%���Laplace��Ե�����ͼ��
figure('NumberTitle','off','Name','Laplace')
subplot(2,2,1);imshow(test3);title('test3\_original');
subplot(2,2,2);imshow(test3_laplace);title('test3\_laplace');
subplot(2,2,3);imshow(test4);title('test4\_original');
subplot(2,2,4);imshow(test4_laplace);title('test4\_laplace');
%���Canny��Ե�����ͼ��
figure('NumberTitle','off','Name','Canny')
subplot(2,2,1);imshow(test3);title('test3\_original');
subplot(2,2,2);imshow(test3_canny);title('test3\_Canny');
subplot(2,2,3);imshow(test4);title('test4\_original');
subplot(2,2,4);imshow(test4_canny);title('test4\_Canny');

%% *************** ��  �� ********************
%Canny�㷨
function Img_out=Canny(Img)
Imgblur=GaussianFilter(Img,3,2);    %�ø�˹�˲���ͼ�����ģ�������Խ�������Ӱ��
[~,gx,gy]=Sobel(Imgblur);   %��Sobel�õ�x��y������ݶ�
g=uint8(sqrt(double(gx.*gx)+double(gy.*gy)));   %�õ�ͼ����ݶȷ�ֵ����
theta=atan2(double(gy),double(gx)); %�õ�ͼ����ݶȷ������
gcom=g; %׼��һ���洢�ռ�gcom
g=double(g);    %��g��Ϊdouble�ͣ�Ϊ��������׼��
%���潫���շ���ֱ��жϣ�
for i=2:size(g,1)-1
    for j=2:size(g,2)-2
        if ((theta(i,j)>=0)&(theta(i,j)<pi/4))|((theta(i,j)>=-pi)&(theta(i,j)<-3*pi/4))
            g1=g(i-1,j+1)*(gy(i,j)/gx(i,j))+g(i,j+1)*(1-gy(i,j)/gx(i,j));   %�ò�ֵ�õ��ݶȷ����ϵ�һ�������ص㣬��ͬ
            g2=g(i+1,j-1)*(gy(i,j)/gx(i,j))+g(i,j-1)*(1-gy(i,j)/gx(i,j));   %�ò�ֵ�õ��ݶȷ����ϵ���һ�������ص㣬��ͬ
            if (gcom(i,j)<=g1)|(gcom(i,j)<=g2)  
                gcom(i,j)=0;    %�����ݶȷ����ϲ��Ǽ���ֵ����0����ͬ
            end
        end
        if ((theta(i,j)>=pi/4)&(theta(i,j)<pi/2))|((theta(i,j)>=-3*pi/4)&(theta(i,j)<-pi/2))
            g1=g(i-1,j+1)*(gx(i,j)/gy(i,j))+g(i-1,j)*(1-gx(i,j)/gy(i,j));
            g2=g(i+1,j-1)*(gx(i,j)/gy(i,j))+g(i+1,j)*(1-gx(i,j)/gy(i,j));
            if (gcom(i,j)<=g1)|(gcom(i,j)<=g2)
                gcom(i,j)=0;
            end
        end
        if ((theta(i,j)>=pi/2)&(theta(i,j)<3*pi/4))|((theta(i,j)>=-pi/2)&(theta(i,j)<-pi/4))
            g1=g(i-1,j-1)*(-gx(i,j)/gy(i,j))+g(i-1,j)*(1+gx(i,j)/gy(i,j));
            g2=g(i+1,j+1)*(-gx(i,j)/gy(i,j))+g(i+1,j)*(1+gx(i,j)/gy(i,j));
            if (gcom(i,j)<=g1)|(gcom(i,j)<=g2)
                gcom(i,j)=0;
            end
        end
        if ((theta(i,j)>=3*pi/4)&(theta(i,j)<=pi))|((theta(i,j)>=-pi/4)&(theta(i,j)<0))
            g1=g(i-1,j-1)*(-gy(i,j)/gx(i,j))+g(i,j-1)*(1+gy(i,j)/gx(i,j));
            g2=g(i+1,j+1)*(-gy(i,j)/gx(i,j))+g(i,j+1)*(1+gy(i,j)/gx(i,j));
            if (gcom(i,j)<=g1)|(gcom(i,j)<=g2)
                gcom(i,j)=0;
            end
        end
    end
end
g=uint8(gcom); %�����º�ľ�����g��
high=30;low=5; %���øߵ���ֵ
gunderlow=uint8(g>=low);    %���ڵ���ֵ�ĵ�
g1=g.*gunderlow;    %�����ڵ���ֵ�ĵ���0
gbetween=uint8(g1<=high);   %��������ֵ֮��ĵ㣨��ȷ���㣩
gsure=uint8(g1>high);   %���ڸ���ֵ�ĵ㣬��ȷ�������ĵ�
[m,n]=size(gsure);z1=zeros(1,n);z2=zeros(m,1);  %z1��z2�ֱ���ˮƽ��ֱ��0����
%���²��������ڸ���ֵ�ĵ���չ��8-����
gsureex=gsure+[z2,gsure(:,1:n-1)]+[gsure(:,2:n),z2]+[z1;gsure(1:m-1,:)]+[gsure(2:m,:);z1]...
    +[z2,[z1(1:n-1);gsure(1:m-1,1:n-1)]]+[z2,[gsure(2:m,1:n-1);z1(1:n-1)]]...
    +[[z1(1:n-1);gsure(1:m-1,2:n)],z2]+[[gsure(2:m,2:n);z1(1:n-1)],z2];
gsureex=uint8(gsureex>0);
gbetween1=gbetween.*gsureex;    %�õ�8-�������и��ڸ���ֵ��Ĵ�ȷ����
Img_out=g1.*(gbetween1+gsure);  %���ߺϲ���Ϊ���ձ����ĵ�
Img_out=255*Img_out;    %�����ձ����ĵ�ǿ��
end

%Laplacian��Ե��ȡ��
function Img_out=Laplace(Img)
laplace=[1,1,1;1,-8,1;1,1,1];   %����������˹����
Img_out=uint8(conv2(Img,laplace,'same'));
end

%Sobel��Ե��ȡ
function [Img_out,gx,gy]=Sobel(Img)
sobely=[1,2,1;0,0,0;-1,-2,-1];  %����y����Sobel����
sobelx=[1,0,-1;2,0,-2;1,0,-1];  %����x����Sobel����
gx=conv2(Img,sobelx,'same');
gy=conv2(Img,sobely,'same');
Img_out=uint8(abs(gx)+abs(gy));
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

