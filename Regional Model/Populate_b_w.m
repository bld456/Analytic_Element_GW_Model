function [B ] = Populate_b_w( model, refPhi,Wells,Ql,gamma0,L,z_infil_1, Logfac,eps ,refZ)
%POPULATE_B Summary of this function goes here
%   Detailed explanation goes here

nLakes = model.nLakes;
nRivers = model.nRivers;
nWells = length(Wells);

nRows = model.nSinks +1 + nLakes + nWells;

B = zeros(nRows  ,1);


c = 1;


for r = 1:nRivers
    for j = 1:length(model.Rivers(r).LineSinks)
 

    B(c,1) = real(model.Sinks(c).PhiM);
    c = c+1;
   end
       
end

%lakes
for r = 1:nLakes
   
  for j = 1:length(model.Lakes(r).LineSinks)
    z2 = model.Lakes(r).LineSinks(1).mp;
    B(c,1) = 0 + Phi_Area_sink(z2,gamma0,L,z_infil_1, Logfac,eps);
    c = c+1;
  end
end



for r = 1:nWells
    
    Wells(r)

    B(c,1) = real(Wells(r).Phi);
    c = c+1;
   
       
end
%Infiltration at all points
for r = 1:c-1
    if r < model.nSinks +1
        B(r,1) = B(r,1) - Phi_Area_sink(model.Sinks(r).mp,gamma0,L,z_infil_1, Logfac,eps);
    else
        B(r,1) = B(r,1) - Phi_Area_sink(Wells(r - model.nSinks).zw,gamma0,L,z_infil_1, Logfac,eps);
    end
end 

%constant
B(c ,1 ) = real(refPhi )- Phi_Area_sink(refZ,gamma0,L,z_infil_1, Logfac,eps);

c = c+1;


for r = 1:nLakes
    
    B(c,1) = Ql(r);
    c = c+1;
end

%include infiltration
% for r = 1:nRivers + nLakes + nWells 
% B(r,1) = B(r,1) - Phi_Area_sink(model.Sinks(r).mp,gamma0,L,z_infil_1, Logfac,eps);
% display(r)
% end
end
