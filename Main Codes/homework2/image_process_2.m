%2.1
ia=imread('Image A.jpg');
ib=imread('Image B.jpg');
figure(1)
subplot(121)
imshow(ia);
axis on
xlabel x
ylabel y
subplot(122)
imshow(ib);
axis on
xlabel x
ylabel y
figure(2)
ia=ia(:,:,1);
ib=ib(:,:,1);

subplot(121)
imshow(ia);
axis on
xlabel x
ylabel y
subplot(122)
imshow(ib);
axis on
xlabel x
ylabel y

[optimizer, metric] = imregconfig('monomodal');
ibRegisteredDefault = imregister(ib, ia, 'affine', optimizer, metric);
figure(3)
imshow(ibRegisteredDefault)
title('A: Default registration');


%2.2
ia1=imread('C:\Users\Lenovo\Desktop\数字图像处理作业\第二次作业\第二次作业——图像配准\Image A.jpg');
ib1=imread('C:\Users\Lenovo\Desktop\数字图像处理作业\第二次作业\第二次作业——图像配准\Image B.jpg');
ia_base=rgb2gray(ia1);
ib_transfer=rgb2gray(ib1);
ia_base=255-ia_base;
ib_transfer=255-ib_transfer;
points_ia=detectHarrisFeatures(ia_base);
points_ib=detectHarrisFeatures(ib_transfer);
points_ia=selectStrongest(points_ia,100);
points_ib=selectStrongest(points_ib,100);
figure(1)
imshow(ia_base);
title('100个角点');
hold on;
plot(points_ia);
figure(2)
imshow(ib_transfer);
title('ImageB上的100个角点');
hold on;
plot(points_ib);
[fa,arix_ia_mtx]=extractFeatures(ia_base,points_ia);
[fb,arix_ib_mrix]=extractFeatures(ib_transfer,points_ib);
pairs=matchFeatures(fa,fb);
matchedPoints_ia=arix_ia_mtx(pairs(1:7,1));
matchedPoints_ib=arix_ib_matrix(pairs(1:7,2));
figure(3)
showMatchedFeatures(ia1,ib1,matchedPointsA,matchedPoints_ib,'montage');
title('配准');
arix_ia=double(matchedPointsA.Location);
arix_ib=double(matchedPoints_ib.Location);
t_form=cp2tform(arix_ib,arix_ia,'affine');
b_out=imtransform(ib1,t_form);
figure(4)
subplot(1,2,1)
imshow(ia1);
title('参考')
subplot(1,2,2)
imshow(b_out);
title('配准')
t_form.tdata.T

