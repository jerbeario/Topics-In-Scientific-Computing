u = @(x, y) cos(pi*x)*y*(1-y);
xmax = 2;
ymax = 1;
tmax = 1;
kappa = 1;
k = 0.1;
y = diffusion(u,kappa,k,tmax, [xmax,ymax]);
