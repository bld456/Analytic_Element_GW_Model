


Qx0 = 6 ;
d=21.12;
Q= d*2*3.14* Qx0

l = 100;
rw = 0.2; %m


b= 100 ;

z1= i*d;
z2= i*-d;


ContourMe_flow_net(-l,l,500,-(b+100),(b+100),500,@(z)Omega_total(z,Qx0,Q,z1,z2,rw),30);
