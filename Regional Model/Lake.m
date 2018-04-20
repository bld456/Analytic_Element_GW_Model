classdef Lake < ModelElement
    %LAKE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
       function obj = Lake( filename)
                     
           obj@ModelElement(filename);
           if ~obj.Closed
               error('the input file is not a closed shape')
           end
         
               
                       
       end
      
       
       function closed = Closed(obj);
           n = length(obj.LineSinks);
           if obj.LineSinks(1).z1 ==obj.LineSinks(n).z2
               closed = true ;
           else
               closed = false;
           end
           
           
       end
    end
    
end

