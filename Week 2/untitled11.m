a = [1 2 3;1 2 2;1 3 3;1 4 4]
b = [1 0 2]
disp((a-b).^2)
disp(sum((a-b).^2, 2))

