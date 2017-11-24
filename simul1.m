function xprime=simul1(t,x)
c=0.5;
k=1.2;
%k=[0.8, 0.9, 1.0, 1.1, 1.2, 1.3];
omega=0.666667;
%xprime='D2x+c*Dx+sin(x)=k*cos(omega*t)';
xprime= [x(2); -c*x(2)-sin(x(1))+k*cos(omega*t)];
end