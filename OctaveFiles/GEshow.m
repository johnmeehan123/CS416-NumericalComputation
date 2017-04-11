%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input A = matrix
% input b = solutions
% input ptol = pivot_total
% Simply run GEShow(A,b);
% Note : This version doesn't show pivtos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x = GEshow(A,b,ptol)

if nargin<3, ptol = 50*eps; end
[m,n] = size(A);
if m~=n, error('A matrix needs to be square'); end
nb = n+1; Ab = [A b];
fprintf('\nBegin forward elimination with Augmented system:\n'); disp(Ab);

% --- Elimination
for i=1:n-1
  pivot = Ab(i,i);
  if abs(pivot)<ptol, error('zero pivot encountered'); end
  for k = i+1:n
    Ab(k,i:nb) = Ab(k,i:nb) - (Ab(k,i)/pivot)*Ab(i,i:nb);
  end
  fprintf('\nAfter elimination in column %d with pivot = %f\n',i,pivot);
  disp(Ab);
end

% --- Back substitution
x = zeros(n,1)
x(n) = Ab(n,nb)/Ab(n,n);
for i = n-1:-1:1
  x(i) = (Ab(i,nb) - Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
end