%Question no.1 (part 1)
% Inputs:
%       x0= initial value of x
%       y0= value of y at x0
%       xlast= final value of x
%       ylast= value of y at xlast
%       delx= step size delta x
%       maxit= maximum iterations


function [M]=boundaryvalue(xinit, yinit, xlast, ylast, deltax, iter)
n=((xlast-xinit)/deltax)+1;
A=zeros(n-1,n-1);
B=zeros(n-1,1);
x=zeros(n,1);
x(1)=x0;
for i=2:n
    x(i)=x(1)+(deltax*(i-1));
end
k=zeros(n,1);
for i=1:n
    k(i)=6*x(i)*(deltax)^2;
end
alpha=zeros(n,1);
for i=1:n
    alpha(i)=1+x(i)*deltax;
end
beta=zeros(n,1);
for i=1:n
    beta(i)= -(2+x(i)*deltax+3*(deltax)^2);
end
B(1)=k(1)-yinit;
B(n-1)=k(n-1)-alpha(n)*ylast;
for i=2:n-2
    B(i)=k(i);
end
A(1,1)=beta(1);
A(1,2)=alpha(1);
A(n-1,n-2)=1;
A(n-1,n-1)=beta(n-1);
for i=2:n-2
    A(i,i-1)=1;
    A(i,i)=beta(i);
    A(i,i+1)=alpha(i);
end
disp(A);
disp(B);
[y,j]=fgaussseidel(A,B,0,iter);
X=[yinit;y;ylast];

% disp(X);
figure;
plot(X);
title('Boundary value problem');
M=X;
dlmwrite('Boundary_value.txt', M,'delimiter','\t', 'newline', 'pc');
end