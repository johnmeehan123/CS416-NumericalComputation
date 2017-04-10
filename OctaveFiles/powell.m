%
% Powell's method
%
global x s
%
% itmax = maximum number of iterations
% N = number of design variables
%
itmax = 2;
N = 2;
%
% initial guess for vector of design variables
%
x0 = [2 2]';
x = x0
%
% initial set of search directions grouped into a
% matrix (each column is a search direction). For 
% Powell's method this matrix is the identity matrix
%
H = eye(N);
% 
n = N;
%
% main iteration loop (n minimizations plus minimization
% along new conjugate direction)
%
for iter = 1:1:itmax
iter
%
% perform n unidimensional minimizations
%
   s_new = zeros(n,1);
   H
   for i=1:1:n
      s = H(:,i);
      alpha_star = fmin('fun1', -100, 100)
      F = fun1(alpha_star);
      x = x +alpha_star*s;
      x, F
      s_new = s_new + alpha_star*s;
   end
%
% generate new search direction, and minimize along it
%
   s = s_new;
   alpha_star = fmin('fun1', -100, 100)
   F = fun1(alpha_star);
   x = x +alpha_star*s;
   x, F
%
% substitute one of the initial directions with the new one
%
   for ic=1:1:n-1
      H(:,ic) = H(:,ic+1);
   end
   H(:,n) = s_new;
end
function y=fun1(alpha)
global x s
x1 = x(1) + alpha*s(1);
x2 = x(2) + alpha*s(2);
%
% This is the objective function F to be minimized
%
y = x1^2 -3*x1*x2 +4*x2^2 +x1 -x2;