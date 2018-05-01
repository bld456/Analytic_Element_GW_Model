
%NO WELLS
%%%%%%%%%%%%%%%%%%%


xmin = 476800;
xmax =487600 ; 

ymin =  4965500 ;
ymax = 4976400;




model = Model();



%need to add path to infiltration and make sure there are no duplicate
%methodsn    

refPhi = 250^2*.5*152.4; 
refz =  4.7000e+05+ 4.97e+06i;


%%initialize infiltration area and strength
gamma0 =-.0004 ;%m/day (6 inches per year)
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
mississippi = River('Elements/Rivers/miss+mn.csv');
hiawatha = Lake('Elements/Lakes/hiawatha.csv');
nokomis = Lake ('Elements/Lakes/nokomis.csv');
taft = Lake('Elements/Lakes/taft.csv');
mother =Lake('Elements/Lakes/mother.csv');
minnetonka=Lake('Elements/Lakes/minnetonka.csv'); 

mississippi.setPhi(0);
hiawatha.setPhi(247.22*247.22*.5*152.4);
nokomis.setPhi(248.09*248.09*.5*152.4);
taft.setPhi(248.59*248.59*.5*152.4);
mother.setPhi(248.54*248.54*.5*152.4);
minnetonka.setPhi(282.08*282.08*.5*152.4);

model.addRiver(mississippi);
model.addLake(nokomis);
model.addLake(hiawatha);
model.addLake(mother);
model.addLake(taft);
model.addLake(minnetonka);


b = Populate_b(model, refPhi,gamma0,L,z_infil_1, Logfac,eps,refz); 

%need to keep the strength of minnetonak constant by putting it in the B
%matrix, then move the refrence point around to get the right value along
%lake obundaries. Im close :)
A = Populate_A(model,refz);

s= A\b;
%ContourMe_R_int(xmin,xmax,400,ymin,ymax,400, @(z)real(Omega_total(z,model,s,gamma0,L,z_infil_1, Logfac,eps)),30);
mississippi.plotElement()
nokomis.plotElement()
hiawatha.plotElement()
taft.plotElement()
mother.plotElement()
minnetonka.plotElement()



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




%%incorporate allowing lake levels to change
A = Populate_A_w(model,refz,[]);
b = Populate_b_w(model, refPhi,[],Ql,gamma0,L,z_infil_1, Logfac,eps ,refz);

s2 = A\b;


%check the quality of the refrence point

miss_dif = Omega_to_phi_UNC((Omega_total_w(mississippi.LineSinks(1).mp,model,s2,[],gamma0,L,z_infil_1, Logfac,eps) - mississippi.Phi),152.4)
nokomis_dif =Omega_to_phi_UNC((Omega_total_w(nokomis.LineSinks(1).mp,model,s2,[],gamma0,L,z_infil_1, Logfac,eps) - nokomis.Phi),152.4)
hiawatha_dif =Omega_to_phi_UNC((Omega_total_w(hiawatha.LineSinks(1).mp,model,s2,[],gamma0,L,z_infil_1, Logfac,eps) - hiawatha.Phi),152.4)
taft_dif =Omega_to_phi_UNC((Omega_total_w(taft.LineSinks(1).mp,model,s2,[],gamma0,L,z_infil_1, Logfac,eps) - taft.Phi),152.4)
mother_dif=Omega_to_phi_UNC((Omega_total_w(mother.LineSinks(1).mp,model,s2,[],gamma0,L,z_infil_1, Logfac,eps) - mother.Phi),152.4)
tonka_dif =Omega_to_phi_UNC((Omega_total_w(minnetonka.LineSinks(1).mp,model,s2,[],gamma0,L,z_infil_1, Logfac,eps) - minnetonka.Phi),152.4)


%
 ContourMe_R_int(440000,490000,100,4960000,4990000,100, @(z)real(Omega_total_w(z,model,s2,[],gamma0,L,z_infil_1, Logfac,eps)),30);
%Omega_total_w(mississippi.LineSinks(1).mp,model,s2,[],gamma0,L,z_infil_1, Logfac,eps)
% %ContourMe_flow_net(476800,487600 , 400, 4965500, 4976400, 400,@(z)Omega_total_w(z,model,s2,[]),200);
% 
% mississippi.plotElement()
% nokomis.plotElement()
% hiawatha.plotElement()
% taft.plotElement()
% mother.plotElement()
% minnetonka.plotElement()


