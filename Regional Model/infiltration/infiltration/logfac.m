function [Logfac] = logfac(z_list)
%LOGFAC Summary of this function goes here
%   Detailed explanation goes here
Logfac=[];

for j = 1:length(z_list)-1
    Logfac(j)=2*log(.5*(z_list(j+1)-z_list(j)))     ;
end 
end


