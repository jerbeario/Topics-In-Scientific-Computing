
%getting data
table = readtable("StarTypeDataset.csv");
data = table{:, :};
temp = data(:, 1);
magn = data(:, 2);


n=50;
C = zeros(n, 1);

%getting labels of the data and comparing them to the actual labels from
%the mykmean algorithm n times
for i=1:n
[A, B] = myKNN(data, data);
C(i, 1) = sum(A==B)/length(data);
end

% outputs the average efficeincy
eff = sum(C)/n