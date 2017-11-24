function [ x,iter] = fSOR( A,b,maxit,w )

x=zeros(size(b));

[n,m]=size(A);
iter=maxit;

for i=1:maxit

    for j=1:n
%         if j==1
%             x(j)=(b(j)-A(j,1:j-1)*x(1:j-1)-A(j,j+1:n)*x(j+1:n))/A(j,j);
%         else
            x(j)=w*(b(j)-A(j,1:j-1)*x(1:j-1)-A(j,j+1:n)*x(j+1:n))/A(j,j)+(1-w)*x(j);
%         end
%         disp(x');
    end

%     if max(abs(A*x-b))<0
%         iter=i;
%     break;
    end

end