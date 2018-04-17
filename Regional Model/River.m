classdef River < handle
    %RIVER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        LineSinks
        n
        Phi
    end
    
    methods
        function obj = River( filename,Phi)
         obj.Phi = Phi;
         nodes =  nodes_from_CSV(filename);
         obj.n = length(nodes )-1;
         
          
         obj.LineSinks = LineSink.empty(obj.n,0); %row vector
         for j = 1:obj.n
           
          obj.LineSinks(j)= LineSink(nodes(j),nodes(j+1),Phi);
        
         end
         
         
        end
        
  
    end
    
end

