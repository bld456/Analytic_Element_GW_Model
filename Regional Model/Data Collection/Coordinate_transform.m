function [ points] = Coordinate_transform( image, refrence_point, scale )
%
%{
ONLY WORKS IF X AND Y SCALE AREW THE SAME and 1:1 aspect ratio
inputs:
image - the image file 
scale - the length of the scale bar in the new coordinate system
refrence_point - the coordinates of the refrence point in the new
coordinate system, in the form x + iy

example workflow:




%}




imshow(image);
xlim;
disp('zoom map to desired area then press enter')

waitfor(gcf, 'CurrentCharacter', char(13));


x0_map = min(xlim);
xMax_map = max(xlim);

y0_map = min(ylim);
yMax_map = max(ylim);

disp('Click the location of the refrence point on the map')
[ref_x, ref_y] = ginput(1);

disp('click each end of the scale bar')
[scale_x,scale_y] = ginput(2);

disp('click each point to be transformed, hit enter when you are done')
[x,y] = ginput;

map_scale = sqrt((scale_x(1) - scale_x(2))^2 +(scale_y(1) - scale_y(2))^2);

scale_factor = scale/map_scale;
x= (x-ref_x )*scale_factor + real(refrence_point)
y= (ref_y-y )*scale_factor + imag(refrence_point) %ymax occurs at the bottom of the axis, xmax is at the far right

points = x + y*1i; % scale_value/map_value;
end

