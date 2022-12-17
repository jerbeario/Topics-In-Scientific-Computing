%initialization 
xmax = 20;
ymax = 20;
tmax = 5;
kappa_u =2;
kappa_v = 10;
h = 0.001;
k = 0.2;
a = 4;
b = 12;
fps  = 50;

 
%calling the function 
[u, v] = brusselator(a, b, xmax, ymax, tmax, h, k, kappa_u, kappa_v, fps);
create_movie(u,xmax, ymax, tmax);


%the bigge the ratio of kappav/kappau = more smaller the dots 8/0.2