function [ Omega ] = omega_well_near_lake( z,z0,rl,Q )
%OMEGA_WELL_NEAR_LAKE Summary of this function goes here
%   Detailed explanation goes here
Omega=Q/(2*pi)*log((rl/(z*conj(z)))*(z-z0)/(z-rl*z/conj(z0)));

end

