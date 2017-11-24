function [M]=nltemp(first,Tfirst,last,Tlast,Tinf,param,sigma,deltax,maxit)
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
% B=zeros(n-1,1);

Tinit=temperature(first,Tfirst,last,Tlast,Tinf,param,deltax,maxit);
B=beta-(sigma*deltax^2*(Tinf^4-Tinit.^4));
w=1.2;
[x,iter]=fSOR(A,B,maxit,w);
i=1;
while i<maxit
    B=beta-(sigma*deltax^2*(Tinf^4-x.^4));
    w=1.2;
    [x,iter]=fSOR(A,B,maxit,w);
    i=i+1;
end
   
% B(1)=beta-Tfirst;
% B(n-1)=beta-Tlast;
% for i=2:n-2
%     B(i)=beta;
% end
n1=size(x);
X=[Tfirst;x;Tlast];

% disp(X);
figure;
plot(X);
% M=X;
hold on;
end
