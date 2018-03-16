Qx0  = 0.63;
Phi0= 2576.45;
rl= 100;
Phi1  = 2880
l = 1000
Phi2= 1620

Q= (Phi2 - Phi0 +Qx0*(l - rl*rl/l) )*2* pi/log(l/rl)  
ContourMe_flow_net(-1000,1000,500,-500,500,500,@(z)omega_total1(z,Q,Qx0, Phi0, rl),30);
