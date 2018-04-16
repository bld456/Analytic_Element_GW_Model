classdef Regional_model < handle
    %REGIONAL_MODEL Summary of this class  here
    %   Detailed explanation goes here
    properties
          potential_specified_points;
          rivers
          lakes
          infiltrations
          reference_point
         
    end
    
    methods
        function list_potential_specified_points(obj)
        obj.potential_specified_points = [];   
        river_points = [];
        reference_points=[];
       
       
        
        for j = 1:length(obj.rivers)
            for k = 1:length(obj.rivers(j).midpoints )
            river_points =cat(1,river_points,[obj.rivers(j).midpoints(k),obj.rivers(j).potential]);
           
            end
        end
        river_points;
        
        reference_points(1,1)=obj.reference_point.z;
        reference_points(1,2)=obj.reference_point.potential;
        reference_points;
        obj.potential_specified_points =cat(1,river_points, reference_points) ;
          
        %need to implement rest of emelents
       
        end
        
       
    end
    
end

