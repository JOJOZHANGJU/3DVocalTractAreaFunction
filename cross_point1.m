function P = cross_point1(A,n,C,D)
%caculate cross point of two lines  A(1,1) n->
%   A n and CD
x=0;
y=0;
a1=A(1);b1=A(2);
aa=n(1);bb=n(2);

c1=C(1);d1=C(2);
c2=D(1);d2=D(2);

cc=c2-c1;
dd=d2-d1;
if bb==0&&dd~=0
    y=b1;
    x=c1+cc*(y-d1)/dd;
elseif bb~=0&&dd==0
    y=d1;
    x=a1+aa*(y-b1)/bb;
elseif bb==0&&dd==0%%%%%同斜率，返回C点
%   printf('bb=0&&dd=0');
    x=c1;y=d1;
else
fm=(aa/bb)-(cc/dd);
fz=aa*b1/bb-cc*d1/dd+c1-a1;
y=fz/fm;
x=a1+aa*(y-b1)/bb;
end
P=[x y];

end

