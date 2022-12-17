function [u, v] = brusselator(a, b, xmax, ymax, tmax, h, k, kappa_u, kappa_v, fps)
%initializing variables and matrices 
n = round(tmax/h); %number of time steps
spread = 15; %the spread of random perturbations
mx = xmax/k;
my = ymax/k;
u = NaN(mx, my, n);
v = NaN(mx, my, n);

%creating initial functions
f = @(u, v) a + u.^2.*v-b.*u-u;
g = @(u, v) b.*u-u.^2.*v;

%initializing  
for ix=1:mx
    for iy=1:my
        u(ix,iy, 1)=a+spread*rand()-spread/2;
        v(ix, iy, 1)=b/a+spread*rand()-spread/2;
    end
end

%euler scheme
for t=1:n
    u(:, :, t+1) = u(:, :,t ) + h.*(kappa_u.*fast_laplacian(u(:, :, t), k)+f(u(:, :, t), v(:, :, t)));
    v(:, :, t+1) = v(:, :,t ) + h.*(kappa_v.*fast_laplacian(v(:, :, t), k)+g(u(:, :, t), v(:, :, t))); 
end

%outputting every fps steps 
 u = u(:, :, 1:round(fps):n);
 v = v(:, :, 1:round(fps):n);
