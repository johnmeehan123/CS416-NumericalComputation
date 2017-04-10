function x = demoNewtonSys(maxit,x0)

if nargin<1, maxit=5;       end %default iteration is 5
if nargin<2, x0=zeros(2,1); end %default is 2 rows one column

% --- Coefficients for the case of two distinct solutions
alpha = 1.4; bbeta = -0.6; sigma=-1.6; tau=-4.6 %sys of linear equations 3.. these are just defining numeric values before x values

x = x0; 
f = zeros(size(x)); %if x0 is 100, it will fill 100 0's to a vector

fprintf('\n k     x(1)     x(2)     norm(f)     norm(dx)\n'); %just print top values

for k =1: maxit %for loop which runs for each iteration
  f(1) = alpha*x(1) - x(2) + bbeta;  %first equation
  f(2) = x(1)^2 + sigma*x(1) - x(2) + tau; %second equation
  J = [ alpha -1; (2*x(1)+sigma) -1]; %
  dx = -J\f;
  fprintf(' %4d     %9.5f     %9.5f     %10.2e     %10.2e     %10.2e\n',...
           k-1,x(1),x(2),norm(f),norm(dx));
  x = x+dx;
end
fprintf('%4d  %9.5f %9.5f\n',k,x(1),x(2));