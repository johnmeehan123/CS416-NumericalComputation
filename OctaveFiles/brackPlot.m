function Xb = brackPlot(fun,xmin,xmax,nx)

if nargin<4, nx=20; end

xp = linspace(xmin,xmax); yp = feval(fun,xp);
plot(xp,yp,[floor(xmin) ceil(xmax)],[0,0]);
grid on; xlabel('x'); ylabel(['f(x) defined in ',fun,'.m']);

ytop = max(yp); ybot = min(yp);
ybox = 0.05*[ybot ytop ytop ybot ybot];
c = [0.7 0.7 0.7];

x = linspace(xmin,xmax,nx);
f = feval(fun,x);
nb = 0; Xb = [];
for k = 1:length(f)-1
  if sign(f(k))~=sign(f(k+1))
    nb = nb+1;
    Xb(nb,1) = x(k);
    Xb(nb,2) = x(k+1);
    hold on; fill([x(k) x(k) x(k+1) x(k+1) x(k)],ybox,c);
  end
end
hold off

if isempty(Xb)
warning('No brackets found. Check [xmin,xmax] or increase nx');
end

function f = fx3(x)

f = (1.6*(x.^3))+(3*(x.^2))-(2*x);
