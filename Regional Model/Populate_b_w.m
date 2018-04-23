function [B ] = Populate_b_w( model, refPhi,refZ, wells,Ql)
%POPULATE_B Summary of this function goes here
%   Detailed explanation goes here

%need to know how many are lakes
nLakes = model.nLakes;
nRivers = model.nRivers;
nWells = length(wells);

nRows = model.nSinks +1 + nLakes;

B = zeros(nRows  ,1);


c = 1;


for r = 1:nRivers
    for j = 1:length(model.Rivers(r).LineSinks)
   
   Omega_wells = 0;

    for w = 1:nWells
        
         Omega_wells = Omega_wells + wells(w).Omega(model.Sinks(c).mp);
    end
    
    B(c,1) = real(model.Sinks(c).PhiM - Omega_wells);
    c = c+1;
   end
       
end


for r = 1:nLakes
    for j = 1:length(model.Lakes(r).LineSinks)
   
   Omega_wells = 0;

    for w = 1:nWells
        
         Omega_wells = Omega_wells + wells(w).Omega(model.Sinks(c).mp); 
    end
    
    B(c,1) = real(model.Sinks(c).PhiM - Omega_wells); %%where there might need to be a change depending on my understanding of the algorithm?
    c = c+1;
   end
end



B(c ,1 ) = real(refPhi - wells(w).Omega(refZ));
c = c+1;


for r = 1:nLakes
    
    B(c,1) = Ql(r);
    c = c+1;
end
end