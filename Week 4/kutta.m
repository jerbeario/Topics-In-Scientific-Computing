function [t, y] = kutta(f, t, x0)

n = length(t);
h = t(2)-t(1);
y = zeros(length(x0), n);
k1 = y;
k2 = y;
k3 = y;
y(:, 1) = x0;
for i=1:n-1
    k1(:, i) = h*f(t(1, i), y(:, i));
    k2(:, i) = h*f(t(1, i)+1/2*h, y(:, i)+1/2*k1(:, i));
    k3(:, i) = h*f(t(1, i)+h, y(:, i)-k1(:, i)+2*k2(:, i));
    y(:, i+1) = y(:, i) + 1/6*(k1(:, i)+4*k2(:,i)+k3(:, i));
end
