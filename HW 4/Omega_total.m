function [ Omega ] = Omega_total(Qx0, z, k1,k,R,C,Q,zw )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

rsq=(z)*conj(z);
if rsq>R^2
    Omega = Omega_outside(Qx0, z, k1,k,R, C,Q,zw);
else
    Omega = Omega_inside(Qx0, z, k1,k,R, C,Q,zw);
   
end

