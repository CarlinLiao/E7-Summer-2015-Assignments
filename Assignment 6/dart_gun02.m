function [ coords ] = dart_gun02( n )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

coords = zeros(n,2);
coords(:,1) = rand(n,1)*20-10; %x-coords
coords(:,2) = rand(n,1)*20-10; %y-coords

end

