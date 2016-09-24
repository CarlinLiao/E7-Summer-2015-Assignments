function [d1Handle,d2Handle] = derivFCN(fHandle,h)
% Differentiates function using two different approximations and outputs
% two functions / function handles

d1Handle = @(x) ( fHandle(x+h)-fHandle(x-h) )/( 2*h );
d2Handle = @(x) ( -fHandle(x+2*h)+8*fHandle(x+h)-8*fHandle(x-h)+fHandle(x-2*h) )/(12*h);

end

