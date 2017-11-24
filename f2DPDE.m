function [X]=f2DPDE(h,x0,x1)
%g

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
B(1)=fc(1,0)+fc(0,1);
for i=2:8
    B(i)=fc(0,i);
end
x=2;
B(9)=fc(0,9)+fc(1,10);
for i=10:9:64
    B(i)=fc(x,0);
    x=x+1;
end
x=2;
for i=18:9:72
    B(i)=fc(x,10);
    x=x+1;
end
B(73)= fc(9,0)+fc(10,1);
B(81)= fc(10,9)+fc(9,10);
x=2;
for i=74:80
    B(i)=fc(10,x);
    x=x+1;
end
% disp(B);
% dlmwrite('Bmatrix.txt', B,'delimiter','\t', 'newline', 'pc');
Y=cgs(A,B)
[X,iter] = fjacobi( A,B,0,70);
end