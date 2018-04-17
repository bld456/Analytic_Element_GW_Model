function [ A] = Populate_A_global( Regional_model )
%POPULATE_A_GLOBAL Summary of this function goes here
%   Detailed explanation goes here

num_sinks =Regional_model.num_sinks; %+ length(Regional_model.lakes)
num_refrence = length(Regional_model.potential_specified_points(:,1));

A= nan(num_sinks+1, num_refrence+1);
A(:,num_sinks+1) =1;

for m=1:num_sinks
    for j=1:num_refrence
        z = Regional_model.potential_specified_points(1,m);
            
    
    end
end




end

