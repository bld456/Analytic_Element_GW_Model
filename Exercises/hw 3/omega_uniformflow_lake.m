function [ Omega ] = omega_uniformflow_lake( Qx0, z, rl )
%OMEGA_UNIFORMFLOW_LAKE Summary of this function goes here
%   Detailed explanation goes here

Omega = -Qx0*(z-rl*rl/z);
end

