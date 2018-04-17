function [Phi] = phi_side(z,z1,z2,L,eps,logfac)
%PHI_SIDE Summary of this function goes here
%   Detailed explanation goes here
Z = Calculate_Z(z,z1,z2);

if (Z-1)*conj(Z-1) < eps*eps
    term1 = 0;
else
    term1 = (Z-1)*log(Z-1);
end


if (Z+1)*conj(Z+1) < eps*eps
    term2 = 0;
else 
    term2 = (Z+1)*log(Z+1);
end

F = term1 - term2 + 2 - logfac;
Y = imag(Z);

Phi = (-1/(pi *32))*L*L*Y*(F + conj(F));
end

