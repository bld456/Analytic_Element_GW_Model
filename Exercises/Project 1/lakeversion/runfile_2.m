K = 58.6 %ft.day
Qx0  = 11.5; %uniform flow
rl= 100; %pond radius, feet
a = 3.1415 * rl * rl %Area of pond

%Phi0= (2*Q - .2*(a)*K)/(AK-Q); %head in pond necessary to maintain infiltration rate

natural_head = 1.8 %feet
%far field
l=1000;
Phi1=sqrt((Qx0 * l + .5 * K * natural_head *natural_head)/(.5*K)) 
% 
% zw =-l/2;
% 
% Q=2*pi* (Phi1 - Phi0 + Qx0*(-l+rl*rl/l))/real(log((rl/(-l*conj(-l)))*(-l-zw)/(-l-rl*-1/conj(zw)))) %water pumped out of aquifer goes back to the pond to maintain the head
% 
% ContourMe_flow_net(-1000,1000,500,-500,500,500,@(z)omega_total2(z,zw,Q,Qx0, Phi0, rl),30);
