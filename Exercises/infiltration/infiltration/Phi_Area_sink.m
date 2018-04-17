function [Phi] = Phi_Area_sink(z,gamma0,L,z_list,logfac,eps)
Phi = 0;
for j = 1:length(z_list)-1
    Phi = Phi + phi_side(z,z_list(j),z_list(j+1),L(j),eps,logfac(j));
end
Phi = gamma0*Phi;
end