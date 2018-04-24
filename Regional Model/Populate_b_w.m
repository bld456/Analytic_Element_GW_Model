function [B ] = Populate_b_w( model, refPhi,Wells,Ql)
%POPULATE_B Summary of this function goes here
%   Detailed explanation goes here

nLakes = model.nLakes;
nRivers = model.nRivers;
nWells = length(Wells);

nRows = model.nSinks +1 + nLakes;

B = zeros(nRows  ,1);


c = 1;


for r = 1:nRivers
    for j = 1:length(model.Rivers(r).LineSinks)
 

    B(c,1) = real(model.Sinks(c).PhiM);
    c = c+1;
   end
       
end


for r = 1:nLakes
  for j = 1:length(model.Lakes(r).LineSinks)
 
    
    B(c,1) = 0;
    c = c+1;
  end
end

for r = 1:nWells
    
 

    B(c,1) = real(Wells(r).Phi);
    c = c+1;
   
       
end

 

B(c ,1 ) = real(refPhi );
c = c+1;


for r = 1:nLakes
    
    B(c,1) = Ql(r);
    c = c+1;
end

end
