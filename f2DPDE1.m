function [X]=f2DPDE1(h,x0,x1)
%g
f(q,w)=8*(q^2)*(w^2);
%A
z=((x1-x0)/h);
disp(z);
n=(z-1)^2;
% disp(n);
A=zeros(n,n);
A(1,1)=4;
A(1,2)=-1;
A(1,z)=-1;

for i=2:z-1
    A(i,i)=4;
    A(i,i+1)=-1;
    A(i,i-1)=-1;
    A(i,i+(z-1))=-1;
end    
for i=z:n-z+1
    A(i,i)=4;
    A(i,i+1)=-1;
    A(i,i-1)=-1;
    A(i,i+(z-1))=-1;
    A(i,i-(z-1))=-1;
end
for i=n-z+2:n-1
    A(i,i)=4;
    A(i,i-1)=-1;
    A(i,i+1)=-1;
    A(i,i-(z-1))=-1;
end
A(n,n)=4;
A(n,n-1)=-1;
A(n,n-z+1)=-1;
% disp(A);

%g
B=zeros(n,1);
B(1)=fg(1,0)+fg(0,1)+(h^2 * f(1,1));
for i=2:8
    B(i)=fg(0,i)+ (h^2 * f(1,i));
end
x=2;
B(9)=fg(0,9)+fg(1,10)+(h^2 * f(1,9));
for i=10:9:64
    B(i)=fg(x,0)+(h^2 * f(x,1));
    x=x+1;
end
x=2;
for i=18:9:72
    B(i)=fg(x,10)+(h^2 * f(x,9));
    x=x+1;
end
B(73)= fg(9,0)+fg(10,1)+(h^2 * f(9,1));
B(81)= fg(10,9)+fg(9,10)+(h^2 * f(9,9));
x=2;
for i=74:80
    B(i)=fg(10,x)+(h^2 * f(10,x));
    x=x+1;
end
% disp(B);
% dlmwrite('Bmatrix.txt', B,'delimiter','\t', 'newline', 'pc');
Y=cgs(A,B)
[X,iter] = fjacobi( A,B,0,70);
end