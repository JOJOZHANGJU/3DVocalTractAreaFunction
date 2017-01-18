clear all; clc; close all;

load Data\S2_norSTL;

lout = lineout_x(vout,max(vout(:,1))/2);

save Data\S3_midSagPlane lout;


