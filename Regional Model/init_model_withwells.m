

%include wells
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%


model = Model();
 river = River('river1.csv');
river.setPhi(0 );
 model.addRiver(river);


lake = Lake('lake1.csv');
model.addLake(lake);


well1 =Well(6000,300,300,.3);
well2 =Well(6000,-300,300,.3);

wells  = Well.empty(2,0);
wells(1) = well1;
wells(2) = well2;



A = Populate_A_w(model,1000);
b = Populate_b_w(model,1000, 1000,wells,[1234]);

s = A\b;
ContourMe_flow_net(-400,400,100, -400,400,100,@(z)Omega_total_w(z,model,s,wells),500);

lake.plotElement()
river.plotElement()