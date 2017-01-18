function P = cross_point( A,B,n,V )
%caculate the cross point of line AB and plant
%   n:normal vector
%   V:point in plant
C=B-A;
P=zeros(3);
fm=n(1)*C(1)+n(2)*C(2)+n(3)*C(3);
if fm~=0
    fz=n(1)*(V(1)-A(1))+n(2)*(V(2)-A(2))+n(3)*(V(3)-A(3));
    t=fz/fm;
    x=A(1)+C(1)*t;
    y=A(2)+C(2)*t;
    z=A(3)+C(3)*t;
    P=[x y z];
end

end

