function [ AA,BB] = linebc(A,xie,dis)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
x1=A(1);x2=xie(1);
y1=A(2);y2=xie(2);
if x2==0
    AA=[A(1) A(2)+dis];
    BB=[A(1) A(2)-dis];
elseif y2==0
    AA=[A(1)+dis A(2)];
    BB=[A(1)-dis A(2)];
else
    cc=sqrt(x2*x2+y2*y2);
    t=dis/cc;
    AA=[A(1)+t*x2 A(2)+t*y2];
    BB=[A(1)-t*x2 A(2)-t*y2];
end
end

