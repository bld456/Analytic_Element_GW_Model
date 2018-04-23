
%NO WELLS
%%%%%%%%%%%%%%%%%%%

model = Model();


refPhi = 28 * 28*.5 * 10;
refz = 1000;




mississippi = River('mississippi+Minnesota.csv');
%minnesota = River('minnesota.csv');
hiawatha = Lake('hiawatha.csv');
nokomis = Lake ('nokomis.csv');

%minnesota.setPhi(0);
mississippi.setPhi(0);
hiawatha.setPhi(35*35*.5*10);
nokomis.setPhi(35*35*.5*10);

model.addRiver(mississippi);
%model.addRiver(minnesota);
model.addLake(nokomis);
model.addLake(hiawatha);



b = Populate_b(model, refPhi); 

A = Populate_A(model,refz);

s= A\b;

ContourMe_flow_net(480000,489000 , 200, 4969000, 4982000, 200, @(z)Omega_total(z,model,s),100);
mississippi.plotElement()
%minnesota.plotElement()
nokomis.plotElement()
hiawatha.plotElement()

