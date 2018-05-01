

%include wells
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%




refPhi = 10;
refz =  10000;


%%initialize infiltration area and strength
gamma0 =0;%m/day (6 inches per year)
eps = 10^-5;
z_infil_1 = [];
z_infil_1(1)= 440000+ 1i*4960000;
z_infil_1(2)=  490000 + 1i*4960000;
z_infil_1(3)= 490000 + 1i*4990000;
z_infil_1(4)= 440000 + 1i*4990000;
z_infil_1(5)= 440000 + 1i*4960000;  
L = Calculate_Larray(z_infil_1);
Logfac = logfac(z_infil_1);







model = Model();
 river = River('Elements/Rivers/river1.csv');
river.setPhi(60);
 model.addRiver(river);


lake = Lake('Elements/Lakes/lake1.csv');
model.addLake(lake);
lake.setPhi (100);

b = Populate_b(model, refPhi,gamma0,L,z_infil_1, Logfac,eps,refz); 

%need to keep the strength of minnetonak constant by putting it in the B
%matrix, then move the refrence point around to get the right value along
%lake obundaries. Im close :)
A = Populate_A(model,refz);

s= A\b;

ContourMe_R_int(-500,500,100,-500,500,100, @(z)real(Omega_total(z,model,s,gamma0,L,z_infil_1, Logfac,eps)),30);


lake.plotElement()
river.plotElement()



for i = 1:model.nSinks

model.Sinks(i).sigma = s(i);

end


Ql = zeros(model.nLakes,1);
for i = 1:model.nLakes
    for j = 1:length(model.Lakes(i).LineSinks)
    
    Ql(i) = Ql(i) + model.Lakes(i).LineSinks(j).sigma * model.Lakes(i).LineSinks(j).L;
    end
end








%%%turn on wells


well1 =Well(0,300,300,.3);
wells  = Well.empty(0);
wells(1) = well1;




Aw = Populate_A_w(model,refz,wells);
bw = Populate_b_w(model, refPhi,Wells,Ql,gamma0,L,z_infil_1, Logfac,eps ,refz);
sw = Aw\bw;

ContourMe_R_int(-500,500,100,-500,500,100, @(z)real(Omega_total_w(z,model,sw,Wells,gamma0,L,z_infil_1, Logfac,eps)),30);

