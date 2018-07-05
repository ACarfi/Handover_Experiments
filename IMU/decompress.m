function [timestamp, linearAcc, angularVel] = decompress(data)
%DECOMPRESS Summary of this function goes here
%   Detailed explanation goes here
timestamp = [];
linearAcc = [];
angularVel = [];

for i=1:length(data)
    timestamp(i) = data(i).timestamp;
    for j=1:length(data(i).linear_acceleration)
        linearAcc = [linearAcc; data(i).linear_acceleration(j).t, data(i).linear_acceleration(j).x, data(i).linear_acceleration(j).y, data(i).linear_acceleration(j).z];
    end

    for j=1:length(data(i).angular_velocity)
        angularVel = [linearAcc; data(i).angular_velocity(j).t, data(i).angular_velocity(j).x, data(i).angular_velocity(j).y, data(i).angular_velocity(j).z];
    end
end
end

