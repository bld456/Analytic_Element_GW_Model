function [ omega ] = Omega_total_w( z, model, s,wells )
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

for i = 1:length(wells)
   omega = omega + wells(i).Omega(z);

end
end

