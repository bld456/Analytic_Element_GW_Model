function [ Omega ] = omega_total2( z, zw, Q,Qx0, Phi0, rl)
rsq=(z)*conj(z);
if rsq>rl^2
    Omega  = omega_uniformflow_lake(Qx0, z,rl) + omega_well_near_lake(z,zw,rl,Q) + Phi0;
else 
       Omega = Phi0;
      
end
end