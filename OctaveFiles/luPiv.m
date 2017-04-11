%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input your matrix A in form A = [1,2,3;1,2,3;1,2,3];
% Input your solutions b in form b = [1;2;3];
% Run in form [L,U,pv] = luPiv(A);
% This give U,L and pv
% run y = L\b(pv)
% run x = U\y
% This will complete the solutions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [L,U,pv] = luPiv(A,ptol)

if nargin<3, ptol = 50*eps; end
[m,n] = size(A);
if m~=n, error('A matrix needs to be square'); end
pv = (1:n)';

for i = 1:n-1
  [pivot,p] = max(abs(A(i:n,i)));
  ip = p+i -1;
  if ip~=i
    A([i ip],:) = A([ip i],:);
    pv([i ip]) = pv([ip i]);
  end
  pivot = A(i,i);
  if abs(pivot)<ptol,error('zero pivot encountered after row exchange'); end
  for k = i+1:n
    A(k,i) = A(k,i)/pivot;
    A(k,i+1:n) = A(k,i+1:n) - A(k,i)*A(i,i+1:n);
  end
end
  
L = eye(size(A)) + tril(A,-1); % extract L and U
U = triu(A);