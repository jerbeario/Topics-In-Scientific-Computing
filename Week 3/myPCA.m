function [dataPCA] = myPCA(data)
%getting sizes of data
[M,N]= size(data);

%getting means of each column 
means = mean(data, 1);

%substracting means from data to get centered data
newdata = data - means;

%covraiance matrix
cov_data = cov(data);

%eigenvalues and vectors of C
[V, D] = eig(cov_data);

%ordering the eigen values and the eigen vectors acccordingly
[D_ordered, order] = sort(sum(D, 1), 'descend');
W = V(:, order);

%normalizing eigen values
D_ordered = D_ordered/(sum(D_ordered, 'all'));

%cummulative summation of normalized eigen values and finding index of
%cumulative sum up to 0.95
Dsum = cumsum(D_ordered);

%Reduced data 
dataPCA = newdata*W(:,1:length(Dsum(Dsum<0.95)));

