k=10;
d=100;
zs=-2*d;
ze=2*d;
Qx0=0.4;
Qx0=0;
z0=1000;
fi0=25;
Phi0=.5*k*fi0^2;
fi1=28;
Phi1=.5*k*fi1^2;

%% Solve for Strength of Line Sink
Phi_M = [Phi0;Phi0;Phi1]; %last entry is the far field 
LS_c = [-d;d;z0]; %location of each refrence point in Phi_M
alpha = 0; %angle of uniform flow relative to vertical
LS_end=[zs,0;0,ze]; %endpoints of each line sink

zw = [d+1i*d;-d+1i*d;-d-1i*d;d-1i*d];
Q = [800;00;00;00 ];
rw = [0.3;0.1;.1;.1];


b = Populate_b(Phi_M,Qx0,LS_c,alpha, zw,rw,Q );
A = Populate_A(LS_end,LS_c);

s = A\b;


ContourMe_flow_net(-300,300 , 300, -200, 200, 200, @(z)Omega_total(z,Qx0,alpha, s, LS_end,zw,rw,Q),30);

head_at_center_1 = sqrt (2* real(Omega_total(-d,Qx0,alpha, s, LS_end,zw,rw,Q))/k)

head_at_center_2 = sqrt (2* real(Omega_total(d,Qx0,alpha, s, LS_end,zw,rw,Q))/k)
head_at_refrence = sqrt(2*real(Omega_total(z0,Qx0,alpha, s, LS_end,zw,rw,Q))/k)
%% Add Well into Aquifer


%Use Case 3 (8.522)
