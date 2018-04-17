


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

all_infil = [z_infil_1, z_infil_2];

L = Calculate_Larray(z_infil_1);

Logfac = logfac(z_infil_1);


gamma0 = .1;
eps = 10^-5;

ContourMe_R_int(-400,400,400,-400,400,400,@(z)Phi_Area_sink(z,gamma0,L,z_infil_1, Logfac,eps),30);