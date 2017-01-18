function xieab = xie(A,B)
%UNTITLED13 Summary of this function goes here
%   ÇóÐ±ÂÊ
if A(1)==B(1)
   x=0;y=1;
elseif A(2)==B(2)
    x=1;y=0;
else
    xx=B(1)-A(1);yy=B(2)-A(2);
    if yy<0
        xx=-xx;yy=-yy;
    end
    t=1/sqrt(xx*xx+yy*yy);
    x=xx*t;
    y=yy*t;
end

xieab=[x y];
end

