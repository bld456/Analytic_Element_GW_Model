
model = Model();
river = River('river1.csv');
river.setPhi(25*25*.5*10 );
model.addRiver(river);
% lake = Lake('lake1.csv');
% model.addLake(lake);
% 

refPhi = 28 * 28*.5 * 10;
refz = 1000;


b = Populate_b(model, refPhi); 

A = Populate_A(model,refz);

s= A\b;

ContourMe_flow_net(-300,300 , 300, -200, 200, 200, @(z)Omega_total(z,model,s),50);


%make omega total