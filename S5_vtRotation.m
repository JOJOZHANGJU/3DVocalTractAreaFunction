clear all; clc; close all;

load Data\S4_glottisLine;%%%a_lout u_lout A B c_point;
%% paint normalization outline with red glottis line
m=size(a_lout,1)/2;
figure(1);

for j=1:m
   Y2=[a_lout(2*j-1,1) a_lout(2*j,1)];
   Z2=[a_lout(2*j-1,2) a_lout(2*j,2)];
   plot(Y2,Z2,'k');hold on;
end

box off;
set (gcf,'Position',[200,200,526,500])
axis([0 200 0 200]);%%change for female:140    for male:200
axis equal
set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')
hold off;
h1=getframe;
hh=h1.cdata;
imwrite(hh,'Figures\S5_origional_mid-sagittal.png');

lout=[u_lout;c_point(1:2,:);A;B];
m=size(lout,1);
loutt=zeros(m,3);
loutt(:,1)=lout(:,1);
loutt(:,2)=lout(:,2);
[origin,alpha] = rotatex(A,B,140);
[newx,newy,newz]=rotate2(loutt,[0 0 1],alpha,origin);
a_loutt = zeros(m,2);
a_loutt(:,1)=newx-min(newx);
a_loutt(:,2)=newy-min(newy)+10;


ll=size(a_loutt,1);
figure(2);

for j=1:ll/2-2
   Y2=[a_loutt(2*j-1,1) a_loutt(2*j,1)];
   Z2=[a_loutt(2*j-1,2) a_loutt(2*j,2)];
   plot(Y2,Z2,'k');hold on;
end
   c_pointn=a_loutt(end-3:end-2,:);
   Aa=a_loutt(end-1,:);Bb=a_loutt(end,:);
   plot(c_pointn(:,1),c_pointn(:,2),'r');hold on;
   
box off;
set (gcf,'Position',[200,200,526,500])
axis([0 200 0 200]);%%change for female:140 for male:200
axis equal
set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')
hold off;
h2=getframe;
hh2=h2.cdata;
imwrite(hh2,'Figures\S5_rotated_mids-sagittal.png');
a_lout=a_loutt(1:end-4,:);
A=Aa;B=Bb;c_point=c_pointn;
save Data\S5_glottis_struct a_lout A B c_point newx newy origin alpha;
