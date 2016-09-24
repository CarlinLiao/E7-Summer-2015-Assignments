function [muL, sigmaL, L ] = plane(Wmin,Wmax,N,M)
% Same assumptions as package.m, calculates the average, sd, and a M trials
% of the total weight on the plane.

[muW, sigmaW] = package(Wmin,Wmax);
muL = N*muW;
sigmaL = sigmaW*N/sqrt(N-1);
L = muL+randn(1,M)*sigmaL;


end

