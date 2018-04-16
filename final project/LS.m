function [Omega] = LS(Z,L)
    

    if abs(Z+1)<10^-5 || abs(Z-1) <10^-5
        Omega = 0;
    else
        Omega = L/(4*pi) * ((Z+1)*log(Z+1)-(Z-1)*log(Z-1)-2);
    
    end
end