function [B ] = Populate_b( model, refPhi )
%POPULATE_B Summary of this function goes here
%   Detailed explanation goes here

nRows = model.nSinks +1;
B = zeros(nRows ,1);


for r = 1:nRows
    if r == nRows
        B(r,1) = refPhi;
    else
        
        B(r,1) = model.Sinks(r).PhiM;
    end
end
end

