clear all; clc; close all;

load Data\S3_midSagPlane;%lout
%% paint outline
l=size(lout,1)/2;
Y=[];
Z=[];
figure(1);
for i=1:l 
   Y=[lout(2*i-1,2) lout(2*i,2)];
   Z=[lout(2*i-1,3) lout(2*i,3)];
   plot(Y,Z,'k');hold on;
end
hold off;

%% get glottis line
[x,y]=ginput(2);
A=[x(1) y(1)];
B=[x(2) y(2)];

a_lout=lout(:,2:3); %lout_yz:x=max_x/2, only keep y&z
[c_point,u_lout] = ifcross(a_lout,A,B); % c_point:cross point in glottis line u_lout:up glottis outline 

%% paint outline with red glottis line
l2=size(a_lout,1)/2;
Y2=[];
Z2=[];
figure(2);
for i=1:l2
   Y2=[a_lout(2*i-1,1) a_lout(2*i,1)];
   Z2=[a_lout(2*i-1,2) a_lout(2*i,2)];
   plot(Y2,Z2,'k');hold on;
end
plot([c_point(1,1) c_point(2,1)],[c_point(1,2) c_point(2,2)],'r');
hold off;

save Data\S4_glottisLine a_lout u_lout A B c_point;







