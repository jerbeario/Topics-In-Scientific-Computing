function [centers, variance] = bestkmean(data, k)
maxi = 500;
%loading data
x = data(:, 1);
y = data(:, 2);

%getting size of the dataset
xmax = round(max(x), 3);
xmin = round(min(x), 3);
ymax = round(max(y), 3);
ymin = round(min(y), 3);

%initializing variance and centers matrix
allvar = zeros(k, maxi);
randcenters = cell(maxi, 1); 
finalcenters = cell(maxi, 1);

% creating random centers and getting the assocaited variance  of those
% centers and repeating maxi amount of time
for i=1:maxi
randcenters{i, 1} = [abs(xmax-xmin).*rand(k, 1)-abs(xmin) abs(ymax-ymin).*rand(k, 1)-abs(ymin)];
[finalcenters{i, 1}, allvar(:, i )] = MyKmeans(data, double(randcenters{i, 1}));
end

%finding the cluster centers with minium variance and output the best
%centers
[variance, ind] = min(sum(allvar, 1));
centers = finalcenters{ind, 1};
