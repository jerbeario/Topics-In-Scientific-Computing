function u = diffusion(f,kappa, k, tmax, xmax, ymax, fps)
%initializing variables 
h = (k^2)/10;       %making sure h is sufficiently small
n = round(tmax/h); %number of time steps
mx = xmax/k; my = ymax/k;
u = NaN(mx, my, n);  % initializing output vector    

%creating initial t=0 step using initial function f 
y=1:my; %making y vector then looping over x vector to initialize t=0 slice 
for ix=1:mx
        u(ix,:, 1)=f(ix*k,y*k);
      
end

%euler scheme
for t=1:n
    u(:, :, t+1) = u(:, :,t ) + h*kappa*fast_laplacian(u(:, :, t), k);
end


%outputting every fps steps 
 u = u(:, :, 1:round(fps):n);
