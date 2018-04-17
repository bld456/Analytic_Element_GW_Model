
%case 1: no uniform flow
   
    %Parameters
    k = 10;
    k1= 10; %m/d
    zw =0;
    rw = 0.05;
    R = 100; %m
    Rinf = 10*R;
    Qx0 = 0; %No uniform flow
    PhiInf = .5 * k * 20*20;
    z = zw+rw;
    %calculate maximum discharge 
    Q_max = ((Qx0*(z))*(2*k1/(k1+k))+ (-Qx0* (Rinf -(k1-k)*R*R/((k1+k)*Rinf)))- (k1/k)*real(PhiInf))/ real((1/(2*pi))*log(z-zw)+ ((k1-k)/(k1+k))*(1/(2*pi)) * log((conj(zw)*(z)/-R) + R)  - (2*k/(k1+k))* (1/(2*pi))*log(Rinf - zw) -((k1-k)/(k1+k))*(1/(2*pi))*log(Rinf/R));
    %calculate constant
    c = real(PhiInf +  (2*k/(k1+k))* (Q/(2*pi))*log(Rinf - zw) +((k1-k)/(k1+k))*(Q/(2*pi))*log(Rinf/R)+ Qx0* (Rinf -(k1-k)*R*R/((k1+k)*Rinf)));
   
    
    %Calculate Q max if there was no inhomogeneity
    Q_noInhomogeneity = -PhiInf  /real(   (1/(2*pi))*(log(zw+rw-zw) -log(Rinf - zw))  );
    
    %Contour the real potential
    ContourMe_R_int(-150,150,500, -150,150,500, @(z)real(Omega_total(Qx0, z, k1,k,R, c,Q_max,zw)),60);
    
    

    
    
%Case 2, uniform flow   
    

    
    %Parameters
    k = 10;
    k1= 100; %m/d
    zw =0;
    rw = 0.05;
    R = 5; %m
    Rinf = -10*R;        
    Qx0= .5*k*(21*21 - 19*19)/(2 * abs(Rinf)) ;%with uniform flow
    PhiInf = .5 * k * 21*21;
    z = zw+rw;
    
    Q_max = ((Qx0*(z))*(2*k1/(k1+k))+ (-Qx0* (Rinf -(k1-k)*R*R/((k1+k)*Rinf)))- (k1/k)*real(PhiInf))/ real((1/(2*pi))*log(z-zw)+ ((k1-k)/(k1+k))*(1/(2*pi)) * log((conj(zw)*(z)/-R) + R)  - (2*k/(k1+k))* (1/(2*pi))*log(Rinf - zw) -((k1-k)/(k1+k))*(1/(2*pi))*log(Rinf/R))
   
    c = real(PhiInf +  (2*k/(k1+k))* (Q/(2*pi))*log(Rinf - zw) +((k1-k)/(k1+k))*(Q/(2*pi))*log(Rinf/R)+ Qx0* (Rinf -(k1-k)*R*R/((k1+k)*Rinf)));
   
    
    
    
    ContourMe_R_int(-150,150,500, -150,150,500, @(z)real(Omega_total(Qx0, z, k1,k,R, c,Q_max,zw)),60);
    



