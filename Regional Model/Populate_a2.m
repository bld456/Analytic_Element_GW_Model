function [ A ] = Populate_a2( model, refZ, Wells )
%POPULATE_A2 Summary of this function goes here
%   Detailed explanation goes here
nWells = length(Wells);



count_riverSinks = 0;

for r = 1:model.nRivers
    for l = 1:length(model.Rivers(r).LineSinks)
    count_riverSinks =count_riverSinks +1;
   
    end
end

nRows = count_riverSinks+ nWells +1;
nColumns = count_riverSinks +nWells+ 1;
A =zeros (nRows,nColumns);
A(:,nColumns) = 1;


%river rows
for r = 1:count_riverSinks 
   for c = 1:nColumns-1
       z =  model.Sinks(r).mp;
      
       if c > model.nSinks
            A(r,c) = real(Wells(c-model.nSinks).Omega(z));
       else
           A(r,c) =real(model.Sinks(c).Omega(z));
       end
   end
end

 
 for r = count_riverSinks +1 : count_riverSinks+ nWells
      for c = 1:(nColumns-1)
           z =  Wells(r-(count_riverSinks )).zw +Wells(r-(count_riverSinks )).rw ;
      
       if c > count_riverSinks
            A(r,c) = real(Wells(c-count_riverSinks).Omega(z));
       else
           A(r,c) =real(model.Sinks(c).Omega(z));
       end
      end
 end
 
 
  for c = 1:(nColumns-1)
           z = refZ;
      
       if c > count_riverSinks
            A(nRows,c) = real(Wells(c-count_riverSinks).Omega(z));
       else
           A(nRows,c) =real(model.Sinks(c).Omega(z));
       end
 
 
 end
end

