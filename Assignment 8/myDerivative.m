function [d1,d2] = myDerivative(h,yValues)
% yValues must be a vector of length >= 5
% h is the x spacing between yValues
% returns the first and second derivative of the function approximated by
% these yValues

d1 = zeros(size(yValues));
d2 = d1;

for i = 1:numel(yValues)
    if i == 1 || i == 2
        % forward derive
        d1(i) = ( -3*yValues(i) + 4*yValues(i+1) - yValues(i+2) ) / (2*h);
        d2(i) = ( 2*yValues(i) - 5*yValues(i+1) + 4*yValues(i+2) - yValues(i+3) ) / h^2;
    elseif i == numel(yValues) || i == numel(yValues)-1
        % back derive
        d1(i) = ( yValues(i-2) - 4*yValues(i-1) + 3*yValues(i) ) / (2*h);
        d2(i) = ( -yValues(i-3) + 4*yValues(i-2) - 5*yValues(i-1) + 2*yValues(i) ) / h^2;
    else
        % center derive
        d1(i) = (yValues(i-2) - 8*yValues(i-1) + 8*yValues(i+1) - yValues(i+2)) / (12*h);
        d2(i) = ( -yValues(i-2) + 16*yValues(i-1) - 30*yValues(i) + 16*yValues(i+1) - yValues(i+2) ) / (12*h^2);
    end
end


end