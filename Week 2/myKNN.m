function [label, C] = myKNN(data, test_points)
k = 3;  %number of nearest neighbors 
K = 6;  %number of clusters

%getting cluster centers 
[~, C, ~] = MyKmeans(data,K); 

% Compute distance between  test point and each training observation using square_dist
dist = square_distance(data(:, 1:2), test_points);

% compute the K nearest neighbors of z
[~, ind] = mink(dist, k, 1);
label = transpose(mode(C(ind), 1));

end
