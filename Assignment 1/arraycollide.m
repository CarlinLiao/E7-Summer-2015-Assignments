function [ output_args ] = arraycollide( A, B, N, M )
% Engineering 7 Summer 2015 Anwar
% Assignment 1 Task 3 Problem 10
% Carlin Liao

[x_A y_A] = size(A); 
[x_B y_B] = size(B);

A = reshape(A, 1, x_A*y_A); % want one row
B = reshape(B, 1, x_B*y_B);
% Combine A and B into one vector
C = [A B] ;
C = sort(C) ;

if(length(C) < M*N) ;
    C = [C zeros(1,M*N-length(C))] ;
else ;
    C = C(1:M*N) ;
end
    
C = reshape(C,M,N);
return C

end

