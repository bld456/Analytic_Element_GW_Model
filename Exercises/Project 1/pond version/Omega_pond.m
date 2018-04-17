function [ Omega ] = Omega_pond(z,z0,rp,Q, N)
rsq=(z-z0)*conj(z-z0);
if rsq>rp^2
    Omega=-(Q/(2*pi))*log((z-z0)/rp);
else
    Omega=-(1/4)*N*((z-z0)*(conj(z)-conj(z0))-rp*rp);

end