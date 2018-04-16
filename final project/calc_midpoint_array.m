function [ midpoints ] = calc_midpoint_array(z_list  )
%CALC_MIDPOINT_ARRAY Summary of this function goes here
%   Detailed explanation goes here

midpoints = [];
for j = 1:length(z_list)-1
    midpoints(j)= (real(z_list(j))+real(z_list(j+1)))/2 +1i* (imag(z_list(j))+imag(z_list(j+1)))/2;
end

end

