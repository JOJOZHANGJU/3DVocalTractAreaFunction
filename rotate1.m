function [orign,alpha] = rotate1(A,B,maxy)
%AB:point in qie xian, slope plant to plan plant  aix=(1,0,0) for X aix
%   Detailed explanation goes here
line=nor_vect(A,B);
a=abs(A(1)-B(1));
b=abs(A(2)-B(2));
c=sqrt(a*a+b*b);
C=line(1)*A(1)+line(2)*A(2);%  C：负的常数项
orign=zeros(3);
alpha=0;
if (A(1)-B(1))*(A(2)-B(2))>0
    orign=[0 0 C/line(2)];
    cosb=a/c;
    alpha=0-acosd(cosb);%%%jiao du  右手准则，注意正负
  % alpha=acos(cosb);%%%hu du
elseif (A(1)-B(1))*(A(2)-B(2))<0
    orign=[0 maxy (C-maxy*line(1))/line(2)];
    cosb=a/c;
    alpha = acosd(cosb);%%%jiao du   右手准则，注意正负
elseif A(1)==B(1)
    orign=[0 A(1) 0];
    alpha=90;
elseif A(2)==B(2)
     orign=[0 0 A(2)];
     alpha=0;
else
end
end

