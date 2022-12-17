function dydt = lorentzattractor(~, y)
%defining parameters 
sigma = 18;
beta = 1.9;
rho = 27;
%state matrix
dydt = [-sigma*y(1) + sigma*y(2); 
        rho*y(1) - y(2) - y(1)*y(3); 
        -beta*y(3) + y(1)*y(2)];

