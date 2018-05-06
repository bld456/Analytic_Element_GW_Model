




M = 2;
N = 5;
m =20;

Qx0 = .4;
z0 =[-120 , 120 ] ;
R = [100, 100];


Phi_lake=[150,200];

Phi0 = 50;
z_ref = -1000;



chi_far = zeros (M,1);
for mm  = 1:M
    
   chi_far(mm) = BZ_of_z(z_ref, z0(mm),R(mm));
    
end

[a ,Q,C] =solve_lakes_fulit(Qx0,Phi0,Phi_lake,M,N,m,z0,R,chi_far,z_ref) ;

ContourMe_flow_net(-400,400,100,-400,400,100,@(z)Omega_total( z, 0 ,z0, R, a, Q, z_ref, M,m, Qx0, C),500);
%ContourMe_R_int(-400,400,100,-400,400,100,@(z)Omega_total( z, 0 ,z0, R, a, Q, z_ref, M,m, Qx0, C),60);

Potential_at_lake_1 = real(Omega_total( z0(1) + R(1), 0 ,z0, R, a, Q, z_ref, M,m, Qx0, C))
Potential_at_lake_2 = real(Omega_total( z0(2) + R(2), 0 ,z0, R, a, Q, z_ref, M,m, Qx0, C))