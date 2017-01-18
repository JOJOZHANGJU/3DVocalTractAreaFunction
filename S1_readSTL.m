clear all; clc; close all;

stlPath = 'STL\Examples\LH_a3.stl'; %Load path of .STL file

[fout, vout, cout] = ReadSTLACSII(stlPath); %read .STL file in vount

save Data\S1_STL vout;

