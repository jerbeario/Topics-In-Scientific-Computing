function [u, v] = wave_eq(f, g, c,  xmax, ymax, tmax, h, k, fps)

n = round(tmax/h); %integer number of time steps 
mx=xmax/k; my=ymax/k;   %x and y number of samples 
u = NaN(mx, my, n); v = NaN(mx, my, n);     %initialize empty NaN matrices 

%vectorize this for all three
y=1:my; %making y vector then looping over x vector to initialize t=0 slice 
for ix=1:mx
        u(ix,:, 1)=f(ix*k,y*k);
        v(ix, :, 1)=g(ix*k,y*k);
end

%euler scheme looping over all time steps
for t=1:n
    u(:, :, t+1) = u(:, :,t ) + h.*v(:, :,t );
    v(:, :, t+1) = v(:, :,t ) + c^2.*h.*fast_laplacian(u(:, :, t), k);
    
end
%only outputing evry fps step to save memory
 u = u(:, :, 1:fps:n);
 v = v(:, :, 1:fps:n);
