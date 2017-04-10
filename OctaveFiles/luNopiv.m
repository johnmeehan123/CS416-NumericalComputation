function [L,U] = luNopiv(A,ptol)

if nargin<3, ptol = 50*eps; end
[m,n] = size(A);
if m~=n, error('A matrix needs to be square'); end

for i = 1:n-1
  pivot = A(i,i);
  if abs(pivot)<ptol, error('zero pivot encountered'); end
  for k = i+1:n
    A(k,i) = A(k,i)/pivot;
    A(k,i+1:n) = A(k,i+1:n) -A(k,i)*A(i,i+1:n);
  end
end

L = eye(size(A)) + tril(A,-1); % extract L and U
U = triu(A);