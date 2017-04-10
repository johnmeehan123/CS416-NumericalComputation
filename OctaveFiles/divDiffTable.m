function D = divDiffTable(x,y)

n = length(y);
if length(x) ~=n, error('x and y are not compatible'); end

D = zeros(n,n);
D(:,1) = y(:);
for j=2:n
  for i=j:n
    D(i,j) = (D(i,j-1)-D(i-1,j-1))/(x(i)-x(i-j+1));
  end
end