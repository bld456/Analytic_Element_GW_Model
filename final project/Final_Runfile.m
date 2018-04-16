k= 152.4; %m/day
base = 237;
thick = 80;
porosity = 0.3;
zw = 0;
Qx0 = 0;
rw = 0;
alpha = 0;
Q =0;

bottomLeft = 476800 + 1i* 4965500; %meters
topRight = 487600+ 1i*4976400; %meters
width = real(topRight - bottomLeft);
height = imag(topRight - bottomLeft);



reference_point1 = potential_specified_point;
reference_point1.z = 1000;
reference_point1.potential = 3500;

%make trial river
r= river;
r.nodes = LS_from_CSV('river1.csv');
r.Larray = Calculate_Larray(r.nodes);
r.midpoints = calc_midpoint_array(r.nodes);
r.potential = 3000;
r.sigma = ones(length(r.nodes)-1);

model = Regional_model;
model.rivers = [r];
model.reference_point = reference_point1;
model.list_potential_specified_points();

b = Populate_b (model.potential_specified_points(:,2), Qx0, model.potential_specified_points(:,1), alpha,zw,rw,Q);
%make uniform flow
%make mississipi
%make minnesota
%make hiawatha
%make nokomis
%make mother
%make diamond
%make minnetonka
