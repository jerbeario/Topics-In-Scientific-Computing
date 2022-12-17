filename = 'MiceProteinExpressionDataset.csv'
data = csvread(filename, 1, 0);

newdata = myPCA(data);