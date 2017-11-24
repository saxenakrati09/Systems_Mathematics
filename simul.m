function xprime=simul(t,x)
c=3;
a=0.2;
xprime=[-x(2)-x(3); x(1)+a*x(2); a+x(3)*(x(1)-c)];
end