clear all
close all
% Differential Equation: x' = x(1-x/2)
function dx = f(t,x)
   dx = x*(1-x./2);
endfunction
% Exacte Solution: 2*e^t/(3+e^t)
function xexac =solexac(t)
xexac =  (2*exp(t))./(3+exp(t));
endfunction
x0=0.5;   %%Initial condition
T=10;            %% maximum time T
t=[0:0.1:T];              %% we choose the times t(k) where is calculated 'y'
sol=ode45(@f,[0,T],x0);   %% numerical solution of (E)
tt=sol.x;y=sol.y;         %% extraction of the results
clf;hold on  ;            %% plot the exact and numerical solutionss
plot(tt,y,'xr')
plot(t,solexac(t),'-b')
xlabel('t')
ylabel('x(t)')
title('Chemostat Model')
legend("Numerical Solution","Exacte Solution ")
