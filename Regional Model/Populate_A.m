function [ A ] = Populate_A( model, refZ )
%POPULATE_A Summary of this function goes here
%   Detailed explanation goes here
nRows = model.nSinks +1;
nColumns = model.nSinks +1;
A =zeros (nRows,nColumns);

%uggo



for r = 1:nRows
    for c = 1:nColumns
        if c == nColumns
            A(r,c) = 1;
        elseif r == nRows
                z = refZ;
                
                A(r,c) =real(model.Sinks(c).Omega(z)) ;
            
        else
            z = model.Sinks(r).mp;
            A(r,c) =real(model.Sinks(c).Omega(z)) ;
            
        end
    end
    
end

end

