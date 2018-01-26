function [ Omega ] = Omega_total( z,W0,Q, z0,rw)
Omega=Omega_Uniformflow(W0,z) + Omega_well(z,z0,rw,Q) -Omega_well(z,-z0,rw,Q);
end
