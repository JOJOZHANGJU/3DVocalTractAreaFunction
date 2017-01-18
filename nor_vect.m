function n = nor_vect(A,B)
%caculate the original line
%   A B C:point in line
n=zeros(2);
a=[];
a=[A(1)-B(1) A(2)-B(2)];
r=rank(a);
y=null(a,'r');
n=y(:,1)';
end

