% function X = fjacobi(A,B,P)
% % X = fjacobi(A,B,P)
% % A is an nxn diagonally dominant matrix, input.
% % B is a nx1 vector, input.
% % P is an nX1 starting vector, input.
% d = diag(A);
% D = diag(d);
% X = D\(B - (A-D)*P);
% disp(X);
% end

function [ x,iter] = fjacobi( A,b,tol,maxit )
%jacobi iterations
%   

x=zeros(size(b));

[n,m]=size(A);
iter=maxit;

for i=1:maxit

    for j=1:n

        y(j)=(b(j)-A(j,1:j-1)*x(1:j-1)-A(j,j+1:n)*x(j+1:n))/A(j,j);

    end

    if max(abs(A*y'-b))<tol
        iter=i;
        break;
    end
    x=y';

end