function D = square_distance(data, centers)
n = length(data);
k = length(centers);
D = zeros(n,k);
for i=1:k
    D(:, i) = sum((data-centers(i,:)).^2, 2); 
end 
end
