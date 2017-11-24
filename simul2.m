x0=[0,0];
%k=[0.8, 0.9, 1.0, 1.1, 1.2, 1.24];
k=1.2;
tspan=[0,20];
hold on
for k= 0.8:0.1:1.3
    [t,x]=ode45(@simul1,tspan,x0,k);
    
    plot(x(:,1),x(:,2));
end
