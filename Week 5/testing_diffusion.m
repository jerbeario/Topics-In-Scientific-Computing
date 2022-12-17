%initializing parameters anf function
u = @(x, y) cos(pi*x).*y.*(1-y);
xmax = 2;
ymax = 1;
tmax = 0.5;
kappa = 2;
k = 0.1;
fps = 1;

%calling the diffusion function 
y = diffusion(u,kappa,k,tmax, xmax, ymax, fps);

%creating movie
create_movie(y,xmax, ymax, tmax);