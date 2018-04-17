function [ Omega ] = Omega_total( z,Qx0,Q, z1,z2,rw)
Omega= -Qx0 * z + Omega_well(z,z1,rw,Q) +Omega_well(z,z2,rw,Q);
end
