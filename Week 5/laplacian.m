function Lu = laplacian(u,k)
%getting variables
[mx, my] =size(u);
Lu = NaN(mx, my);       %initializing matrix 
px=@(i)mod(i-1,mx)+1;      %creating periodic boundaries 
py=@(i)mod(i-1,my)+1;

%implementing discrete laplacian  
for ix=1:mx
    for iy=1:my
        Lu(ix, iy) = (u(px(ix+1), iy)+u(px(ix-1), iy)+u(ix, py(iy+1))+u(ix, py(iy-1)) - 4*u(ix, iy))/k^2;
    end
end
