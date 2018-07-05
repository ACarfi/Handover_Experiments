function [clData] = cleanData(rawData)
%CLEANDATA Summary of this function goes here
%   Detailed explanation goes here
precAcc_t = 0;
precGyro_t = 0;

for i=1:length(rawData)
    if (rawData(i).angular_velocity(end).t - precGyro_t) > 0
        precGyro_t = rawData(i).angular_velocity(end).t;
    else
        rawData(i).angular_velocity = [];        
    end

    if (rawData(i).linear_acceleration(end).t - precAcc_t) > 0
        precAcc_t = rawData(i).linear_acceleration(end).t;
    else
        rawData(i).linear_acceleration = [];        
    end
end
clData = rawData;
end

