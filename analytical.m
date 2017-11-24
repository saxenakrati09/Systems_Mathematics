function [x]=analytic(xinit, xlast, deltax)
n=((xlast-xinit)/deltax)+1;
x=zeros(n,1);
x(1)=xinit^3;
x(n)=xlast^3;
for i=2:n-1
    x(i)=(xinit+(i-1)*deltax)^3;
end
figure;
plot(x);
title('analytical solution of y=x^3');
dlmwrite('analytic_solution.txt', x,'delimiter','\t', 'newline', 'pc');
end
