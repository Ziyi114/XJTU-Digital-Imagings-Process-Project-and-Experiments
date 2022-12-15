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
% ��ֵ�˲���
function Img_out=MedianFilter(Img,masksize)
exsize=floor(masksize/2);   %��������չ��С
Imgex=padarray(Img,[exsize,exsize],'replicate','both'); %��չͼƬ
[m,n]=size(Img);
Img_out=Img;    %��Img_out׼��Ϊ��Img��ͬ��size
for i=1:m
    for j=1:n
        neighbor=Imgex(i:i+masksize-1,j:j+masksize-1);  %��ȡ����
        Img_out(i,j)=median(neighbor(:));   %��ֵ�˲�
    end
end
end
