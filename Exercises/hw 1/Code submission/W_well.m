function [ W ] = W_well (z, z0, rw,Q)

rsq=(z-z0)*conj(z-z0);
if rsq>rw^2
    W=(-Q/(2*pi))/(z-z0);
else
    W = Q;
end    

end