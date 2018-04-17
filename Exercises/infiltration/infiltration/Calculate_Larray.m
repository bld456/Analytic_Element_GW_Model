function [L] = Calculate_L(z_list)
L=[]    ;

for j = 1:length(z_list)-1
    L(j)=sqrt( (real(z_list(j))-real(z_list(j+1)))^2 +(imag(z_list(j))-imag(z_list(j+1)))^2);
 
end

