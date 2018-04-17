function [Logfac] = logfac(z_list)
%LOGFAC Summary of this function goes here
%   Detailed explanation goes here
Logfac=[];

for j = 1:size(z_list)()-1
    for p=1:size
    Logfac(j)=2*log(.5*(z_list(j+1)-z_list(j)))     ;
end 
end


