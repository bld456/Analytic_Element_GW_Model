

phi0 = 15; %m
phi1 = 18.5; %m
L = 1000 ;%m
d = 175 ;%m
z0 = -d;
K = 10 ;%m
rw = 0.2; %m
W0 = 0.5 * K * (phi1^2 - phi0^2)/L;
a= 1.5;
Q = 3.1415 * d * W0 * a %m^2/ d


ContourMe_flow_net(-1000,0,200,-200,200,200,@(z)Omega_total(z,W0,Q,z0,rw),30);
ContourMe_flow_net(-1000,0,200,-200,200,200,@(z)W_total(z,W0,Q,z0,rw),30);