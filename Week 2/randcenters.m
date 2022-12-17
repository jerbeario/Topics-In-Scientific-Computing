
%getting data
table = readtable("StarTypeDataset.csv");
data = table{:, :};
temp = data(:, 1);
magn = data(:, 2);


C = kmeans(data, 6)
[~, D, ~] = MyKmeans(data, 6)
%plotting data 
%plot(temp, magn, 'x')

x = data(:, 1);
y = data(:, 2);

%getting size of the dataset
xmax = round(max(x), 3);
xmin = round(min(x), 3);
ymax = round(max(y), 3);
ymin = round(min(y), 3);
%
%k= 6;
%maxi = 500;
%%initializing variance and centers matrix
%randcenter = cell(maxi, 1); 
%finalcenters = cell(maxi, 1);
%hold on 
%abs(xmax-xmin).*rand(k, 1)-abs(xmin);
%for i=1:maxi
%randcenter{i, 1} = [abs(xmax-xmin).*rand(k, 1)-abs(xmin) abs(ymax-ymin).*rand(k, 1)-abs(ymin) ];
%test = randcenter{i, 1}
%plot(test(:, 1), test(:, 2), 'x')
%end