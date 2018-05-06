
 %part 1
 z1 = -100 + 1i *100;
 R1 = 100;
 Phi_lake = 100;
 
 
 refz = 1000;
 refPhi = 50;
 Qx0 = .4;
 
 z0 = [z1, refz];
 Phi = [Phi_lake, refPhi];
 nLakes = 1;
 
Q = real(refPhi - Phi_lake -Qx0* ((z1+R1 - (R1*R1/(z1+R1)))-(refz - (R1*R1/(refz)))))/real((1/2*pi) * (log((z1+R1)/R1) - log(refz/R1)));

C= real(Phi_lake  + Qx0 *(z1 + R1 - R1*R1 /(z1+R1)) - (Q/(2*pi)) * log((z1+R1)/R1));

 ContourMe_flow_net(-300,300,200,-300,300,200, @(z)Omega_total_1(z,z1,R1,Q , C,Qx0),100);
 %ContourMe_R_int(-300,300,200,-300,300,200, @(z)real(Omega_total_1(z,z1,R1,Q , C,Qx0)),100);
 %colorbar
 
 
 real(Omega_total_1(z1 + R1,z1,R1,Q , C,Qx0))