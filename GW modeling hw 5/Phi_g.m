function [Phi] = Phi_g(Qx0,z,alpha)
    
    
        Phi = real(-Qx0*z*exp(-1i*alpha));
    
    
end