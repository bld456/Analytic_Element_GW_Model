function [ Omega ] = omega_total1( z, Q,Qx0, Phi0, rl)
%OMEGA_TOTAL Summary of this function goes here
%   Detailed explanation goes here
rsq=(z)*conj(z);
if rsq>rl^2
    Omega = omega_uniformflow_lake( Qx0, z, rl) + omega_well( z, 0 , rl, Q) +Phi0;
else 
    Omega = Phi0;
    
end
end

