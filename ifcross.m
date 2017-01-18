function [cross_point,up_line] = ifcross(lout,A,B)
%UNTITLED20 Summary of this function goes here
%   Detailed explanation goes here
l=size(lout,1)/2;
cross_point=[];
up_line=[];
for i=1:l
    M=lout(2*i-1,:);N=lout(2*i,:);
    x1=lout(2*i-1,1);y1=lout(2*i-1,2);
    x2=lout(2*i,1);y2=lout(2*i,2);
    
    line=nor_vect(A,B);
    n=[A(1)-B(1) A(2)-B(2)];
    C=line(1)*A(1)+line(2)*A(2);
    y11=0;y22=0;
    if line(2)==0
        y11=A(2);y22=A(2);
    else
        y11=(C-line(1)*x1)/line(2);
        y22=(C-line(1)*x2)/line(2);
    end
    
    if y1>y11&&y2>y22
        up_line=[up_line;M;N];
    elseif y1>y11&&y2==y22
        up_line=[up_line;M;N];
        cross_point=[cross_point;N];
    elseif y1>y11&&y2<y22
        P=cross_point1(A,n,M,N);%%%%%%
        up_line=[up_line;M;P];
        cross_point=[cross_point;P];
    elseif y1<y11&&y2>y22
        P=cross_point1(A,n,M,N);%%%%%%
        up_line=[up_line;N;P];
        cross_point=[cross_point;P];
        
    elseif y1<y11&&y2==y22
    elseif y1<y11&&y2<y22
    elseif y1==y11&&y2<y22
        
    elseif y1==y11&&y2>y11
        up_line=[up_line;N;M];
        cross_point=[cross_point;M];
    elseif y1==y11&&y2==y11
        cross_point=[cross_point;M:N];
    end
    
end

