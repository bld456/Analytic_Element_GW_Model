function [ omega ] = Omega_total( z, model, s )
%OMEGA_TOTAL Summary of this function goes here
%   Detailed explanation goes here

omega  = 0;

for j = 1:model.nSinks +1
    if j == model.nSinks +1
        omega = omega + s(j);
    else        
  
        omega = omega + model.Sinks(j).Omega(z,s(j));
    end
end
end

