clear all; clc; close all;

load Data\S10_midLine;% vtMidLine;
load Data\S5_glottis_struct;%%%a_lout A B c_point newx newy origin alpha;
load Data\S4_glottisLine;%%%a_lout
load Data\S11_tangentLine;% qieline qiepoint enddis;
l=size(qiepoint,1);
loutt=zeros(l,3);
loutt(:,1)=qiepoint(:,1)+min(newx);
loutt(:,2)=qiepoint(:,2)+min(newy)-10;
[newx1,newy1,newz1]=rotate2(loutt,[0 0 1],0-alpha,origin);
r_qieline=zeros(l,2);
r_qieline(:,1)=newx1;
r_qieline(:,2)=newy1;

m=size(vtMidLine,1);
loutvt=zeros(m,3);
loutvt(:,1)=vtMidLine(:,1)+min(newx);
loutvt(:,2)=vtMidLine(:,2)+min(newy)-10;
[newx2,newy2,newz2]=rotate2(loutvt,[0 0 1],0-alpha,origin);
r_midline=zeros(m,2);
r_midline(:,1)=newx2;
r_midline(:,2)=newy2;


m=size(a_lout,1);
figure(1);

for j=1:m/2
   Y2=[a_lout(2*j-1,1) a_lout(2*j,1)];
   Z2=[a_lout(2*j-1,2) a_lout(2*j,2)];
   plot(Y2,Z2,'k');hold on;
end
   
   
for i=1:size(r_qieline,1)/2
     AA=r_qieline(2*i-1,:);
     BB=r_qieline(2*i,:);
     plot([AA(1) BB(1)],[AA(2) BB(2)],'k');hold on;
end

for i=1:size(r_midline,1)/2
     A=r_midline(2*i-1,:);
     B=r_midline(2*i,:);
     plot([A(1) B(1)],[A(2) B(2)],'b');hold on;
end

box off;
set (gcf,'Position',[200,200,526,500])
axis([0 200 0 200]); 
axis equal
set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')
hold off;

hold off;
h1=getframe;
hh=h1.cdata;
imwrite(hh,'Figures\S12_midLines.png');

qieline=r_qieline;
qiepoint=r_midline;
save Data\S12_tangentLineRotated qieline qiepoint enddis;


