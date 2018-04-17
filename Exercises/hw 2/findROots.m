
f = @(Qx0,b,l,d)  - Qx0*b + Qx0*d*(2*3.1415- atan((b-d)/l) - atan((d+b)/l))  ;

Qx0=6;
b=100;
l=100;
fun = @(d) f(Qx0,b,l,d);
xmin = 0;
xmax = 100;
fplot(fun, [xmin, xmax] )



d= fzero(fun,1)