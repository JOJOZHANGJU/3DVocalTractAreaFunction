clear all;clc;close all;

load Data\S1_STL;

%Translate the 3D vocal tract to make sure all axis values are greater than 0
vout(:,1) = vout(:,1) - min(vout(:,1));
vout(:,2) = vout(:,2) - min(vout(:,2));
vout(:,3) = vout(:,3) - min(vout(:,3));

save Data\S2_norSTL vout


