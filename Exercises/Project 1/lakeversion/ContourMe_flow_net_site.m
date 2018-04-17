function [Grid] = ContourMe_flow_net_site(xfrom, xto, Nx, yfrom, yto, Ny, func, shift,nint)
%==========================================================================
% ContourMe_I(xfrom, xto, Nx, yfrom, yto, Ny, func)                (01.23.09)
%
%   Contour the imaginary part of the specified complex function.
%
% Arguments:
%
%   xfrom   starting x-value for the domain
%   xto     ending x-value for the domain
%   Nx      number of grid columns
%
%   yfrom   starting y-value for the domain
%   yto     ending y-value for the domain
%   Ny      number of grid rows
%
%   func    function to contour;  must take one complex argument.
%
% Returns:
%
%   Grid    Ny x Nx matrix of values of func at the rid nodes.
%
% Example Usage:
%
%   G = ContourMe_I(1,2,11,1,2,11,@(z)Omega(1,-1,z));
%==========================================================================
Grid = zeros(Ny,Nx);

X = linspace(xfrom, xto, Nx);
Y = linspace(yfrom, yto, Ny);

for row = 1:Ny
    for col = 1:Nx
        Grid(row,col) = func( complex( X(col), Y(row) ) );
    end
end

Bmax=max(imag(Grid));
Bmin=min(imag(Grid));
Cmax=max(Bmax);
Cmin=min(Bmin);
D=Cmax-Cmin;
del=D/nint;
Bmax=max(real(Grid));
Bmin=min(real(Grid));
Cmax=max(Bmax);
Cmin=min(Bmin);
D=Cmax-Cmin;
nintr=round(D/del);

figure;
hold on
contour(X, Y,real(Grid),nintr,'r');
contour(X, Y,imag(Grid),nint,'b');
legend('Equipotentials','Streamlines')

axis square
axis equal

%Burris boundary
x=[-54,234,234,210,210,-45,-45,-54,-54]-real(shift);
y=[190,190,37,-62,-86,-86,25,98,190]-imag(shift);
plot(x,real(y),'k', 'LineWidth', 4)
hold on

%Injection FTWR ehse
x= [112, 213, 213,112,112]-+real(shift);
y= [190,190,89,89,190]-imag(shift);
plot(x,real(y),'k', 'LineWidth', 2)
hold on 

%Office-Shed
x= [27,176,176,27,27]-real(shift);
y= [88,88,68,68,88]-imag(shift);
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%Burris WHSE
x= [25,56,56,159,159,187,187,56,56,25,25]-real(shift);
y= [37,37,44,44,-2,-2,-61,-61,-38,-38,37]-imag(shift);
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%Tank farm
x= [-52,-48,-10,-6,-6,-14,-30.5,-30.5,-42.5,-42.5,-52,-52]-real(shift);
y= [175,179,179,175,97,90,90,47,47,90,97,175]-imag(shift);
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%South SW drain
x= [31,36,36,31,31]-real(shift);
y= [30,30,-25,-25,30]-imag(shift);
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%Norht SW drain

x= [44,70,70,44,44]-real(shift);
y= [142,142,135,135,142]-imag(shift);
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%hold on
%contour(X, Y,real(Grid),nintr);
%contour(X, Y,imag(Grid),nint);
%axis equal