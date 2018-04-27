
xmin = 476800;
xmax =487600 ; 

ymin =  4965500 ;
ymax = 4976400;




model = Model();

gamma0 = .0004 ;%m/day (6 inches per year)
eps = 10^-5;

%need to add path to infiltration and make sure there are no duplicate
%methodsn    

refPhi = 4000000;  %tad too high, waiting to adjust until infiltration is considered
refz =  4.6390e+05+ 4.9765e+06i;

z_infil_1 = [];
z_infil_1(1)= 440000+ 1i*4960000;
z_infil_1(2)=  490000 + 1i*4960000;
z_infil_1(3)= 490000 + 1i*4990000;
z_infil_1(4)= 440000 + 1i*4990000;
z_infil_1(5)= 440000 + 1i*4960000;  

L = Calculate_Larray(z_infil_1);
Logfac = logfac(z_infil_1);
%ContourMe_R_int(xmin,xmax,400,ymin,ymax,400,@(z)Phi_Area_sink(z,gamma0,L,z_infil_1, Logfac,eps),50);


mississippi = River('Elements/Rivers/mississippi+minnesota.csv');
mississippi.setPhi(0);
model.addRiver(mississippi);

b = Populate_b(model, refPhi,gamma0,L,z_infil_1, Logfac,eps); 

A = Populate_A(model,refz);

s= A\b;
ContourMe_R_int(xmin,xmax,400,ymin,ymax,400, @(z)real(Omega_total(z,model,s,gamma0,L,z_infil_1, Logfac,eps)),100);