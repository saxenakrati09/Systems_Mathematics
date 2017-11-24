function [M]=temperature(first,Tfirst,last,Tlast,Tinf,param,deltax,maxit)
n=(last-first)/deltax;
beta=-(param*Tinf*(deltax^2));
alpha=2+param*(deltax^2);
A=zeros(n-1,n-1);
A(1,1)=-alpha;
A(1,2)=1;
A(n-1,n-2)=1;
A(n-1,n-1)=-alpha;
for i=2:n-2
    A(i,i-1)=1;
    A(i,i)=-alpha;
    A(i,i+1)=1;
end
B=zeros(n-1,1);
B(1)=beta-Tfirst;
B(n-1)=beta-Tlast;
for i=2:n-2
    B(i)=beta;
end
[x,iter]=fgaussseidel(A,B,0,maxit);
n1=size(x);
X=[Tfirst;x;Tlast];
% disp(X);
% figure;
% plot(X);
M=X;
end



