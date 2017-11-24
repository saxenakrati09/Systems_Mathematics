function fbxy= fc(x,y)
% 0 for x=0
% y for x=1
%(x-1)sinx for y=0
% x(2-x) for y=1
x0=0;
x1=10;
if x==x0
    fbxy=0;
end
if x==x1
    fbxy=y;
end
if y==x0
    fbxy= (x-1)*sin(x);
end
if y==x1
    fbxy= x*(2-x);
end
end

