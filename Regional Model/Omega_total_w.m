function [ omega ] = Omega_total_w( z, model, s,wells, gamma0,L,z_infil_1, Logfac,eps )
%OMEGA_TOTAL Summary of this function goes here
%   Detailed explanation goes here

omega  = 0;

for j = 1:model.nSinks 
     
           
        omega = omega + model.Sinks(j).Omega(z)*s(j);
    
end

for i = 1:length(wells)
   omega = omega + s(i + model.nSinks)*wells(i).Omega(z);
   s(i + model.nSinks)*wells(i).Omega(z);

end
omega = omega  +  Phi_Area_sink(z,gamma0,L,z_infil_1, Logfac,eps);
  
omega = omega +s(length(s));
     
           
end

