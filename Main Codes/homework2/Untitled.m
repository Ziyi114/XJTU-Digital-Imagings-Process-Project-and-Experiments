A=imread('C:\Users\Lenovo\Desktop\����ͼ������ҵ\�ڶ�����ҵ\�ڶ�����ҵ����ͼ����׼\Image A.jpg');
B=imread('C:\Users\Lenovo\Desktop\����ͼ������ҵ\�ڶ�����ҵ\�ڶ�����ҵ����ͼ����׼\Image B.jpg');
A_base=rgb2gray(A);
B_transfer=rgb2gray(B);
A_base=255-A_base;
B_transfer=255-B_transfer;
%����Harris�ǵ����㷨���ҵ�����ͼ�ϵĽǵ�
pointsA=detectHarrisFeatures(A_base);
pointsB=detectHarrisFeatures(B_transfer);
pointsA=selectStrongest(pointsA,100);
pointsB=selectStrongest(pointsB,100);
figure(1)
imshow(A_base);
title('ImageA�ϵ�100���ǵ�');
hold on;
plot(pointsA);
figure(2)
imshow(B_transfer);
title('ImageB�ϵ�100���ǵ�');
hold on;
plot(pointsB);

%������ͼ�ϵ������ڵ���׼��ֻ��Ҫ7����ǿ�ĵ�
[f1,arixA_matrix]=extractFeatures(A_base,pointsA);
[f2,arixB_matrix]=extractFeatures(B_transfer,pointsB);
pairs=matchFeatures(f1,f2);
matchedPointsA=arixA_matrix(pairs(1:7,1))
matchedPointsB=arixB_matrix(pairs(1:7,2))
figure(3)
showMatchedFeatures(A,B,matchedPointsA,matchedPointsB,'montage');
title('��׼');
arixA=double(matchedPointsA.Location);
arixB=double(matchedPointsB.Location);
tform=cp2tform(arixB,arixA,'affine');
B_out=imtransform(B,tform);
figure(4)
subplot(1,2,1)
imshow(A);
title('�ο�ͼ��')
subplot(1,2,2)
imshow(B_out);
title('���ͼ��')
tform.tdata.T
