function [t, y] = heun(f, t, x0)
%submit this
n = length(t);
h = t(2)-t(1);
k1 = zeros(length(x0), n);
k2 = zeros(length(x0), n);
k3 = zeros(length(x0), n);
y = zeros(length(x0), n);
y(:, 1) = x0;

for i=1:n-1
    k1(:, i) = h*f(t(i), y(:, i));
    k2(:, i) = h*f(t(i)+1/3*h, y(:, i)+1/3*k1(:, i));
    k3(:, i) = h*f(t(i)+2/3*h, y(:, i)+2/3*k2(:, i));
    y(:, i+1) = y(:, i) + 1/4*k1(:, i)+3/4*k3(:,i);
end
