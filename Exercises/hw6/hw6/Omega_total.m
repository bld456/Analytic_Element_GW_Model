function [Omega] = Omega_total(z,w0,zl,rl,Ql,Phi,alpha,numLakes)
Omega = - w0* z;
for i = 1:numLakes
    rsq1= rl(1) * rl(1);
    rsq2 = rl(2) * rl(2);

   
   if  (z - zl(1)) * conj(z-zl(1)) < rsq1       
     Omega =  Phi(1);
   
   elseif  (z - zl(2)) * conj(z-zl(2)) < rsq2
     Omega = Phi(2);
    else 
       
       
   Omega = Omega + Omega_well(z, zl(i), rl(i),Ql(i))  +conj(w0)* rl(i)*rl(i)/(z-zl(i)) + alpha(i)^2/(z-zl(i))^2 ;
        
        end
    
end

end

