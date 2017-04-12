%J = jacobian('fx3',guess,'c')
% Fx3 is our function... changed below

function J=jacobian(func,x0,method,varargin);
%
% [df]=numgrad(func,x0,method,param)
%
% method = ’c’ -> centered difference
7
% = ’l’ -> left difference
% = ’r’ -> right difference
%
x0 = x0(:);
f = feval(func,x0,varargin{:});
m = length(x0);
%J = jacobian('fx3',initialguess,'c')
%Fx3 is where we change your function

n = length(f);
J = zeros(n,m);
dev = diag(.00001*max(abs(x0),1e-8*ones(size(x0))));
if (lower(method)=='l');
for i=1:m;
ff= feval(func,x0+dev(:,i),varargin{:});
J(:,i) = (ff-f)/dev(i,i);
end;
elseif (lower(method)=='r')
for i=1:m;
fb= feval(func,x0-dev(:,i),varargin{:});
J(:,i) = (f-fb)/dev(i,i);
end;
elseif (lower(method)=='c')
for i=1:m;
ff= feval(func,x0+dev(:,i),varargin{:});
fb= feval(func,x0-dev(:,i),varargin{:});
J(:,i) = (ff-fb)/(2*dev(i,i));
end;
else
error('Bad method specified')
end

function f = fx3(x)

f = (-x+4);

