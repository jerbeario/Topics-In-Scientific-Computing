function [params, R2, A] = getparams(data, order)
C = linspecer(12);
x = data(1,:);
y = data(2, :);
n = length(x);
A = zeros(n, order+1);
for i=1:order+1
A(:,i) = x.^(order-i+1);   
end
params = A\y(:);
y1_hat = A*params;
[x1n, ind2n] = sort(x);
plot(x, y, '.', 'Color', C(randi(12), :)); hold on;
plot( x1n,y1_hat(ind2n), '-', 'LineWidth',4, 'Color','black'); hold off;
R2 = 100*(1-sum((y(:)-y1_hat(:)).^2)/sum((y(:)-mean(y(:))).^2));  