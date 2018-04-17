

Qx0 = 6 ;
d= 21.12
l = 100;
rw = 0.2; %m


b= 100 ;

z1= 0;
z2= 2*d;
Q=2*Qx0*b*3.1415*(2*3.1415-atan(b/l)-atan(b/(l*2*d)))^-1 


ContourMe_flow_net(-l,l,50,-(b+100),(b+100),50,@(z)Omega_total(z,Qx0,Q,z1,z2,rw),30);
