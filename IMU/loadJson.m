function [val] = loadJson(filepath)
%LOADJSON Summary of this function goes here
%   Detailed explanation goes here
fid = fopen(filepath); 
raw = fread(fid,inf); 
str = char(raw'); 
fclose(fid); 
val = jsondecode(str);
end

