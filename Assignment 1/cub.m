function [ B ] = cub( A )
% Engineering 7 Summer 2015 Anwar
% Assignment 1 Task 3 Problem 10
% Carlin Liao

B = A.^3 ;

for i = 1:length(B) 
    if(B(i) < 0)
        B(i) = 0;
    end
end


end

