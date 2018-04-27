function [B ] = Populate_b( model, refPhi,gamma0,L,z_infil_1, Logfac,eps ,refZ)
%POPULATE_B Summary of this function goes here
%   Detailed explanation goes here

nRows = model.nSinks +1;
B = zeros(nRows ,1);


for r = 1:nRows
    if r == nRows
        B(r,1) = refPhi - Phi_Area_sink(refZ,gamma0,L,z_infil_1, Logfac,eps);
    else
        
        B(r,1) = model.Sinks(r).PhiM - Phi_Area_sink(model.Sinks(r).mp,gamma0,L,z_infil_1, Logfac,eps);
    end
end
end

