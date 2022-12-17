function [OptimalModelParameters, optimalModelorder, ModelOutput, A] = optimalARmodel(x,y)
% Inputs:  x: regressor vector (independent variable); it must be a column vector,y: observed data (dependent variable); it must be a column vector
% Outputs: OptimalModelParameters: vector of estimated optimal parameter values,optimalmodelorder: optimal model order estimated by AIC
% ModelOutput: fitted y's obtained as output of the optimal model, A: optimal regressor matrix, R2: coefficient of determination of the optimal model

y=y(:);
x=x(:);
nrParams = 40;
aic=zeros(1,nrParams);
for k=1:nrParams
clear theta y_fit A 
A=[];
for j=0:1:k-1
A=[x.^j A];
end
theta=A\y;
y_fit=A*theta;
n=length(y);
aic(k)=n*log(sum((y-y_fit(:)).^2)/n)+2*k;
if k>2       
if(aic(k-1)>aic(k-2))&&(aic(k)>aic(k-1))            
break;
end
end
end
%% plot the AIC values for different polynomial degrees
figure
plot([1:k],aic(1:k),'.-r');
xlabel('polynomial degree');
ylabel('AIC'); 
%% assign the output parameters according to the found value of k
optimalModelorder = k-1;
A=[];
for j=0:1:optimalModelorder-1
A=[x.^j A];
end
OptimalModelParameters = A\y;
ModelOutput = A*OptimalModelParameters;
%% plot the input data and the fitted regression model
figure
plot(x,y,'.r',x,ModelOutput,'.k');
xlabel('x');
ylabel('y');
legend('Input Data','FittedModel')
end