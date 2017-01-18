function lout = lineout_x(vout,x)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
lout=[];
n = [1 0 0];
V = [x 0 0];
l=size(vout,1)/3;
% l=length(vout(:,1))/3;
for i=1:l
    x1=vout(3*i-2,1);
    x2=vout(3*i-1,1);
    x3=vout(3*i,1);
    A=vout(3*i-2,:);
    B=vout(3*i-1,:);
    C=vout(3*i,:);
    if (x1<x&&x2<x&&x3<x)||(x1>x&&x2>x&&x3>x)
    elseif x1==x
        if (x2>x&&x3<x)||(x2<x&&x3>x)
            P = cross_point(B,C,n,V);
            lout=[lout;A;P];
        elseif x2==x&&x3~=x
            lout=[lout;A;B];
        elseif x2~=x&&x3==x
            lout=[lout;A;C];
        elseif x2==x&&x3==x
            lout=[lout;A;B];
            lout=[lout;A;C];
            lout=[lout;B;C];
        else
            fprintf('x1');
        end
    elseif x2==x
        if (x1>x&&x3<x)||(x1<x&&x3>x)
            P = cross_point(A,C,n,V);
            lout=[lout;B;P];
        elseif x1~=x&&x3==x
            lout=[lout;B;C];
        else
            fprintf('x2');
        end
    elseif x3==x
        if (x1>x&&x2<x)||(x1<x&&x2>x)
            P = cross_point(A,B,n,V);
            lout=[lout;C;P];
        else
            fprintf('x3');
        end
    elseif (x1>x&&x2<x&&x3<x)||(x1<x&&x2>x&&x3>x)
        P1 = cross_point(A,B,n,V);
        P2 = cross_point(A,C,n,V);
        lout=[lout;P1;P2];
    elseif (x2>x&&x1<x&&x3<x)||(x2<x&&x1>x&&x3>x)
        P1 = cross_point(A,B,n,V);
        P2 = cross_point(B,C,n,V);
        lout=[lout;P1;P2];
    elseif (x3>x&&x1<x&&x2<x)||(x3<x&&x1>x&&x2>x)
        P1 = cross_point(A,C,n,V);
        P2 = cross_point(B,C,n,V);
        lout=[lout;P1;P2];
    else
        fprintf('x');
    end
end

end

