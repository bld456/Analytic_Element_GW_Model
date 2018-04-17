
 
z1= 200 + i*57; %pump out location
z2= -9+i*57; %pond location

Qx0 = 11.5; %ft/day

rp = 19;%pond radius ft
K = 58.6; %ft/day

Q = 15000; %ft^3 per day
N = Q/(rp*rp*3.1415);%infiltration rate, feet per day
rw = .3;%well radius, feet

%constant calculation, at x= 1000 re(omega) = 1.8*1.8*K*0.5
C = 1.8*1.8*K*.5 -real(Omega_total(1000,Qx0,Q,z1,z2,rw,rp,N));
%ContourMe_flow_net_site(-200,400,800,-200,400,800,@(z)Omega_total(z,Qx0,Q,z1,z2,rw,rp,N),100);

ContourMe_R_int(-200,1000,200,-200,400,200, @(z)Omega_to_phi_UNC(Omega_total(z,Qx0,Q,z1,z2,rw,rp,N)+C,K),25);
