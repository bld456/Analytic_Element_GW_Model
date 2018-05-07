
%NO WELLS
%%%%%%%%%%%%%%%%%%%


xmin = 476800;
xmax =487600 ; 

ymin =  4965500 ;
ymax = 4976400;



base = 237;%m
k = 152.4 ;%m

model = Model();



%need to add path to infiltration and make sure there are no duplicate
%methodsn    
refPhi = (285-base)^2*.5*152.4; 
refz =  4.6000e+05+ 4.97e+06i;
%refz =  4.6000e+05+ 4.965e+06i;



%%initialize infiltration area and strength
gamma0 =-1 * .0004 ;%m/day (6 inches per year)
eps = 10^-5;
z_infil_1 = [];
z_infil_1(1)= 440000+ 1i*4960000;
z_infil_1(2)=  490000 + 1i*4960000;
z_infil_1(3)= 490000 + 1i*4990000;
z_infil_1(4)= 440000 + 1i*4990000;
z_infil_1(5)= 440000 + 1i*4960000;  
L = Calculate_Larray(z_infil_1);
Logfac = logfac(z_infil_1);


%add major elements to the model
mississippi = River('Elements/Rivers/miss2.csv');
hiawatha = Lake('Elements/Lakes/hiawatha.csv');
nokomis = Lake ('Elements/Lakes/nokomis.csv');
taft = Lake('Elements/Lakes/taft2.csv');
mother =Lake('Elements/Lakes/mother2.csv');
minnetonka=Lake('Elements/Lakes/minnetonka.csv'); 
calhoun = Lake('Elements/Lakes/calhoun+isles.csv');
harriet = Lake('Elements/Lakes/harriet.csv');
cedar = Lake('Elements/Lakes/cedar.csv');
wood =Lake('Elements/Lakes/wood.csv');
richfield=Lake('Elements/Lakes/richfield.csv');
diamond=Lake('Elements/Lakes/diamond.csv');
grass =Lake('Elements/Lakes/grass2.csv');
legion =Lake('Elements/Lakes/legion.csv');
milner = Lake('Elements/Lakes/milner.csv');

mississippi.setPhi(0);

hiawathaPhi = phi_to_Omega_UNC(247.22 - base,k);
nokomisPhi =  phi_to_Omega_UNC(248.09 - base,k);
taftPhi = phi_to_Omega_UNC(248.59 - base,k);
motherPhi =  phi_to_Omega_UNC(248.54 - base,k);
minnetonkaPhi =  phi_to_Omega_UNC(282.08 - base,k);
calhounPhi = phi_to_Omega_UNC(259.3 - base,k);
harrietPhi = phi_to_Omega_UNC(258.1 - base,k);
cedarPhi = phi_to_Omega_UNC(259.59 - base,k);
woodPhi=phi_to_Omega_UNC(249.61 - base,k);
richfieldPhi=phi_to_Omega_UNC(250.58 - base,k);
diamondPhi=phi_to_Omega_UNC(250.06 - base,k);
grassPhi=phi_to_Omega_UNC(252.9 - base,k);
legionPhi=phi_to_Omega_UNC(249.26 - base,k);
milnerPhi=phi_to_Omega_UNC(250.08 - base,k);

hiawatha.setPhi(hiawathaPhi);
nokomis.setPhi(nokomisPhi);
taft.setPhi(taftPhi);
mother.setPhi(motherPhi);
minnetonka.setPhi(minnetonkaPhi);
calhoun.setPhi(calhounPhi);
harriet.setPhi(harrietPhi);
cedar.setPhi(cedarPhi);
diamond.setPhi(diamondPhi);
richfield.setPhi(richfieldPhi);
wood.setPhi(woodPhi);
grass.setPhi(grassPhi);
legion.setPhi(legionPhi);
milner.setPhi(milnerPhi);


model.addRiver(mississippi);
model.addLake(nokomis);
model.addLake(hiawatha);
model.addLake(mother);
model.addLake(taft);
model.addLake(minnetonka);
model.addLake(calhoun);
model.addLake(harriet);
model.addLake(cedar);
model.addLake(wood);
model.addLake(richfield);
model.addLake(diamond);
model.addLake(legion);
model.addLake(milner);

model.addLake(grass);


b = Populate_b(model, refPhi,gamma0,L,z_infil_1, Logfac,eps,refz); 

%need to keep the strength of minnetonak constant by putting it in the B
%matrix, then move the refrence point around to get the right value along
%lake obundaries. Im close :)
A = Populate_A(model,refz);

s= A\b;
%ContourMe_R_int(xmin,xmax,400,ymin,ymax,400, @(z)real(),30);
mississippi.plotElement()
nokomis.plotElement()
hiawatha.plotElement()
taft.plotElement()
mother.plotElement()
minnetonka.plotElement()
cedar.plotElement()
harriet.plotElement()
calhoun.plotElement()
diamond.plotElement()
wood.plotElement()
richfield.plotElement()
milner.plotElement()
grass.plotElement()
legion.plotElement()


%% add a new section where the line sink strengths stay constant 


for i = 1:model.nSinks

model.Sinks(i).sigma = s(i);

end


Ql = zeros(model.nLakes,1);
for i = 1:model.nLakes
    for j = 1:length(model.Lakes(i).LineSinks)
    
    Ql(i) = Ql(i) + model.Lakes(i).LineSinks(j).sigma * model.Lakes(i).LineSinks(j).L;
    end
end


w = csvread('Data Collection/wells.csv');

Wells = Well.empty(length(w),0);

rw = .2; %temporary
for i = 1: length(w)

Wells(i) = Well((w(i,3)-base)^2 * .5 * 152.4,w(i,1),w(i,2),rw);

end



%Wells = [];



%%incorporate allowing lake levels to change
A2 = Populate_A_w(model,refz,Wells);
b2 = Populate_b_w(model, refPhi,Wells,Ql,gamma0,L,z_infil_1, Logfac,eps ,refz);
%add minetonka to the given function?


s2 = A2\b2;
% A = Populate_A_w(model,refz,Wells);
% b = Populate_b_w(model, refPhi,Wells,Ql,gamma0,L,z_infil_1, Logfac,eps ,refz);
% 
% s2 = A\b;



%check the quality of the refrence point

miss_dif = Omega_to_phi_UNC((Omega_total_w(mississippi.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps) ),152.4) - Omega_to_phi_UNC(mississippi.Phi, 152.4)
nokomis_dif =Omega_to_phi_UNC((Omega_total_w(nokomis.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps) ),152.4)- Omega_to_phi_UNC(nokomis.Phi, 152.4)
hiawatha_dif =Omega_to_phi_UNC((Omega_total_w(hiawatha.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps)),152.4)- Omega_to_phi_UNC(hiawatha.Phi, 152.4)
taft_dif =Omega_to_phi_UNC((Omega_total_w(taft.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps) ),152.4)- Omega_to_phi_UNC(taft.Phi, 152.4)
mother_dif=Omega_to_phi_UNC((Omega_total_w(mother.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps) ),152.4)- Omega_to_phi_UNC(mother.Phi, 152.4)
tonka_dif =Omega_to_phi_UNC((Omega_total_w(minnetonka.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps)),152.4)- Omega_to_phi_UNC(minnetonka.Phi, 152.4)
calhoun_dif=Omega_to_phi_UNC((Omega_total_w(calhoun.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps) ),152.4)- Omega_to_phi_UNC(calhoun.Phi, 152.4)
cedar_dif=Omega_to_phi_UNC((Omega_total_w(cedar.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps)),152.4)- Omega_to_phi_UNC(cedar.Phi, 152.4)
harriet_dif=Omega_to_phi_UNC((Omega_total_w(harriet.LineSinks(1).mp,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps) ),152.4)- Omega_to_phi_UNC(harriet.Phi, 152.4)


%
%ContourMe_R_int(472000,483000,100,4966000,4978000,100, @(z)Omega_to_phi_UNC(real(Omega_total_w(z,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps)),152.4) + base,100);

%ContourMe_R_int(440000,490000,100,4960000,4990000,100, @(z)real(Omega_total_w(z,model,s2,Wells,gamma0,L,z_infil_1, Logfac,eps)),50);
hold on 
for i = 1: length(w)


plot(real(Wells(i).zw),imag(Wells(i).zw),'*r')
end