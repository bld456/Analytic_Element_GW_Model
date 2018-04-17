function [ Omega ] = Omega_ls( z,z1,z2,L)
Z=Bz_from_z(z,z1,z2);
Omega=L/(4*pi)*((Z+1)*log(Z+1)-(Z-1)*log(Z-1)-2);
end
