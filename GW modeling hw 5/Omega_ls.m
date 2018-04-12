function [Omega] =Omega_ls(z,Qx0,alpha, s, LS_end,zw,rw,Q)

LS_array = nan(length(s),1);
LS_array(length(LS_array),1) = 1;
for m = 1:length(LS_array)-1
   

        
      z1=LS_end(m,1);
      z2=LS_end(m,2);
      Z=Calculate_Z(z,z1,z2);
      L=Calculate_L(z1,z2);
       
      LS_array(m,1) =  LS(Z,L);
    
end
Omega = -Qx0*z*exp(-1i*alpha) + dot(LS_array , s)+ Omega_well(z,zw,rw,Q);
end