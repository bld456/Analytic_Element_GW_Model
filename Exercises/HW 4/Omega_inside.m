function [ Omega ] = Omega_inside(Qx0, z, k1,k,R,C,Q,zw )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Omega =( -2*k1/(k1 + k))*Qx0*z +(Q/(2*pi))*log(z-zw)+ ((k1-k)/(k1+k))*(Q/(2*pi)) * log(R - z* conj(zw)/R)    +(k1/k)*real(C);
end

