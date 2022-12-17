
%getting data
table = readtable("StarTypeDataset.csv");
data = table{:, :};
temp = data(:, 1);
magn = data(:, 2);

%plotting data 
%plot(temp, magn, 'x')

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
hold on 
for i=1:500
randcenters{i, 1} = [abs(xmax-xmin).*rand(k, 1)-abs(xmax) abs(ymax-ymin).*rand(k, 1)-abs(ymax) ];
plot(double(randcenters{i,1}))
end

hold off
%training data
training_data = data;
rng(2);
K = 6;
[C, bla] = kmeans(training_data,K); % use Matlab[s built in function % Concatenate labels to the training data (type: help cat) 
training_data = cat(2, training_data, C);

% Randomly-generated test data
test_data = [0.75 -0.1; -0.9 -0.1; 0.6 0.08];

% show test data on the same plot with the training data
plot(training_data(:,1), training_data(:,2), '+'); hold on; % show test data as red circles
plot(test_data(:,1), test_data(:,2), 'ro');
axis([-2 1 -1 1]);

% Compute distance between first test point and each training observation using square_dist
dist = square_distance(training_data(:, 1:2), test_data);
% compute the K (say, K=3) nearest neighbors of z
k = 2;
[d_knn, ind] = mink(dist, k, 1);
knn = mode(C(ind), 1)


test = myKNN(data, test_data)
plot(bla(:, 1), bla(:, 2), '+')
hold off;

% perform a majority vote among the labels of the first K neighbors of z
