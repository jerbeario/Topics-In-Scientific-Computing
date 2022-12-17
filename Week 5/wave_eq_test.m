%initialization of variable 
xmax = 4;
ymax = 4;
tmax = 15;
c=1;
a = 1;
b = 1/2;
fps = 1000;

%inital functions
f = @(x, y) exp(-((x-xmax/2).^2+(y-ymax/2).^2));
g = @(x, y) 0;

f1 = @(x, y) sin(2*pi*(a*x +b*y));
g1 = @(x, y) -c*sqrt(a^2+b^2)*2*pi*cos(2*pi*(a*x +b*y));

%calling the wave-eq function
[u, v] = wave_eq(f, g, c, 4, 4,10, 0.0001, 0.2, fps);

%creating visualization 
create_movie(u,xmax, ymax, tmax);


