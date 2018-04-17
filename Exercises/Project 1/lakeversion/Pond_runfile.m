

K = 58.6;
Phi1=1.8 *1.8*.5* K;  %feet
l=1000; %feet
zw = 220;
rl= 15;

Qx0  = 11.5; %feet per day
Q = 18000; %cubic feet per day

shift = -10+30*i;% location of pond center

Phi0 = Phi1 + Qx0*(l- rl*rl/l)- (Q/(2*pi))*real(log((rl/(l*conj(l)))*(l-zw)/(l-rl*1/conj(zw)))); %Potential in pond necessary for infiltration = pumping
head0= sqrt(2*Phi0/K) %Head asl in pond necessary for pumping = infiltration
headNoLake = sqrt((Qx0*l+ .5*K*1.8*1.8)/(K*.5)) %The head at the site if no lake was present
ContourMe_flow_net_site(-200,400,500,-200,300,500,@(z)omega_total2(z,,zl,zw,Q,Qx0, Phi0, rl),shift,70);

%to do: coordinate transformation for plotting