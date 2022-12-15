A=imread('C:\Users\Lenovo\Desktop\数字图像处理作业\第二次作业\第二次作业——图像配准\Image A.jpg');
B=imread('C:\Users\Lenovo\Desktop\数字图像处理作业\第二次作业\第二次作业——图像配准\Image B.jpg');
A_base=rgb2gray(A);
B_transfer=rgb2gray(B);
A_base=255-A_base;
B_transfer=255-B_transfer;
%运用Harris角点检测算法，找到两张图上的角点
pointsA=detectHarrisFeatures(A_base);
pointsB=detectHarrisFeatures(B_transfer);
pointsA=selectStrongest(pointsA,100);
pointsB=selectStrongest(pointsB,100);
figure(1)
imshow(A_base);
title('ImageA上的100个角点');
hold on;
plot(pointsA);
figure(2)
imshow(B_transfer);
title('ImageB上的100个角点');
hold on;
plot(pointsB);

%将两张图上的特征节点配准，只需要7个最强的点
[f1,arixA_matrix]=extractFeatures(A_base,pointsA);
[f2,arixB_matrix]=extractFeatures(B_transfer,pointsB);
pairs=matchFeatures(f1,f2);
matchedPointsA=arixA_matrix(pairs(1:7,1))
matchedPointsB=arixB_matrix(pairs(1:7,2))
figure(3)
showMatchedFeatures(A,B,matchedPointsA,matchedPointsB,'montage');
title('配准');
arixA=double(matchedPointsA.Location);
arixB=double(matchedPointsB.Location);
tform=cp2tform(arixB,arixA,'affine');
B_out=imtransform(B,tform);
figure(4)
subplot(1,2,1)
imshow(A);
title('参考图像')
subplot(1,2,2)
imshow(B_out);
title('输出图像')
tform.tdata.T
