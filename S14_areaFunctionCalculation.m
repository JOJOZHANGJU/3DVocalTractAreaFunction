clear all; clc;
imgWid = 14.39;%cm
imgLen = 14.39;%cm
 for i = 1:67 %Stop to the open-end of the lip
     imgFile = ['Cross-section\qie_', num2str(i),'.png'];
     I=imread(imgFile);
     I1=rgb2gray(I);
     BW=im2bw(I1);
     [m,n]=size(BW);
     bw1=ones(m,n)-BW;
     holes = imfill(bw1,'holes');
     [Ax,Ay]=find(holes==1); 
     numPoints = length(Ax);
     [m,n] = size(holes);
     areaPer = (imgWid * imgLen) / (m * n);
     Area(i,1) = areaPer * numPoints;
     %pause(0.5);

     
 end
 
 
[Am,An]=size(Area);
C=reshape([Area';Area'], An, 2*Am)';
figure 
hold on;
plot((1:length(C))/10, C,'k-');
xlabel('Distance from glottis [cm]');ylabel('Area [c©O]');
axis([0 14 0 10]);
set(gca,'xtick',0:2:14,'ytick',0:2:10);

 
save Data\S14_LHa_Area Area;