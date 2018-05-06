function [Omega] = Omega_lake(Z,z,a,Q,z_ref,z0,N_coef)

if Z*conj(Z)<0.999
    Omega = complex(NaN,NaN);
else
    if N_coef==0
        Omega = 0;
    else
        
        Omega = Q/(2*pi)*log((z-z0)/(abs(z_ref-z0)));
        
        for i = 1:N_coef
            Omega = Omega + a(i+1)*Z^-i;
        end
    end
    
end

