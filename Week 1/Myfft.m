function [X] = Myfft(values)
%using the Cooley-Tuckey algorithm to perform fft 
n=length(values); 
if n ==1
    X=values;   %exitting the recursion condition 
else        %recursion 
    x_even = values(1:2:n); %getting all odd indexed values of x
    x_odd = values(2:2:n);  %getting all even indexed values of x
    X_even = Myfft(x_even); %recursion, feeding each split matrix into the Myfft again to further split until they are of size 1 
    X_odd = Myfft(x_odd);   %similarly
    Y1 = X_even + X_odd.*exp(-2*pi*1i.*(0:1:n/2-1)/n);      %by the Danielson-Lanczos lemma we can create the left side of the ftt
    Y2 = X_even - X_odd.*exp(-2*pi*1i.*(0:1:n/2-1)/n);      % and similarly the right side of the ftt
    X = [Y1 Y2];    %concactenating both together to get the full two sided fft
end
