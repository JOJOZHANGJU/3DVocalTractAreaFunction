clear all; clc; close all;

load Data\S2_norSTL;
load Data\S12_tangentLineRotated;% qieline qiepoint enddis;
% load data\qieline;% qieline qiepoint enddis;

%% cut cross-sectional plane
qie=qieline;
maxx=max(vout(:,1));
maxy=max(vout(:,2));
maxz=max(vout(:,3));

ll=size(qie,1);

for jj=1:ll/2 % change number2:49(for oral) by run and chose

A=qie(2*jj-1,:);B=qie(2*jj,:);
lout_xy=lineout_yz(vout,A,B,maxx/2);

l=size(lout_xy,1)/2;

[orign,alpha]=rotate1(A,B,maxy);   
[newx,newy,newz]=rotate2(lout_xy,[1,0,0],alpha,orign);

newxnor=newx-min(newx)+10;
newynor=newy-min(newy)+10;

figure(jj);
box off;
set (gcf,'Position',[200,200,526,500])

for i=1:l 
   X=[newxnor(2*i-1) newxnor(2*i)]; 
   Y=[newynor(2*i-1) newynor(2*i)];
%    Z=[newz(2*i-1) newz(2*i)];
   plot(X,Y,'k','linewidth',1);hold on;
%     plot(X,Y,'-');hold on;
end

axis([0 100 -50 150]); % change for female:100 for male:120
axis equal
set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')

h1=getframe;
hh=h1.cdata;
imwrite(hh,['Cross-section\qie_', num2str(jj),'.png']);
end

close all;







