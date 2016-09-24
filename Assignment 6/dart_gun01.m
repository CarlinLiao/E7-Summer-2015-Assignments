function [ coords ] = dart_gun01( n )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

coords = zeros(n,2);
coords(:,1) = randn(n,1)*10; %x-coords
coords(:,2) = randn(n,1)*10; %y-coords

end

