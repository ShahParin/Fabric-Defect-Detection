clc;
clear all;
img = imread('images/Fabric2.JPG');
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
imhist(img,256);
% imshow(hi);
title('imhist');

figure(4);
histeq(img,256);
% imshow(he);
title('histeq');

% transform curve
figure(5);
[J,T] = histeq(img);
plot((0:255)/255,T);
title('transform curve');

% otsu algo
figure(6);
level = graythresh(img1);
BW = imbinarize(img1,level);
imshowpair(img1,BW,'montage');
title('otsu');

%open-close
figure(7);
se = strel('square',1);
op = imopen(img1,se);
cl = imclose(img1,se);
subplot(1,2,1);
imshow(op);
subplot(1,2,2);
imshow(cl);