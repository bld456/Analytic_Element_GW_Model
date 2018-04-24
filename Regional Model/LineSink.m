classdef LineSink < handle
    %LINESINK Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
        z1
        z2
        L
        PhiM
        mp
        sigma
    end
    
    methods
        %%%%%%%%%%%
        function obj = LineSink(z1,z2)
          obj.z1 = z1;
          obj.z2 = z2;
          obj.L = obj.Calculate_L(obj.z1, obj.z2);
          obj.mp = obj.Calculate_midpoint ;
        end
        
        
        %%%%%%%%%%%%
        function mp = Calculate_midpoint(obj)
            x = (real(obj.z1)+ real(obj.z2))/2;
            y = (imag(obj.z1)+imag(obj.z2))/2;
            mp = x+ 1i*y;
        end
        
        
        
        %%%%%%%%%%%%
        function L = Calculate_L(obj, z1,z2)
            L=sqrt( (real(z1)-real(z2))^2 +(imag(z1)-imag(z2))^2);
        end
        
        
        %%%%%%%%%%%
        function Z = Calculate_Z(obj,z)
            Z = (z-.5*(obj.z2+obj.z1))/(.5*(obj.z2-obj.z1));
        end
        
        
        %%%%%%%%%%%
        function omega = Omega(obj, z, sigma )
           
            Z = obj.Calculate_Z(z);
            switch nargin 
                case 3
                case 2
                    sigma = 1;
                
            end     
            if abs(Z+1)<10^-5 || abs(Z-1) <10^-5
                omega = 0;
                                    

            else
                omega = obj.L/(4*pi) * sigma* ((Z+1)*log(Z+1)-(Z-1)*log(Z-1)-2);
                                    
            end
            
        %%%%
            
            
        end
        
    end
    
end

