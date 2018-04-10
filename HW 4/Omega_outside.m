function [ Omega ] = Omega_outside(Qx0, z, k1,k,R,C,Q ,zw)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Omega = -Qx0*(z-((k1-k)/(k1 +k))*(R*R)/z) + (2*k/(k1+k))*(Q/(2*pi))*log(z-zw) + ((k1-k)/(k1+k))*(Q/(2*pi))*log(z/R) + real(C);
end

