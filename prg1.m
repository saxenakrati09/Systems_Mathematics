dx/dt = -sig x+ sig y ; dy/dt = rho x –y –xz; dz/dt = -beta z+xy; a; 
sig =10; beta = 8/3; rho =28 and x(0) =-8; y(0)=8; z(0) =27;
function xprime = lorenz(t,x);sig =10; beta = 8/3; rho = 28;
sig =10; beta = 8/3; rho = 28;
xprime = [ -sig * x(1)+ sig * x(2); rho * x(1)-x(2)-x(1)*x(3); -beta * 
x(3)+x(1)*x(2)];