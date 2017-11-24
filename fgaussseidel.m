

function [ x,iter] = fgaussseidel( A,b,tol,maxit )
%jacobi iterations
%   

x=zeros(size(b));

[n,m]=size(A);
iter=maxit;

for i=1:maxit

    for j=1:n

        x(j)=(b(j)-A(j,1:j-1)*x(1:j-1)-A(j,j+1:n)*x(j+1:n))/A(j,j);

    end

    if max(abs(A*x-b))<tol
        iter=i;
    break;
    end
% for j=1:n
% 
%         y(j)=(b(j)-A(j,1:j-1)*x(1:j-1)-A(j,j+1:n)*x(j+1:n))/A(j,j);
% 
%     end
% 
%     if max(abs(A*y'-b))<tol
%         iter=i;
%         break;
%     end
%     x=y';

end