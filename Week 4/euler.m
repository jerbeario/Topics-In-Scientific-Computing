function [t, y] = euler(f, t, x0)
n = length(t);
h = t(2)-t(1);
y = zeros(length(x0), n);
y(:, 1) = x0;
for i=1:n-1
   
    y(:, i+1) = y(:, i) + h*f(t(i), y(:, i));

end



