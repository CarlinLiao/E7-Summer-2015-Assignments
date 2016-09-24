function [ total, tally, shots ] = dart_score( n, f_dart )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

shots = f_dart(n);
dist = sqrt(sum(shots.^2,2));

tally = zeros(1,4);
% index 1 is 10 pt area
% index 2 is 5 point area
% index 3 is 1 point area
% index 4 is 0 point area

for i = 1:length(dist)
    if dist(i) < 1
        tally(1) = tally(1) + 1;
    elseif dist(i) < 5
        tally(2) = tally(2) + 1;
    elseif dist(i) < 10
        tally(3) = tally(3) + 1;
    else
        tally(4) = tally(4) + 1;
    end
end

% tally(1) = numel(find(dist<1));
% tally(2) = numel(find(dist<5 && dist>=1));
% the && here threw an error for some reason
% tally(3) = numel(find(dist<10&&dist>=5));
% tally(4) = numel(find(dist>=10));

total = sum(tally .* [10 5 1 0]);

%plotting the circles
clf
x = linspace(-10,10);
plot(x,sqrt(100-x.^2),'--k')
hold on
plot(x,-sqrt(100-x.^2),'--k')
hold on
x = linspace(-5,5,50);
plot(x,sqrt(25-x.^2),':k')
hold on
plot(x,-sqrt(25-x.^2),':k')
hold on
x = linspace(-1,1,10);
plot(x,sqrt(1-x.^2),':k')
hold on
plot(x,-sqrt(1-x.^2),':k')
hold on

scatter(shots(:,1),shots(:,2))



end
