clear all; clc; close all;

load Data\S8_midPoints;% midpoint
load Data\S5_glottis_struct;% a_lout A B c_point newx newy origin alpha;  %%change for rotate
%load data\glottis_lout;% a_lout u_lout A B c_point;

%% random selection point
l=size(midpoint,1);
midshu=[];
midshu=[midshu;midpoint(1,:)];
for i=2:l-140 % change 140 by test a6_midline5midline
    if rem(i,39)==0
        midshu=[midshu;midpoint(i,:)];
    end
end

m=size(a_lout,1);
figure(1);

%% got lip end
for i=1:m/2
   Y2=[a_lout(2*i-1,1) a_lout(2*i,1)];
   Z2=[a_lout(2*i-1,2) a_lout(2*i,2)];
   plot(Y2,Z2,'k');hold on;
end
hold off

[x,y]=ginput(2);
C=[x(1) y(1)];
D=[x(2) y(2)];

endone = [mean(x) mean(y)];
midshu=[midshu;endone];

save Data\S9_midPointsAdded midshu C D;
