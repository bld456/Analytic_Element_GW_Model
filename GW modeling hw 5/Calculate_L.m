function [L] = Calculate_L(z1,z2)
    
    L=sqrt( (real(z1)-real(z2))^2 +(imag(z1)-imag(z2))^2);
  
end

