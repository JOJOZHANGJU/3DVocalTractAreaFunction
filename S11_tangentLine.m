clear all; clc; close all;
load Data\S10_midLine;% vtMidLine;
% load data\glottis_lout;%%a_lout u_lout A B c_point;
load Data\S5_glottis_struct; % a_lout A B c_point newx newy origin alpha;  %%change for rotate
load Data\S9_midPointsAdded;%%midshu C D;

%% calculate qie line
AB=[A;B];
meanAB=mean(AB);
meanCD=midshu(end,:);
xieone=xie(A,B);
xieend=xie(C,D);

xiedian=[];
xiedian=[xiedian;xieone];
qieline=[];
qieline=[qieline;meanAB;xieone];
enddis=0;
addinter=0;
interint=4; % change 4,5,6,7mm
inter=2; % change inter(interval) 2,1mm
jia=0;
for i=2:size(vtMidLine,1)-1
    aa0=vtMidLine(i-1,:);aa=vtMidLine(i,:);bb=vtMidLine(i+1,:);
    add=distance(aa,bb);addinter=addinter+add;
    if addinter>inter
        qieline=[qieline;aa;0 0];
        addinter=0;
        jia=jia+1;
        
        if jia==interint
          jia=0;
          n=nor_vect(aa0,bb);
          crosspoint=[aa;aa(1)+n(1) aa(2)+n(2)];
          xiemid=xie(crosspoint(1,:),crosspoint(2,:));
          xielast=xiedian(end,:);
          xiedian=[xiedian;xiemid];
          
          chanum = xiecha(xielast,xiemid,interint*2);
          for j=0:interint-1
            qieline(end-j*2,:)=chanum(end-j,:);
          end
        end
     end
end

interadd=round(addinter);
if jia==0
else    
    add=jia*2+interadd;
    xielast=xiedian(end,:);
    chanum = xiecha(xielast,xieend,add);
    for j=0:jia-1
        qieline(end-j*2,:)=chanum(end-j,:);
    end
end

if interadd==0
    qieline(end-1,:)=meanCD;
    qieline(end,:)=xieend;
    enddis=2;
elseif interadd==1
    qieline=[qieline;meanCD;xieend];
    enddis=1;
else
    qieline=[qieline;meanCD;xieend];
    enddis=2;
end

%% plant qie line
figure(1);
for i=1:size(a_lout,1)/2
   Y2=[a_lout(2*i-1,1) a_lout(2*i,1)];
   Z2=[a_lout(2*i-1,2) a_lout(2*i,2)];
   plot(Y2,Z2,'k');hold on;
end

dis=35;
qiepoint=[];
for i=1:size(qieline,1)/2
     Y2=qieline(2*i-1,:);
     Z2=qieline(2*i,:);
     [AA,BB]=linebc(Y2,Z2,dis);
     qiepoint=[qiepoint;AA;BB];
     plot([AA(1) BB(1)],[AA(2) BB(2)],'k');hold on;
end

m=size(midshu,1);
for j=1:m
   plot(midshu(j,1),midshu(j,2),'r.','markersize',3);hold on;
end

p=size(vtMidLine,1);
for j=1:p
   plot(vtMidLine(j,1),vtMidLine(j,2),'b.','markersize',2);hold on;
end

box off;
set (gcf,'Position',[200,200,526,500])
axis([0 200 0 200]); % change axis for female:140 for male:200
axis equal
set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')
hold off;
h1=getframe;
hh=h1.cdata;
imwrite(hh,'Figures\S11_tangentLine.png');
save Data\S11_tangentLine qieline qiepoint enddis;



