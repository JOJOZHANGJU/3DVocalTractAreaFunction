function chanum = xiecha(xielast,xiemid,interint)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
chanum=[];
n=floor(interint/2);
x1=xielast(1);y1=xielast(2);
x2=xiemid(1);y2=xiemid(2);
if abs(y1)>abs(x1)
    xx=(x2-x1)/interint;
    for i=1:n
    x=x1+xx*i*2;
    y=sqrt(1-x*x);
    chanum=[chanum;x y];
    end
elseif abs(y1)<abs(x1)
    if x1<0
        y1=-y1;
    end
    if x2<0
        y2=-y2;
    end
    yy=(y2-y1)/interint;
    for i=1:n
    y=y1+yy*i*2;
    x=sqrt(1-y*y);
    chanum=[chanum;x y];
    end
elseif abs(y1)==abs(x1)
    if abs(y2)>=abs(x2)
      xx=(x2-x1)/interint;
      for i=1:n
      x=x1+xx*i*2;
      y=sqrt(1-x*x);
      chanum=[chanum;x y];
      end
    else
      if x1<0
          y1=-y1;
      end
      if x2<0
          y2=-y2;
      end
      yy=(y2-y1)/interint;
      for i=1:n
      y=y1+yy*i*2;
      x=sqrt(1-y*y);
      chanum=[chanum;x y];
      end
    end
end
end

