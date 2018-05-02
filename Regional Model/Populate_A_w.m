function [ A ] = Populate_A_w( model, refZ, Wells )
%POPULATE_A Summary of this function goes here
%   Detailed explanation goes here
nWells = length(Wells);
nRows = model.nSinks +model.nLakes+ nWells +1;
nColumns = model.nSinks +nWells+ 1;
A =zeros (nRows,nColumns);

%
A(:,nColumns) = 1;
% 

count_riverSinks = 0;

for r = 1:model.nRivers
    for l = 1:length(model.Rivers(r).LineSinks)
    count_riverSinks =count_riverSinks +1;
   
    end
end


%add each river row 
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





 %lake rows
 for r = count_riverSinks+1:model.nSinks
    z = model.Sinks(r).mp;
    
%      if r ==1
%             z2 = model.Sinks(r+1).mp;
% 
%          elseif model.Sinks(r).z1 == model.Sinks(r-1).z2
%              z2 = model.Sinks(r-1).mp;
%          else
%              z2 = model.Sinks(r+1).mp;
%          end
        

        for l = 1:model.nLakes
            if ismember(model.Sinks(r), model.Lakes(l).LineSinks)
        z2 = model.Lakes(l).LineSinks(1).mp;
            end
        end
        
     for c = 1:(nColumns-1)

         
         if c > model.nSinks
             A(r,c) =  real(Wells(c-model.nSinks).Omega(z) - Wells(c-model.nSinks).Omega(z2));
        else
            A(r,c) =real(model.Sinks(c).Omega(z) - model.Sinks(c).Omega(z2))   ;
      
         
         end
           A(r,nColumns) = 0; %constants cancel out
     end
 end
 

 %well rows
 
 for r = model.nSinks +1 : model.nSinks+ nWells
      for c = 1:(nColumns-1)
           z =  Wells(r-(model.nSinks )).zw +Wells(r-(model.nSinks )).rw ;
      
       if c > model.nSinks
            A(r,c) = real(Wells(c-model.nSinks).Omega(z));
       else
           A(r,c) =real(model.Sinks(c).Omega(z));
       end
      end
 end
 
 %refrence point row
 for c = 1:(nColumns-1)
           z = refZ;
      
       if c > model.nSinks
            A(nRows-model.nLakes,c) = real(Wells(c-model.nSinks).Omega(z));
       else
           A(nRows-model.nLakes,c) =real(model.Sinks(c).Omega(z));
       end
 
 
 end
 
 
 for r = (nRows - model.nLakes)+1 :nRows
     for c = 1:(model.nSinks)
     
     
     if ismember(model.Sinks(c),  model.Lakes(model.nLakes - (nRows-r)).LineSinks)
         
         A(r,c) = model.Sinks(c).L;%needs to be LS length
     else
         A(r,c) = 0;
     end
     end
     A(r,end) = 0;
 end
 
end
     






 
% %well rows
% %add the refrence row
% 
