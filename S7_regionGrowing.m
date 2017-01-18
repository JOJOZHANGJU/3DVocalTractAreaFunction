clear all; clc; close all;

s='Figures\S6_Connected_mid-sagittal.png';

%% region growm
image=imread(s);
seed=[];
[M,N,P]=size(image);
for i=1:M
    for j=1:N
        if image(i,j,1)==255&&image(i,j,2)==0&&image(i,j,3)==0
            seed=[seed;i j];
        end
    end
end
seed = seed(2:end-1,:);

I1=rgb2gray(image);
I=im2bw(I1);
figure(1),imshow(I),title('原始图像');
I=double(I);

l=size(seed,1);
Y=zeros(M,N);       
for i=1:l
    a=seed(i,1);b=seed(i,2);
       Y(a,b)=2; 
end

for i=1:M
    for j=1:N
     if Y(i,j)==2                             
          if  I(i-1,j)==1 
             Y(i-1,j)=3;    
          end                                                  
           if  I(i,j+1)==1
             Y(i,j+1)=3;
           end
      end
     end
end

suit=3;              
count=1;              
while count>0
suit=suit+1;          
count=0;
for i=1:M
   for j=1:N
     if Y(i,j)==suit-1
          if  I(i-1,j)==1&&Y(i-1,j)==0
             Y(i-1,j)=suit;            
             count=count+1;                                
          end
           if  I(i+1,j)==1&&Y(i+1,j)==0
              Y(i+1,j)=suit;                  
             count=count+1;
          end
          if  I(i,j-1)==1&&Y(i,j-1)==0
              Y(i,j-1)=suit;                  
             count=count+1;
          end
          if  I(i,j+1)==1&&Y(i,j+1)==0
              Y(i,j+1)=suit;                  
             count=count+1;
          end
     end
   end
end                        

end

%% show image after region grown
Z=zeros(M,N,3);
for i=1:M
    for j=1:N
        if rem(Y(i,j),5)==1
            Z(i,j,1)=255;
            Z(i,j,2)=0;
            Z(i,j,3)=0;
        end
        if rem(Y(i,j),5)==2
            Z(i,j,1)=0;
            Z(i,j,2)=255;
            Z(i,j,3)=0;
        end    
        if rem(Y(i,j),5)==3
            Z(i,j,1)=0;
            Z(i,j,2)=0;
            Z(i,j,3)=255;
        end 
        if rem(Y(i,j),5)==4
            Z(i,j,1)=0;
            Z(i,j,2)=255;
            Z(i,j,3)=255;
        end 
    end
end

figure,imshow(Z),title('分割后图像');
imwrite(Z,'Figures\S7_regionGrown.png');
save Data\S7_regionGrown Y;


 