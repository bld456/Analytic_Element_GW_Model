classdef ModelElement < handle
    %ELEMENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    
    LineSinks
    n
    Phi
    end
    
    methods
        %%%%%%%%
        function obj = ModelElement(filename)
                
         nodes =  nodes_from_CSV(filename);
         obj.n = length(nodes )-1;
         
          
         obj.LineSinks = LineSink.empty(obj.n,0); %row vector
         for j = 1:obj.n
           
          obj.LineSinks(j)= LineSink(nodes(j),nodes(j+1));
         end
        end
        
        
        
        %%%%%%%
        function subdivide(obj)
            %%%%%%
            %Turn a single line sync element into two
            %%%%%%
         %  if factor > 1 && rem(factor, )==0
                factor = 2; %Brute force
                newSinks = LineSink.empty(obj.n * factor,0);
               
                newSinks_index = 1;
                for j = 1:obj.n
                    z1= obj.LineSinks(j).z1;
                    z2 = obj.LineSinks(j).z2;
                    mp = obj.LineSinks(j).mp
                    newSinks(newSinks_index) = LineSink(z1,mp);
                    newSinks_index = newSinks_index +1;
                    newSinks(newSinks_index) = LineSink(mp,z2);
                    
%                     for k= 1:factor
%                          if k ==1 
%                         newSinks(newSinks_index) = LineSink(z1,pt);
%                         else
%                         newSinks(newSinks_index) = LineSink(pt*(k-1),pt*k);
% 
%                         end
%                         newSinks_index = newSinks_index +1 ;
                        
                            
                    
                    
                end
                obj.n = obj.n * factor;
                obj.LineSinks = newSinks;
            
           % else
           %  'invalid factor'
          %  end
         
        end
    
    end
end
