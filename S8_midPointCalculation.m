clear all; clc; close all;
load Data\S7_regionGrown;% Y;

%% calculate mid points
[M,N]=size(Y);
mid=[];
count=1;
suit=1;
while count>0&&suit~=277
%   k=1;
    l=0;
    I=[];
    count=0;
    suit=suit+1;
%     fprintf('suit %d\n',suit);
  for j=1:N
      for i=1:M
          if Y(i,j)==suit
            I=[I;i j];
            count=count+1;
          end
      end
  end
  
  
l=size(I,1);
% fprintf('llllll%d\n',l);
if l==0
elseif l==1
    mid=[mid;I];
else
    mid=[mid;mean(I)];
end

end

count=1;
suit=276;
while count>0 
    l=0;
    count=0;
    suit=suit+1;
%     fprintf('suit %d\n',suit);
%     k=1;
    I=[];
  for i=M:-1:1
      for j=1:N
          if Y(i,j)==suit
            I=[I;i j];
            count=count+1;
          end
      end
  end
l=size(I,1);
% fprintf('lll %d\n',l);
if l==0
elseif l==1
    mid=[mid;I];
else
    mid=[mid;mean(I)];
end

end

%% turn image to numerical value
m=size(mid,1);
load Data\S5_glottis_struct; % a_lout A B c_point newx newy origin alpha;  %%change for rotate
 %load data\glottis_lout;% a_lout u_lout A B c_point;
s='Figures\S5_rotated_mids-sagittal.png';
image=imread(s);
seed=[];
[M,N,P]=size(image);
for j=1:N
    for i=1:M
        if image(i,j,1)==255&&image(i,j,2)==0&&image(i,j,3)==0
            seed=[seed;i j];
        end
    end
end

A=c_point(1,:);   
B=c_point(2,:);   
ay0= round(A(2)*M/200);
ax0= round(A(1)*N/200);
by0= round(B(2)*M/200);
bx0= round(B(1)*N/200);

Ix1=M-ay0;Iy1=ax0;
Ix2=N-by0;Iy2=bx0;
if Iy1>Iy2
    xcha=-0.5+Iy1-seed(end,2);
    ycha=-0.5+Ix1-seed(end,1);
else
    xcha=-0.5+Iy2-seed(end,2);
    ycha=-0.5+Ix2-seed(end,1);
end

shux=200/N;%% change for female:140  for male:200
shuy=200/M;%% change for female:140  for male:200
midpoint=[];
for j=1:m-1
   midpoint=[midpoint;(mid(j,2)+xcha)*shux (N-mid(j,1)+ycha)*shuy];
end
save Data\S8_midPoints midpoint;

I1=rgb2gray(image);
I2=im2bw(I1);
for i=1:m
   I2(round(mid(i,1)),round(mid(i,2)))=0;
end
figure(1),imshow(I2),title('Ô­Ê¼Í¼Ïñ');
imwrite(I2,'Figures\S8_midPoints.png');



            
            
        