clc;
clear all;
img = imread('D:/Sem 6/IP/MiniProjectIP/images/Fabric2.JPG');
img = rgb2gray(img);
img1 = double(img);
[a b] = size(img1);  
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
imshow(uint8(h(:,:,1)));
homogeneity = graycoprops(graycomatrix(img), 'Homogeneity');