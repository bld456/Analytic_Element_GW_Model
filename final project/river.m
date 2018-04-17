classdef river < handle
    %RIVER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name 
        nodes
        Z
        Larray
        sigma
        midpoints
        potential
        
    end
    
    methods
        
        function Omega = Omega_river(obj,z)
          Zarray = Calculate_Zarray(z,obj.nodes);
          Omega = [];
          
          for j= 1:length(Zarray)
            Omega(j) =  obj.sigma(j)*LS(Zarray(j),obj.Larray(j));
           end
        end
        
        
    end
    
end

