function [ A ] = Populate_A_w( model, refZ )
%POPULATE_A Summary of this function goes here
%   Detailed explanation goes here
nRows = model.nSinks +model.nLakes+ 1;
nColumns = model.nSinks +1;
A =zeros (nRows,nColumns);

%

l = 1; %lake index

for r = 1:model.nSinks +1 
    for c = 1:nColumns
        if c == nColumns
            A(r,c) = 1;
        elseif r == model.nSinks +1 
                z = refZ;
                
                A(r,c) =real(model.Sinks(c).Omega(z)) ;
            
        else
            z = model.Sinks(r).mp;
            A(r,c) =real(model.Sinks(c).Omega(z)) ;
            %NEED HELP! THIS IS THE SPOOOT
            
%             if (l< model.nLakes+1)
%                 if   ismember(model.Sinks(c),model.Lakes(l).LineSinks) 
%                 A(r,c) =0;
%                 l= l+1
%             
%                 end
%             end
    end
    
end



for r = model.nSinks +2 : nRows
    for c = 1:nColumns-1
   
    lake = model.Lakes(r- (model.nSinks+1) );
    
    if ismember(model.Sinks(c), lake.LineSinks) 
          A(r,c) = 1;
        
   
    end
    
    end
end

end
