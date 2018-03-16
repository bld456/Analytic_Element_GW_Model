


Phi1=1.8; %feet
l=1000; %
zw = 250;
rl= 10;

Qx0  = 11.5; %feet per day
Q = 10000 %cubic feet per day
Phi0= -1* ((Q/(2*pi))  *  real(log((rl/(l*conj(l)))*(l-zw)/(l-rl*-1/conj(zw))) - Qx0*(l+rl*rl/l)) - Phi1)



ContourMe_flow_net(-1000,1000,500,-500,500,500,@(z)omega_total2(z,zw,Q,Qx0, Phi0, rl),30);
