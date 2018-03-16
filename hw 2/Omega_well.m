function [ Omega ] = Omega_well(z,z0,rw,Q)
rsq=(z-z0)*conj(z-z0);
if rsq>rw^2
    Omega=Q/(2*pi)*log(z-z0);
else
    Omega = 0;

end