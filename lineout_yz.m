function lout = lineout_yz(vout,A,B,x)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
lout = [];
nn = nor_vect(A,B);
n = [0 nn];
V = [x A];
l=size(vout,1)/3;
for i=1:l
y1=vout(3*i-2,2);z1=vout(3*i-2,3);
y2=vout(3*i-1,2);z2=vout(3*i-1,3);
y3=vout(3*i,2);z3=vout(3*i,3);
M=vout(3*i-2,:);
N=vout(3*i-1,:);
H=vout(3*i,:);

C=nn(1)*A(1)+nn(2)*A(2);
z11=0;z22=0;z33=0;
   if nn(2)==0
       z11=A(2);z22=A(2);z33=A(2);
   else
       z11=(C-nn(1)*y1)/nn(2);
       z22=(C-nn(1)*y2)/nn(2);
       z33=(C-nn(1)*y3)/nn(2);
   end
   
if (z1<z11&&z2<z22&&z3<z33)||(z1>z11&&z2>z22&&z3>z33)
elseif z1==z11
    if (z2>z22&&z3<z33)||(z2<z22&&z3>z33)
        P = cross_point(N,H,n,V);
        lout=[lout;M;P];
    elseif z2==z22&&z3~=z33
        lout=[lout;M;N];
    elseif z2~=z22&&z3==z33
        lout=[lout;M;H];
    elseif z2==z22&&z3==z33
        lout=[lout;M;N];
        lout=[lout;N;H];
        lout=[lout;M;H];
    else
    end
elseif z2==z22
    if (z1>z11&&z3<z33)||(z1<z11&&z3>z33)
        P = cross_point(M,H,n,V);
        lout=[lout;N;P];
    elseif z1~=z11&&z3==z33
        lout=[lout;N;H];
    else
    end
elseif z3==z33
    if (z1>z11&&z2<z22)||(z1<z11&&z2>z22)
        P = cross_point(M,N,n,V);
        lout=[lout;H;P];
    else
    end
elseif (z1>z11&&z2<z22&&z3<z33)||(z1<z11&&z2>z22&&z3>z33)
    P1 = cross_point(M,N,n,V);
    P2 = cross_point(M,H,n,V);
    lout=[lout;P1;P2];
elseif (z2>z22&&z1<z11&&z3<z33)||(z2<z22&&z1>z11&&z3>z33)
    P1 = cross_point(M,N,n,V);
    P2 = cross_point(N,H,n,V);
    lout=[lout;P1;P2];
elseif (z3>z33&&z1<z11&&z2<z22)||(z3<z33&&z1>z11&&z2>z22)
    P1 = cross_point(M,H,n,V);
    P2 = cross_point(N,H,n,V);
    lout=[lout;P1;P2];
else
end
end


end

