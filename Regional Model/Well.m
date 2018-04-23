classdef Well 
    %WELL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Q
        zw
        rw
        
      
    end
    
    methods
        function obj = Well(Q,xw,yw,rw)
            obj.Q = Q;
            obj.zw = xw+ 1i*yw;
            obj.rw = rw;
            
            
        end
        
        
        
        function omega = Omega(obj,z)
            rsq=(z-obj.zw)*conj(z-obj.zw);
                if rsq>obj.rw^2
                    omega=obj.Q/(2*pi)*log(z-obj.zw);
                else
                     omega = 0;

                end
            
        end
    end
    
end

