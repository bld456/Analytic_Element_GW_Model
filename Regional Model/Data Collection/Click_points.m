function [ points] = Click_points( image, scale , refrence_point)
%
%
%
%
%
%
%

%%


imshow(image);
x0_map = xlim(1);
xMax_map = xlim(2);

y0_map = ylim(1);
yMax_map = ylim(2);

disp('Click the refrence point')
[ref_x, ref_y] = ginput(1);

disp('click each end of the scale bar')
[scale_x,scale_y] = ginput(2);

disp('click each point of interest, hit enter when you are done')
[x,y] = ginput;

map_scale = sqrt((scale_x(1) - scale_x(2))^2 +(scale_y(1) - scale_y(2))^2);

scale_factor = scale/map_scale;
x= (x-real(refrence_point ))*scale_factor
y= (y-imag(refrence_point) )*scale_factor

points = x + y*1i; % scale_value/map_value;
end

