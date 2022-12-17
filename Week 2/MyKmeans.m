function [centers_final,IDX, variance] = MyKmeans(data, k)
%initializing variables 
tol = 0.01;    
maxiter = 1000; %number of different random centers to try

%seperating data
x = data(:, 1);      %X data
y = data(:, 2);      %Y data


%getting size of the dataset
xmax = round(max(x), 3);
xmin = round(min(x), 3);
ymax = round(max(y), 3);
ymin = round(min(y), 3);


%initializing matrixes and cells
variance = zeros(k, 1);   %store the variances of each cluster  
prev_centers = zeros(k, 2);     %store the previous iteration of centers
allvar = zeros(maxiter, 1);        %store all variances for different starting centers 
randcenters = cell(maxiter, 1);    %store all random starting centers
finalcenters_idx = cell(maxiter, 2);   %store all cluster centers 


% creating random centers and looping over the kmeans algorithm maxiter
% times and calculating the sum of variances for each cluster 

for i=1:maxiter
    randcenters{i, 1} = [abs(xmax-xmin).*rand(k, 1)-abs(xmin) abs(ymax-ymin).*rand(k, 1)-abs(ymin)];
    centers = randcenters{i, 1};
    
    %this is the heart of the algorithm: it returns each center of cluster as
    %the center of gravity of all the points in that cluster and repeats until
    %the centers have stabilized 
    while sum(abs(prev_centers-centers))>tol %condition to loop
        prev_centers = centers;
        D = square_distance(data, centers); %gets the distant of all sets of points to each cluster center 
        [~, ind] = min(D, [], 2);       %returns the index of the smallest distant to a cluster for each data point
        for j=1:k       %updates the center position 
            centers(j, 1) = sum(x(ind==j))/length(x(ind==j));
            centers(j, 2) = sum(y(ind==j))/length(y(ind==j));
        end
    
    end
    finalcenters_idx{i, 1} = centers;   %stores the final centers in a cell array 
    finalcenters_idx{i, 2} = ind;
    
    %this chunck calculates the total variance for a set of centers
    for p=1:k
        if ~isempty(x(ind==p)) && ~isempty(y(ind==p)) %condition to make sure the cluster has at least one point in it 
            variance(p, 1) = var(x(ind==p))+ var(y(ind==p));
        end
    end
    
    allvar(i, 1) = sum(variance);       %adds the sum of variances to a matrix that stores the variances of all center combination tried
end

%finnaly search through the variance matrix and find the centers with the
%lowest variance 
[variance, ind] = min(sum(allvar, 2));
centers_final = finalcenters_idx{ind, 1}; %output the best centers
IDX = finalcenters_idx{ind, 2};
end
