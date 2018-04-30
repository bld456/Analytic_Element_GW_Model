function [ phi ] = Omega_to_phi_UNC (Omega, K)
phi = sqrt(2*abs(real(Omega))/K);
end