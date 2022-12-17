u = @(x, y) cos(pi*x)*y*(1-y);
h = 0.005
t = 0:h:10;
kappa = 1;
k = 0.1;
y = diffusion(u,kappa,k,t, [1,2]);
size(y)

movie(y, 1, 1)