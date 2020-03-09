clc;
clear all;
img = imread('images/Fabric22.jpg');
img = rgb2gray(img);
figure(1);
imshow(img);
img1 = double(img);
[a,b] = size(img1);  
c=5;d=5;   
l=1;
h = zeros(5,5,10404);
hom = zeros(10404,1);
for i=1:c:a-4
    for j=1:d:b-4
        C=img1((i:i+4),(j:j+4));
        h(:,:,l) = C;
        temp = zeros(5,5);
        for k=1:5
            for l1=1:5
                temp(k,l1) = h(k,l1,l);
            end
        end
        l=l+1;
    end
end
figure(2);
imshow(uint8(h(:,:,1)));
title('homo');
homogeneity = graycoprops(graycomatrix(img), 'Homogeneity');

% histogram eq.
figure(3);
imhist(img1,256);
% imshow(hi);
title('imhist');

figure(4);
histeq(img1,256);
% imshow(he);
title('histeq');
% img1 = histeq(img1);

% transform curve
figure(5);
[J,T] = histeq(img);
plot((0:255)/255,T);
title('transform curve');

% % otsu algo
% figure(6);
% level = graythresh(img1);
% BW = imbinarize(img1,level);
% imshowpair(img1,BW,'montage');
% title('otsu');

% open-close
figure(7);
se = strel('square',1);
op = imerode(double(img1),se);
cl = imclose(double(img1),se);
subplot(1,2,1);
imshow(uint8(op));
subplot(1,2,2);
imshow(uint8(img1));

% local threshold
filt = zeros(a,b);
for i = 1:3
    for j = 1:3
        filt(i,j) = 1;
    end
end
filt(2,2) = -8;
opt = zeros(a,b);
for i=2:a
    for j=2:b
        if j==1||j==b||i==1||i==a
            opt(i,j) = img1(i,j);
        else
            opt(i,j) = filt(1,1)*img1(i-1,j-1) + filt(1,2)*img1(i-1,j) + filt(1,3)*img1(i-1,j+1) + filt(2,1)*img1(i,j-1) + filt(2,2)*img1(i,j) + filt(2,3)*img1(i,j+1) + filt(3,1)*img1(i+1,j-1) + filt(3,2)*img1(i+1,j) + filt(3,3)*img1(i+1,j+1);
        end
    end
end
figure(8);
imshow(uint8(opt));

% global threshold
for i=1:a
    for j=1:b
        t = img1(i,j);
        if t<70
            img1(i,j) = 0;
        else
            img1(i,j) = 256;
        end
    end
end
figure(9);
imshow(uint8(img1));
title('local');