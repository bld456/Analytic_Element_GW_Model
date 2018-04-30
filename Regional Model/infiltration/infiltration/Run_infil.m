


z_infil_1 = [];
z_infil_1(1)= -100 + 1i*-100;
z_infil_1(2)=  100 + 1i*-100;
z_infil_1(3)= 100 + 1i*100;
z_infil_1(4)= -100 + 1i*100;
z_infil_1(5)= -100 + 1i*-100;  

z_inifl_2 = []
z_infil_2(1)= -300 + 1i*-300;
z_infil_2(2)=  300 + 1i*-300;
z_infil_2(3)= 300 + 1i*300;
z_infil_2(4)= -300 + 1i*300;
z_infil_2(5)= -300 + 1i*-300; 




z_infil_1 = [];
z_infil_1(1)= 440000+ 1i*4960000;
z_infil_1(2)=  490000 + 1i*4960000;
z_infil_1(3)= 490000 + 1i*4990000;
z_infil_1(4)= 440000 + 1i*4990000;
z_infil_1(5)= 440000 + 1i*4960000;  


all_infil = [z_infil_1, z_infil_2];

L = Calculate_Larray(z_infil_1);

Logfac = logfac(z_infil_1);


gamma0 = -.0004;%/(30000*50000);

eps = 10^-5;


zref = 4.7 * 10^5 + 1i* 4.975*10^6 ;
refPhi = 6*10^6 ;
c= refPhi - real(Phi_Area_sink(zref,gamma0,L,z_infil_1, Logfac,eps))

ContourMe_R_int(440000,490000,400,4960000,4990000,400,@(z)(Phi_Area_sink(z,gamma0,L,z_infil_1, Logfac,eps)+c),30);
%ContourMe_R_int(-100,100,400,-100,100,400,@(z)(Phi_Area_sink(z,gamma0,L,z_infil_1, Logfac,eps)+c),30);
% Phi_Area_sink(zref,gamma0,L,z_infil_1, Logfac,eps)+c