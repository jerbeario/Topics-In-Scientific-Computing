function [x, t, Fs] = sampling(f, Fs, T)
%Sampling takes a function, a sample rate and a duration and outputs a
%vector of the sampled values and the time vector associated
t = 0:1/Fs:T-1/Fs;  %time vector 
x = f(t);       %sampled signal

%optional addition to trim nearest smaller power of 2 for the number of samples
%pow = pow2(floor(log2(Fs*T)));  %nearest smaller power of 2 for the number of samples 
%x = x(1, 1:pow);   %truncating signal to the nearest smaller power of 2
%t = t(1, 1:pow);   %same with the time vector
end