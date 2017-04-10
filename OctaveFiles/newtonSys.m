function x = newtonSys

if nargin < 3 | isempty(xtol),      xtol = 5e-5;  end
if nargin < 4 | isempty(ftol),      ftol = 5e-5;  end
if nargin < 5 | isempty(maxit),     maxit = 15;   end
if nargin < 5 | isempty(varbose),   verbose = 0;  end
xeps = max(xtol,5*eps); feps = max(ftol, 5*eps);

if verbose, fprintf, fprintf('\nNewton iterations\n   k   norm(f)   norm(dx)\n'); end

x = x0;
k =0;
while k <= maxit
  k = k + 1;
  [J,f] = feval(Jfun,x,varargin{:});
  dx = J\f;
  x = x - dx;
  if verbose, fprintf('%3d  %12.3e  %12.3e\n',k,norm(f),norm(dx));  end
  if (norm(f) < feps) | (norm(dx) < xeps ), return; end
end

warning(sprintf('Solution not found within tolerance after %d iterations\n',k));