Qx0  = 0.63;
Phi0= 2576.45;
rl= 100;
Phi2 = 1620;

Phi1=2880;
l=1000;
zw =rl +200

Q=2*pi* (Phi2 - Phi0 + Qx0*(l+-rl*rl/l))/real(log((rl/(l*conj(l)))*(l-zw)/(l-rl*l/conj(zw)))) 

ContourMe_flow_net(-1000,1000,500,-500,500,500,@(z)omega_total2(z,zw,Q,Qx0, Phi0, rl),30);
