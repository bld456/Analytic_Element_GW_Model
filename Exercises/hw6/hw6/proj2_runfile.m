Qx0 =0;
Qy0 =0;
w0 = Qx0 + 1i*Qy0;

numLakes = 2;
zl = [-100 + 100*1i; 0 + -100*1i];
rl = [100,100];

Ql = [100,100];
Phi = [100,100];

refz = 1000;
refPhi = 50;
%far field condition
alpha_rough= alpha_given_Q(zl,rl,Ql,Phi, w0);
%alpha_rough = [0;0];
c = refPhi - real(Omega_total(refz,w0,zl,rl,Ql,Phi,alpha_rough,numLakes))
ContourMe_flow_net(-300,300,200,-300,300,200, @(z)(Omega_total(z,w0,zl,rl,Ql,Phi,alpha_rough,numLakes) +c),100);

with_alpha = Omega_total(zl(1) + rl(1),w0,zl,rl,Ql,Phi,alpha_rough,numLakes) +c
alpha_rough = [0;0];
no_alpha = Omega_total(zl(1) + rl(1),w0,zl,rl,Ql,Phi,alpha_rough,numLakes) +c 