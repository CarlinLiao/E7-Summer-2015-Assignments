function simpEst = intEst(xSpace,y)
% Assumes numel(y) is an odd positive number
% Calculates integral using cumulative Simpson's rule using xSpace and y

simpEst = 0;

h = numel(y)*xSpace/6;

times2 = 0;
times4 = 0;
if numel(y) >= 4 % at least one *4 value and one *2 value
    times2 = y(3:2:numel(y)-1);
end
if numel(y) >= 3 % at least one *4 value
    times4 = y(2:2:numel(y)-1);
end
if numel(y) > 3
    laster = y(end);
else
    laster = 0;
end

simpEst = h*(y(1)+2*sum(times2)+4*sum(times4)+laster);


end

