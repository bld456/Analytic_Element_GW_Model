function [ Omega ] = Omega_total( z,  Qx0,Q, z1,z2,rw,rp,N)
Omega=Omega_Uniformflow(Qx0,z) + Omega_well(z,z1,rw,Q) + Omega_pond(z,z2,rp,Q, N);

end
