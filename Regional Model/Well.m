classdef Well 
    %WELL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Q
        zw
        rw
        Phi
        
      
    end
    
    methods
        function obj = Well(Phi,xw,yw,rw)
            obj.Phi = Phi;
            obj.zw = xw+ 1i*yw;
            obj.rw = rw;
            
            
        end
        
        
        
        function omega = Omega(obj,z)
            rsq=(z-obj.zw)*conj(z-obj.zw);
        
                if rsq>obj.rw^2
                    omega=1/(2*pi)*log(z-obj.zw);
                else
                     omega = obj.Phi;

                end
            
        end
    end
    
end

