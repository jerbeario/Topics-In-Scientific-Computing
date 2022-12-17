function [t, y2] = euler2(f, t, x0)
n = length(t);
h = t(2)-t(1);
y = zeros(length(x0), n);
y(:, 1) = x0;
y2 = zeros(length(x0), n);
y2(:, 1) = x0;
for i=1:n
    y(:, i+1) = y(:, i) + h*f(t(1, i), y(:, i));
    y2(:, i+1) = y2(:, i) + h*1/2*(f(t(1, i), y2(:, i))+f(t(1, i), y(:, i)));
end