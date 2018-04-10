function [Grid] = ContourMe_R_int(xfrom, xto, Nx, yfrom, yto, Ny, func,nint)
%==========================================================================
% ContourMe(xfrom, xto, Nx, yfrom, yto, Ny, func)                (01.23.09)
%
%   Contour the real part of the specified complex function.
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
%   G = ContourMe(1,2,11,1,2,11,@(z)Omega(1,-1,z));
%==========================================================================

Grid = zeros(Ny,Nx);

X = linspace(xfrom, xto, Nx);
Y = linspace(yfrom, yto, Ny);

for row = 1:Ny
    for col = 1:Nx
        Grid(row,col) = func( complex( X(col), Y(row) ) );
    end
end
contour(X, Y, real(Grid),nint);
axis equal
hold on
colorbar

%Burris boundary
x=[-54,234,234,210,210,-45,-45,-54,-54];
y=[190,190,37,-62,-86,-86,25,98,190];
plot(x,real(y),'k', 'LineWidth', 4)
hold on

%Injection FTWR ehse
x= [112, 213, 213,112,112];
y= [190,190,89,89,190];
plot(x,real(y),'k', 'LineWidth', 2)
hold on 

%Office-Shed
x= [27,176,176,27,27];
y= [88,88,68,68,88];
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%Burris WHSE
x= [25,56,56,159,159,187,187,56,56,25,25];
y= [37,37,44,44,-2,-2,-61,-61,-38,-38,37];
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%Tank farm
x= [-52,-48,-10,-6,-6,-14,-30.5,-30.5,-42.5,-42.5,-52,-52];
y= [175,179,179,175,97,90,90,47,47,90,97,175];
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%South SW drain
x= [31,36,36,31,31];
y= [30,30,-25,-25,30];
plot(x,real(y),'k', 'LineWidth', 2)
hold on 
%Norht SW drain

x= [44,70,70,44,44];
y= [142,142,135,135,142];
plot(x,real(y),'k', 'LineWidth', 2)
hold on
set(gca,'FontSize',30)

