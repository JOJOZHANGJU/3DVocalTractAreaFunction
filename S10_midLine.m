clear all; clc; close all;

load Data\S5_glottis_struct; % a_lout A B c_point newx newy origin alpha;  %%change for rotate
%load data\glottis_lout;% a_lout u_lout A B c_point;
load Data\S9_midPointsAdded;%midshu C D;

%% calculate midline
ll=size(midshu,1);
n = 1:ll;
nn = 1:0.002:ll;
pp = spline(n, midshu', nn);
vtMidLine = [pp(1,:)' pp(2,:)']; 

l=size(a_lout,1);

figure(1);
box off;
set (gcf,'Position',[200,200,526,500])
for i=1:l/2
   Y2=[a_lout(2*i-1,1) a_lout(2*i,1)];
   Z2=[a_lout(2*i-1,2) a_lout(2*i,2)];
   plot(Y2,Z2,'k');hold on;
end
plot([C(1) D(1)],[C(2) D(2)],'k');hold on;
plot(c_point(:,1),c_point(:,2),'k');hold on;

m=size(midshu,1);
for j=1:m
   plot(midshu(j,1),midshu(j,2),'r.','markersize',5);hold on;
end

ll=size(vtMidLine,1);
for j=1:ll
   plot(vtMidLine(j,1),vtMidLine(j,2),'b.','markersize',1);hold on;
end
axis([0 200 0 200]);%%change for female:140 for male:200
axis equal
set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')

hold off;

save Data\S10_midLine vtMidLine;





