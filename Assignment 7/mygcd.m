function [ gcd ] = mygcd( a, b )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% make sure that a > b
if b > a
    c = a;
    a = b;
    b = c;
end

if rem(a,b)==0
    gcd = b;
else
    gcd = mygcd(b,rem(a,b));
end


end

