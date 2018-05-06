function [ omega  ] = Omega_total_1( z,z1,R1,Q , C,Qx0)
%OMEGA_TOTAL_1 Summary of this function goes here
%   Detailed explanation goes here
rsq = R1 *R1;
if ((z-z1)*conj(z-z1))  < rsq
    omega = NaN;
else

omega = -Qx0 *( (z-z1)- R1*R1 /(z-z1)) + (Q/(2*pi)) * log((z-z1)/R1)+C;
end

