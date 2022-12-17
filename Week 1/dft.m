function [a, b] = dft(x)
K = 100;  %random high value for the dft length 
vs = 100; %sample rate 
T = 2;  %sample time 
N = vs*T; %number of samples
%initializing two matrices a and b
a = zeros(1, K); 
b = zeros(1, K);
%creating sampling time vector 
n = 0:1:N-1;
%looping over K to create the arrays of a and b lists 
for i = 1:K
    fcos = arrayfun(@(x) cos(2*pi*(i-1)*x/N), n); %matrix of value of cos and sin function for frequencies going up 
    fsin = arrayfun(@(x) sin(2*pi*(i-1)*x/N), n);

    a(1,i) = 2/N*sum(x.*fcos);      %adding each element to the initalised matrix
    b(1,i) = 2/N*sum(x.*fsin);

end
%plotting the fft result
A = sqrt(a.^2+b.^2);    %amplitudes
K = length(A);
v = (0:K-1) / T;    %alternative formula for v
plot(v,A)
title('magnitude spectrum of x')
xlabel('frequency (Hz)'), ylabel('amplitude')

