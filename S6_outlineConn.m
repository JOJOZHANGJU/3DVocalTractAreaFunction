clear all; clc; close all;

s='Figures\S5_rotated_mids-sagittal.png';

%% connect the outline
image=imread(s);
seed=[];
[M,N,P]=size(image);
for i=1:M
    for j=1:N
        if image(i,j,1)==255&&image(i,j,2)==0&&image(i,j,3)==0
            seed=[seed;i j];
            image(i,j,2)=255;
            image(i,j,3)=255;
        end
    end
end
se1=strel('disk',1);
I2=imerode(image,se1);

l=size(seed,1);
for i=1:l
    I2(seed(i,1),seed(i,2),1)=255;
    I2(seed(i,1),seed(i,2),2)=0;
    I2(seed(i,1),seed(i,2),3)=0;
end

figure(3);imshow(I2);
imwrite(I2,'Figures\S6_Connected_mid-sagittal.png');


    