function [b] = Populate_b(Phi_M,Qx0,LS_c,alpha, zw,rw,Q)
    
    b = zeros(numel(Phi_M),1);
    
    for i=1:numel(Phi_M)
       b(i)=real(Phi_M(i)-Phi_g(Qx0,LS_c(i),alpha));
       
        for j=1:numel(zw)
            b(i) = b(i) -  real(Omega_well(LS_c(i),zw(j),rw(j),Q(j)));
        end
       
       
    end
  
    
end

