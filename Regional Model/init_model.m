
model = Model();
%  river = River('river1.csv');
% river.setPhi(26*26*.5*10 );
%  model.addRiver(river);
% 
% 
% lake = Lake('lake1.csv');
% model.addLake(lake);
% lake.setPhi(25*25*.5*10 );








refPhi = 28 * 28*.5 * 10;
refz = 1000;




%river = River('Data Collection//mississippi.csv')
mississippi = River('mississippi.csv');
minnesota = River('minnesota.csv');
hiawatha = Lake('hiawatha.csv');
nokomis = Lake ('nokomis.csv');
river.setPhi(0);
model.addRiver(river);




b = Populate_b(model, refPhi); 

A = Populate_A(model,refz);

s= A\b;

ContourMe_flow_net(481000,489000 , 200, 4869000, 4982000, 200, @(z)Omega_total(z,model,s),30);


%make omega total