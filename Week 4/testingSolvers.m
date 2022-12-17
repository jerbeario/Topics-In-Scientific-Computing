%testing ode solvers by comparing them to exponential function
f = @(t, y) -y;
t = 0:0.01:1;
[t, y]=ode45(f, t, 1);
[t1, y1] = heun(f, t, 1);
plot(t,  y, '--r', t1, y1, 'xb')
legend('ode45 solver', 'heun method')