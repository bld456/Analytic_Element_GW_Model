function [ Z] = Calculate_Zarray(z, nodes )
%CACLULATE_ZARRAY Summary of this function goes here
%   Detailed explanation goes here

Z=[];
for j = 1:(length(nodes)-1)
Z(j)=Calculate_Z(z,nodes(j), nodes(j+1));
end
end

